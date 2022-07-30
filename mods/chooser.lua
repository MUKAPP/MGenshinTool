require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

function ChooseFile(type,event)
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.net.URLDecoder"
  import "java.io.File"
  local intent=Intent()
  intent.setType(type);
  intent.setAction(Intent.ACTION_PICK);
  this.startActivityForResult(intent,0);

  --回调
  function onActivityResult(p1,p2,p3)
    if p2==-1 then--判斷是否選擇了圖片
      uri=tostring(p3.getData())--轉成字符串
      if uri:match("file://(.+)") then--判斷是否有file://
        event(uri:gsub("file://",""))
       else--沒有file://就讀取uri獲得bitmap直接設置
        local cursor =this.getContentResolver ().query(p3.getData(), nil, nil, nil, nil)
        cursor.moveToFirst()
        import "android.provider.MediaStore"
        local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
        fileSrc = cursor.getString(idx)
        event(fileSrc)
      end
    end
  end
end
