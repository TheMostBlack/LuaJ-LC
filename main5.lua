
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "lj"
import "toast"
import "other"
import "com.androlua.LuaAdapter"
import "android.widget.Adapter"
import "java.io.File"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "com.androlua.LuaUtil"
import "android.graphics.BitmapFactory"
import "com.androlua.LuaBitmap"
import "java.io.File"


local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local ip=a:match("2(.-)"..'"')
if ip=="开" then
  颜色1=0xff303030
  颜色2=0xff212121
  颜色3=0xffffffff
  颜色4=0xffffffff
 else
  颜色1=0xffffffff
  颜色3=0xff303030
  颜色4=0xff757575
  颜色2=0xFFF2F1F6
end

layout5={
  LinearLayout;
  layout_height="fill";
  backgroundColor=颜色2;
  orientation="vertical";
  layout_width="fill";
  {
    LinearLayout;
    layout_height="56dp";
    backgroundColor=颜色1;
    layout_width="fill";
    layout_marginBottom="10dp";
    {
      ImageView;
      layout_marginLeft="20dp";
      layout_gravity="center";
      ColorFilter="0xFF03A9F4";
      src="res/AndLuaXY8.png";
      onClick=function()
        activity.finish()
      end;
      layout_width="25dp";
    };
    {
      TextView;
      text="工程属性";
      layout_marginLeft="30dp";
      layout_gravity="center";
      textColor="0xFF03A9F4";
      textSize="18sp";
    };
    {
      ImageView;
      layout_marginLeft="170dp";
      id="保存属性";
      ColorFilter="0xFF03A9F4";
      src="res/AndLuaXY9.png";
      layout_width="25dp";
      layout_gravity="center";
    };
  };
  {
    LinearLayout;
    layout_height="120dp";
    layout_width="fill";
    orientation="horizontal";
    {
      LinearLayout;
      layout_height="fill";
      gravity="center";
      orientation="vertical";
      layout_width="100dp";
      {
        CardView;
        layout_marginLeft="5dp";
        layout_height="65dp";
        radius=25;
        backgroundColor=颜色1,
        layout_width="65dp";
        CardElevation=0;
        {
          ImageView;
          id="项目图片";
          layout_height="45dp";
          src="icon.png";
          layout_width="45dp";
          layout_gravity="center";
        };
      };
    };
    {
      LinearLayout;
      layout_height="fill";
      gravity="center";
      orientation="vertical";
      layout_width="fill";
      {
        LinearLayout;
        layout_height="fill";
        gravity="center";
        orientation="vertical";
        layout_width="fill";
        {
          LinearLayout;
          layout_height="60dp";
          layout_width="fill";
          gravity="center";
          {
            CardView;
            layout_height="50dp";
            radius=25;
            backgroundColor=颜色1,
            layout_width="200dp";
            CardElevation=0;
            {
              EditText;
              text="AndLuaX+";
              layout_marginLeft="5dp";
              id="软件名称q";
              background="0";
              textColor=颜色3;
              hintTextColor=颜色3,
              layout_gravity="center";
              layout_height="50dp";
              layout_width="fill";
              singleLine="true";
              hint="请输入软件名称";
            };
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          gravity="center";
          orientation="horizontal";
          layout_width="fill";
          {
            CardView;
            radius=25;
            backgroundColor=颜色1,
            layout_marginRight="20dp";
            layout_height="50dp";
            layout_width="100dp";
            CardElevation=0;
            {
              TextView;
              textColor=颜色4,
              text="版本：";
              layout_marginLeft="4dp";
              layout_marginTop="3dp";
              textSize="10sp";
            };
            {
              EditText;
              text="1.0";
              id="软件版本w";
              background="0";
              textColor=颜色3;
              singleLine="true";
              hintTextColor=颜色3,
              textSize="12sp";
              layout_gravity="center";
              layout_height="40dp";
              layout_width="80dp";
              layout_marginTop="5dp";
              hint="请输入版本";
            };
          };
          {
            CardView;
            layout_height="50dp";
            radius=25;
            backgroundColor=颜色1,
            layout_width="100dp";
            CardElevation=0;
            {
              TextView;
              textColor=颜色4,
              text="版本号：";
              layout_marginLeft="4dp";
              layout_marginTop="3dp";
              textSize="10sp";
            };
            {
              EditText;
              text="1.0";
              id="版本号e";
              background="0";
              textColor=颜色3;
              singleLine="true";
              textSize="12sp";
              layout_gravity="center";
              layout_height="40dp";
              layout_width="80dp";
              hintTextColor=颜色3,
              layout_marginTop="5dp";
              hint="请输入版本号";
            };
          };
        };
      };
    };
  };
  {
    LinearLayout;
    layout_height="60dp";
    gravity="center";
    orientation="horizontal";
    layout_width="fill";
    {
      CardView;
      backgroundColor=颜色1,
      layout_height="50dp";
      radius=25;
      layout_width="320dp";
      CardElevation=0;
      {
        TextView;
        text="包名：";
        textColor=颜色4,
        layout_marginLeft="4dp";
        layout_marginTop="3dp";
        textSize="10sp";
      };
      {
        EditText;
        hintTextColor=颜色3,
        text="1.0";
        id="软件包名r";
        background="0";
        textColor=颜色3;
        singleLine="true";
        textSize="12sp";
        layout_gravity="center";
        layout_height="40dp";
        layout_width="290dp";
        layout_marginTop="5dp";
        hint="请输入包名";
      };
    };
  };
  {
    LinearLayout;
    gravity="center";
    layout_height="70dp";
    orientation="horizontal";
    layout_width="fill";
    layout_marginBottom="20dp";
    {
      CardView;
      radius=25;
      backgroundColor=颜色1,
      layout_marginRight="20dp";
      layout_height="50dp";
      layout_width="150dp";
      CardElevation=0;
      {
        TextView;
        textColor=颜色4,
        text="SDK：";
        layout_marginLeft="4dp";
        layout_marginTop="3dp";
        textSize="10sp";
      };
      {
        EditText;
        text="1.0";
        id="SDKt";
        hintTextColor=颜色3,
        background="0";
        textColor=颜色3;
        singleLine="true";
        textSize="12sp";
        layout_gravity="center";
        layout_height="40dp";
        layout_width="120dp";
        layout_marginTop="5dp";
        hint="请输入SDK";
      };
    };
    {
      CardView;
      radius=25;
      id="开关2";
      layout_height="50dp";
      backgroundColor="0xFF03A9F4";
      layout_width="150dp";
      CardElevation=0;
      {
        LinearLayout;
        layout_height="fill";
        gravity="center";
        layout_width="fill";
        orientation="horizontal";
        {
          LinearLayout;
          layout_height="fill";
          layout_width="90dp";
          gravity="center";
          {
            TextView;
            id="调试模式";
            text="调试模式[开]";
            textColor="0xffffffff";
          };
        };
        {
          Switch;
          focusable=false;
          clickable=false;
          id="开关1";
        };
      };
    };
  };
  {
    CardView;
    layout_marginLeft="20dp";
    radius=25;
    layout_height="44.1%h";
    layout_marginBottom="30dp";
    layout_width="320dp";
    CardElevation=0;
    {
      ListView;
      layout_height="fill";
      layout_width="fill";
      DividerHeight=0;
      id="list1";
    };
  };
};


activity.setContentView(layout5)


activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(颜色1);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
XY_1,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9=...

items={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  backgroundColor=颜色1;
  orientation="vertical";
  {
    LinearLayout;
    layout_height="35dp";
    layout_width="88.8%w";
    {
      LinearLayout;
      layout_height="fill";
      layout_width="77.7%w";
      {
        TextView;
        id="权限";
        textColor=颜色4,
        layout_marginLeft="10dp";
        layout_gravity="center";
        text="工程权限";
        textSize="15sp";
      };
    };
    {
      CheckBox;
      id="开关";
      focusable=false;
      clickable=false;
      layout_gravity="center";
    };
  };
};

权限1={"访问大致位置信息(以网络为依据)","访问确切位置信息(以GPS和网络为依据)","查看网络连接","查看WiFI连接","ANSWER_PHONE_CALLS","android.permission.BATTERY_STATS","辅助功能","与蓝牙设备配对","访问蓝牙设置","直接拨打电话号码","拍摄照片和视频","更改网络连接性","连接WIFI网络和断开连接","android.permissions.CLEAR_APP_CACHE","直接下载文件而不显示通知","FOREGROUND_SERVICE","计算应用储存空间","检索正在运行的应用","安装快捷方式","拥有完全的网络访问权限","关闭其他应用","读取通话记录","读取您的通讯录","读取您的SD卡中的内容","android.permissions.READ_FRAME_BUFFER","android.permissions.READ_LOGS","读取手机状态和身份","读取您的讯息(短信或短信)"
  ,"录音","请求安装文件包","发送短信","设置壁纸","出现在其他应用","控制振动","防止手机休眠","写入/删除通话记录","写入/删除通讯录","修改或删除您SD卡中的内容","修改系统设置","android.permission.WRITE.SMS"}
对应权限={"ACCESS_COARSE_LOCATION",
  "ACCESS_FINE_LOCATION",
  "ACCESS_NETWORK_STATE",
  "ACCESS_WIFI_STATE",
  "ANSWER_PHONE_CALLS",
  "BATTERY_STATS",
  "BIND_ACCESSIBILITY_SERVICE",
  "BLUETOOTH",
  "BLUETOOTH_ADMIN",
  "CALL_PHONE",
  "CAMERA",
  "CHANGE_NETWORK_STATE",
  "CHANGE_WIFI_STATE",
  "CLEAR_APP_CACHE",
  "DOWNLOAD_WITHOUT_NOTIFICATION",
  "FOREGROUND_SERVICE",
  "GET_PACKAGE_SIZE",
  "GET_TASKS",
  "INSTALL_SHORTCUT",
  "INTERNET",
  "KILL_BACKGROUND_PROCESSES",
  "READ_CALL_LOG",
  "READ_CONTACTS",
  "READ_EXTERNAL_STORAGE",
  "READ_FRAME_BUFFER",
  "READ_LOGS",
  "READ_PHONE_STATE",
  "READ_SMS",
  "RECORD_AUDIO",
  "REQUEST_INSTALL_PACKAGES",
  "SEND_SMS",
  "SET_WALLPAPER",
  "SYSTEM_ALERT_WINDOW",
  "VIBRATE",
  "WAKE_LOCK",
  "WRITE_CALL_LOG",
  "WRITE_CONTACTS",
  "WRITE_EXTERNAL_STORAGE",
  "WRITE_SETTINGS",
  "WRITE_SMS",}
data={}
adp=LuaAdapter(activity,data,items)
list1.Adapter=adp
for i=1,#权限1 do
  table.insert(data,{权限={Text=权限1[i]},开关={Checked=false},})
  if XY_1==true then
    if x0:find('"'..对应权限[i]..'"') then
      data[i].开关["Checked"]=true end
  end
end

local context=activity or service

local LuaBitmap=luajava.bindClass "com.androlua.LuaBitmap"
local function loadbitmap(path)
  if not path:find("^https*://") and not path:find("%.%a%a%a%a?$") then
    path=path..".png"
  end
 if path:find("^https*://") then
    return LuaBitmap.getHttpBitmap(context,path)
 elseif not path:find("^/") then
    return LuaBitmap.getLocalBitmap(context,string.format("%s/%s",luajava.luadir,path))
 else
    return LuaBitmap.getLocalBitmap(context,path)
  end
end

if XY_1==true then
 if File(项目文件夹.."/"..x9.."/icon.png").isFile() then
    项目图片.setImageBitmap(loadbitmap(项目文件夹.."/"..x9.."/icon.png"))
  end
  软件名称q.text=x1
  软件版本w.text=x2
  版本号e.text=x3
  SDKt.text="15"
  软件包名r.text=x4
  if x6=="开" then
    开关1.Checked=true
    调试模式.text="调试模式[开]"
   else
    开关1.Checked=false
    调试模式.text="调试模式[关]"
  end
end
function NoInput(view,boole) 
EditUtli.Inpot(view,boole)
end
NoInput(SDKt,false)
function strippath(filename)
    return string.match(filename, ".+/([^/]*%.%w+)$")
  end
  function stripextension(filename)
    local idx = filename:match(".+()%.%w+$")
    if(idx) then
      return filename:sub(1, idx-1)
     else
      return filename
    end
  end
tpzt=false
tplj=nil
function 项目图片.onClick()
  import "android.content.Intent"
  local intent= Intent(Intent.ACTION_PICK)
  intent.setType("image/*")
  this.startActivityForResult(intent, 1)
  

  
  function onActivityResult(requestCode,resultCode,intent)
    if intent then
      local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
      cursor.moveToFirst()
      import "android.provider.MediaStore"
      local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
      fileSrc = cursor.getString(idx)
      bit=nil
      
      
      bit =BitmapFactory.decodeFile(fileSrc)
      if fileSrc:find("%.png$") then
        tpzt=true
        tplj=fileSrc
        项目图片.setImageBitmap(loadbitmap(fileSrc))
       
      
        else
        print"请选择png图片"
      end
    end
  end
end
开关1.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0x3CECEFF0,PorterDuff.Mode.SRC_ATOP));
function 开关2.onClick()
  if 开关1.Checked then
    开关1.Checked=false
    调试模式.text="调试模式[关]"
   else
    开关1.Checked=true
    调试模式.text="调试模式[开]"
  end
end

list1.onItemClick=function(l,v,p,i)
  if data[i].开关["Checked"] then
    data[i].开关={Checked=false}
   else
    data[i].开关={Checked=true}
  end
  adp.notifyDataSetChanged()
end

function 转换(t)
  for k,v in ipairs(t) do
    t[k]=string.format("%q",v)
  end
  return table.concat(t,",\n  ")
end
function 保存属性.onClick()
  sss=[[
  app_name="%s"
  package_name="%s"
  ver_code="%s"
  ver_name="%s"
  app_sdk="%s"
  debug_mode=%s
  user_permission={
   %s
  }
]]
  ssr={}
  for i=1,#data do
    if data[i].开关["Checked"] then
      table.insert(ssr,对应权限[i])
    end
  end
  sst=转换(ssr)
  q0=sss:format(软件名称q.text,软件包名r.text,软件版本w.text,版本号e.text,"15",开关1.Checked,sst)
  if tpzt==true then
    if File(项目文件夹.."/"..x9.."/"..a).isFile() then
      os.remove(项目文件夹.."/"..x9.."/"..a)
      local a=File(tplj).getName()
      LuaUtil.copyDir(tplj,项目文件夹.."/"..x9.."/"..a)
      os.rename(项目文件夹.."/"..x9.."/"..a,项目文件夹.."/"..x9.."/icon.png")
     else
      local a=File(tplj).getName()
      LuaUtil.copyDir(tplj,项目文件夹.."/"..x9.."/"..a)
      os.rename(项目文件夹.."/"..x9.."/"..a,项目文件夹.."/"..x9.."/icon.png")
    end
   else
    写入文件(x8,q0)
    os.rename(项目文件夹.."/"..x9,项目文件夹.."/"..软件名称q.text)
  end
  print"保存成功"
  activity.result{true}
end