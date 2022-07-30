--[[
Easy Qiniu Lua SDK


Module: qiniu_sha1.lua


Author: LIANG Tao
Weibo:  @无锋之刃
Email:  amethyst.black@gmail.com
        liangtao@qiniu.com


Wiki:   http://en.wikipedia.org/wiki/SHA-1
--]]

require "import"

sha1 = (function ()
  local t = {}
  local mt = {}


  local CHUNK_SIZE = 64
  local MSG_PADDING = "\x80" .. string.rep("\x00", 63)
  local ZERO_PADDING = string.rep("\x00", 56)


  local function __pack_in_big_endian(bytes, ...)
    local vals = {...}
    local tmp = {}
    for i = 1, #vals, 1 do
      local val = vals[i]
      for j = bytes, 1, -1 do
        local ord = bit32.band(val, 0xFF)
        tmp[(i - 1) * bytes + j] = string.char(ord)
        val = math.floor(val / 256)
      end -- for
    end -- for
    return table.concat(tmp)
  end -- __pack_in_big_endian


  local function __unpack_in_big_endian(bytes, msg)
    local ret = {}
    for i = 1, string.len(msg), bytes do
      local val = 0
      for j = 1, bytes, 1 do
        val = bit32.bor(bit32.lshift(val, 8), msg:byte(i - 1 + j))
      end -- for
      ret[#ret+1] = val
    end -- for
    return ret
  end -- __unpack_in_big_endian


  local function __mod_add(...)
    local vals = {...}
    local sum = 0
    for i = 1, #vals, 1 do
      sum = bit32.band((sum + vals[i]), 0xFFFFFFFF)
    end -- for
    return sum
  end -- __mod_add


  local function __calc(self, msg)
    local w = __unpack_in_big_endian(4, msg)
    for i = 17, 80, 1 do
      local tmp = bit32.bxor(w[i-3], w[i-8], w[i-14], w[i-16])
      w[i] = bit32.lrotate(tmp, 1)
    end -- for


    local a = self.hash[1]
    local b = self.hash[2]
    local c = self.hash[3]
    local d = self.hash[4]
    local e = self.hash[5]


    for i = 1, 80, 1 do
      local f = 0
      local k = 0


      if 1 <= i and i <= 20 then
        f = bit32.bor(
        bit32.band(b, c),
        bit32.band(bit32.bnot(b), 0xFFFFFFFF, d)
        )
        k = 0x5A827999
      end
      if 21 <= i and i <= 40 then
        f = bit32.bxor(b, c, d)
        k = 0x6ED9EBA1
      end
      if 41 <= i and i <= 60 then
        f = bit32.bor(
        bit32.band(b, c),
        bit32.band(b, d),
        bit32.band(c, d)
        )
        k = 0x8F1BBCDC
      end
      if 61 <= i and i <= 80 then
        f = bit32.bxor(b, c, d)
        k = 0xCA62C1D6
      end


      local temp = __mod_add(bit32.lrotate(a, 5), f, e, k, w[i])
      e = d
      d = c
      c = bit32.lrotate(b, 30)
      b = a
      a = temp
    end -- for


    self.hash[1] = __mod_add(self.hash[1], a)
    self.hash[2] = __mod_add(self.hash[2], b)
    self.hash[3] = __mod_add(self.hash[3], c)
    self.hash[4] = __mod_add(self.hash[4], d)
    self.hash[5] = __mod_add(self.hash[5], e)
  end -- __calc


  function mt.__index(table, key)
    return rawget(mt, key)
  end -- mt.__index


  function mt:write(msg)
    local msg_type = type(msg)
    if msg_type ~= 'string' then
      return self
    end


    if msg:len() == 0 then
      return self
    end


    self.msg_len = self.msg_len + msg:len()
    msg = self.remainder .. msg


    local msg_len = msg:len()
    if msg_len < CHUNK_SIZE then
      self.remainder = msg
      return self
    end


    self.remainder = ""
    local pos = 1
    while pos <= msg_len do
      if msg_len - pos + 1 < CHUNK_SIZE then
        self.remainder = msg:sub(pos)
        break
      end
      __calc(self, msg:sub(pos, CHUNK_SIZE))
      pos = pos + CHUNK_SIZE
    end -- while


    return self
  end -- mt:write


  function mt:sum(msg)
    self:write(msg)
    local last_msg = self.remainder .. MSG_PADDING


    if CHUNK_SIZE < (self.remainder:len() + 1 + 8) then
      __calc(self, last_msg:sub(1, CHUNK_SIZE))
      last_msg = ZERO_PADDING
     else
      last_msg = last_msg:sub(1, 56)
    end


    local msg_bits_len = self.msg_len * 8
    last_msg = last_msg .. __pack_in_big_endian(8, msg_bits_len)
    __calc(self, last_msg)
    local ret = __pack_in_big_endian(
    4,
    self.hash[1],
    self.hash[2],
    self.hash[3],
    self.hash[4],
    self.hash[5]
    )
    return ret
  end -- mt:sum


  local HEX_MAP = {
    [0]='0', [1]='1', [2]='2', [3]='3',
    [4]='4', [5]='5', [6]='6', [7]='7',
    [8]='8', [9]='9', [10]='a', [11]='b',
    [12]='c', [13]='d', [14]='e', [15]='f'
  }


  function mt:hex(msg)
    local ret = self:sum(msg)
    local hex = {}
    for i = 1, string.len(ret), 1 do
      local ord = ret:byte(i)
      local high = bit32.extract(ord, 4, 4)
      local low = bit32.extract(ord, 0, 4)
      hex[#hex+1] = HEX_MAP[high]
      hex[#hex+1] = HEX_MAP[low]
    end -- for
    return table.concat(hex)
  end -- mt:hex_sum


  function mt:reset()
    self.msg_len = 0
    self.remainder = ""
    self.hash = {
      0x67452301,
      0xEFCDAB89,
      0x98BADCFE,
      0x10325476,
      0xC3D2E1F0
    }
    return self
  end -- mt:reset


  function mt:chunk_size()
    return CHUNK_SIZE
  end -- mt:chunk_size


  function t.new()
    local self = {}
    setmetatable(self, mt)
    self:reset()
    return self
  end -- t.new


  return t
end)()


--[[
print(sha1.new():hex("1"))
print(qiniu_sha1.new():hex_sum("abc"))
print(qiniu_sha1.new():hex_sum(""))
print(qiniu_sha1.new():hex_sum(string.rep("1", 55)))
print(qiniu_sha1.new():hex_sum(string.rep("9", 63)))
print(qiniu_sha1.new():hex_sum(string.rep("0", 64)))
print(qiniu_sha1.new():hex_sum(string.rep("D", 68)))
--]]