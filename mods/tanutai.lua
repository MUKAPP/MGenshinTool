require "import"

import "mods.sha"

import "com.kn.okhtttp.*"
import "okhttp3.*"

import "okhttp3.Request"

TagHandler=nil

import "io.noties.markwon.*"
import "io.noties.markwon.core.*"
import "io.noties.markwon.image.glide.*"
import "io.noties.markwon.ext.strikethrough.*"
import "io.noties.markwon.ext.tables.*"
import "io.noties.markwon.ext.tasklist.*"
import "io.noties.markwon.html.*"
import "io.noties.markwon.linkify.*"
import "io.noties.markwon.movement.*"
import "io.noties.markwon.utils.*"
import "io.noties.markwon.inlineparser.*"
import "io.noties.markwon.ext.latex.*"
import "io.noties.markwon.html.tag.*"
import "io.noties.markwon.html.tag.SimpleTagHandlerImpl$CallBack"

import "me.saket.bettermovementmethod.*"

local api={}
api.rooturl="https://tanutai.mukapp.top/"
api.apiurl=api.rooturl.."api/"

--验证码
api.captcha=function(ret,err)
  Http.post(
  api.apiurl.."captchas",
  {},
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--获取token
api.login=function(name,password,
  device,ct,cc,ret,err)
  Http.post(
  api.apiurl.."tokens",
  {
    ["name"]=name,
    ["password"]=password,
    ["device"]=device,
    ["captcha_token"]=ct,
    ["captcha_code"]=cc,
  },
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--获取话题
api.topic=function(ret,err)
  Http.get(
  api.apiurl.."topics",
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--上传图片 有点问题
api.uploadImage=function(token,img,ret,err)
  local img=File(img)
  OkTest.newok()
  .newCall(
  Request.Builder()
  .header("token",token)
  .url(api.apiurl.."images")
  .post(
  MultipartBody.Builder()
  .setType(MultipartBody.FORM)
  .addFormDataPart("image",tostring(img.Name),RequestBody.create(MediaType.parse("multipart/form-data"), img))
  --.addFormDataPart("token",token)
  .build()
  )
  .build()
  )
  .enqueue(Callback{
    onFailure=function(call, e)--请求失败
      err(10001,e)
    end,
    onResponse=function(call, response)--请求成功
      local code=response.code()--.toString()
      local header=response.headers()
      local content=String(response.body().bytes()).toString()

      if code==200 then
        local content=JSON.decode(content)
        ret(content)
       else
        err(code,content)
      end

      --thread(function()call("ret",content)end)
    end
  });

end

--获取用户信息
api.user=function(include,ret,err)
  local map = HashMap()
  map.put("token",mukactivity.getData("tanutai_token"))

  Http.get(
  api.apiurl.."user?include="..include,nil,nil,
  map,
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--获取文章
api.articles=function(page,order,include,ret,err)
  local map = HashMap()
  map.put("token",mukactivity.getData("tanutai_token"))

  Http.get(
  api.apiurl.."articles?page="..page.."&order="..order..
  "&include="..include,nil,nil,
  map,
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--获取问答
api.questions=function(page,order,include,ret,err)
  local map = HashMap()
  map.put("token",mukactivity.getData("tanutai_token"))

  Http.get(
  api.apiurl.."questions?page="..page.."&order="..order..
  "&include="..include,nil,nil,
  map,
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--注册邮件
api.sendRegisterEmail=function(email,ct,cc,ret,err)
  Http.post(
  api.apiurl.."user/register/email",
  {
    ["email"]=email,
    ["captcha_token"]=ct,
    ["captcha_code"]=cc,
  },
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--注册
api.register=function(email,ec,username,password,ret,err)
  Http.post(
  api.apiurl.."users",
  {
    ["email"]=email,
    ["email_code"]=ec,
    ["username"]=username,
    ["password"]=password,
  },
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--点赞/踩
api.articlesVoters=function(article_id,type,ret,err)
  if type then
    local map = HashMap()
    map.put("token",mukactivity.getData("tanutai_token"))

    Http.post(
    api.apiurl.."articles/"..article_id.."/voters",
    {
      "type":type,
    },nil,nil,
    map,
    function(code,content)
      if code==200 then
        local content=JSON.decode(content)
        ret(content)
       else
        err(code,content)
      end
    end)
   else
    local map = HashMap()
    map.put("token",mukactivity.getData("tanutai_token"))

    Http.delete(
    api.apiurl.."articles/"..article_id.."/voters",nil,nil,
    map,
    function(code,content)
      if code==200 then
        local content=JSON.decode(content)
        ret(content)
       else
        err(code,content)
      end
    end)
  end
end

--发表文章
api.createArticle=function(title,topic_ids,content_markdown,ret,err)
  local map = HashMap()
  map.put("token",mukactivity.getData("tanutai_token"))
  map.put("Content-Type","application/json")

  Http.post(
  api.apiurl.."articles",
  JSON.encode{
    ["title"]=title,
    ["topic_ids"]={tointeger(topic_ids)},
    ["content_markdown"]=content_markdown,
  },nil,nil,
  map,
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end

--获取文章评论
api.getComments=function(article_id,page,order,include,ret,err)
  local map = HashMap()
  map.put("token",mukactivity.getData("tanutai_token"))

  Http.get(
  api.apiurl.."articles/"..article_id.."/comments?page="..page.."&order="..order..
  "&include="..include,nil,nil,
  map,
  function(code,content)
    if code==200 then
      local content=JSON.decode(content)
      ret(content)
     else
      err(code,content)
    end
  end)
end


tanutai=api