import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.app.*"
import "android.graphics.Typeface"
import "android.content.Intent"
import "android.content.Context"
import "android.content.pm.PackageManager"
import "android.graphics.drawable.ColorDrawable"
import "android.content.Intent"
import "java.io.File"
import "other"
import "Dialog"
import "toast"
import "main6"
import "com.androlua.LuaAdapter"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.drawable.GradientDrawable"
import "com.androlua.LuaUtil"

title,StartPath,filterTypes=...
local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local ip=a:match("2(.-)"..'"')
if ip=="开" then
  颜色1=0xff303030
  颜色2=0xff212121
  颜色3=0xffffffff
  颜色4=0xffffffff
  颜色5=0xff303030
  颜色6=0x5FFFFFFF
 else
  颜色1=0xFF03A9F4
  颜色3=0xff303030
  颜色4=0xffffffff
  颜色5=0x5FFFFFFF
  颜色2=0xFFF2F1F6
  颜色6=0xff303030
end
item={
  import "android.widget.*";
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  {
    LinearLayout;
    layout_width="match_parent";
    layout_height="70dp";
    gravity="center";
    {
      CardView;
      radius=25;
      layout_height="50dp";
      layout_width="340dp";
      CardElevation="0dp";
      backgroundColor="0xffffffff";
      {
        LinearLayout;
        orientation="horizontal";
        layout_width="match_parent";
        layout_height="match_parent";
        {
          ImageView;
          src="file.png";
          layout_marginLeft="10dp";
          layout_gravity="center";
          id="img";
        };
        {
          TextView;
          layout_height="20dp";
          id="file";
          layout_marginLeft="10dp";
          layout_width="250dp";
          layout_gravity="center";
        };
      };
    };
  };
};
layout={
import "android.widget.*";
  LinearLayout;
  backgroundColor="0xFFF2F1F6";
  layout_height="fill";
  orientation="vertical";
  layout_width="fill";
  {
    LinearLayout;
    backgroundColor="0xffffffff";
    layout_height="56dp";
    orientation="vertical";
    layout_width="match_parent";
    {
      TextView;
      layout_marginTop="5dp";
      text="选择源码(*.alp)";
      layout_marginLeft="10dp";
      textSize="16sp";
      textColor="0xFF03A9F4";
    };
    {
      TextView;
      layout_marginTop="5dp";
      layout_marginLeft="10dp";
      singleLine=true;
      textColor="0xFF03A9F4";
      text="路径";
      focusable=true;
      ellipsize="marquee";
      layout_width="300dp";
      focusableInTouchMode=true;
      id="cp";
    };
  };
  {
    LinearLayout;
    layout_height="match_parent";
    layout_width="match_parent";
    {
      ListView;
      id="lv",
      layout_height="match_parent";
      DividerHeight=0;--设置无隔断线
      layout_width="match_parent";
    };
  };
};
activity.setContentView(layout)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xffffffff);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
--导入类
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
import "android.graphics.Typeface"
local Text_Type=Typeface.defaultFromStyle(Typeface.BOLD)
local sd = StateListDrawable()
import "android.graphics.Color"
import "android.content.res.ColorStateList"
import "android.graphics.drawable.RippleDrawable"
import "android.content.Context"
appt={C_Bacgg=function(mBinding,radiu,InsideColor,S,S2,T1)
    local drawable = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,{});
    drawable.setCornerRadius(radiu);
    drawable.setColor(颜色5)
    drawable.setStroke(3, 0xCFB0B0B0)
    drawable.setGradientType(GradientDrawable.RECTANGLE);
    mBinding.setTextColor(T1)
    mBinding.setTypeface(Text_Type)
    return drawable
end}
美化按钮1=function(mBinding,radiu,InsideColor,T1)
  stateList = {
    {android.R.attr.state_pressed},
    {android.R.attr.state_focused},
    {android.R.attr.state_activated},
    {android.R.attr.selectableItemBackground},
  };
  sd.addState({ android.R.attr.state_enabled}, appt.C_Bacgg(mBinding,radiu,InsideColor,S,S2,T1))
  pressedColor =InsideColor --Color.parseColor("#7ab946ff");
  stateColorList ={
    pressedColor,
    pressedColor,
    pressedColor,
    normalColor
  };
  colorStateList = ColorStateList(stateList, stateColorList);
  rippleDrawable = RippleDrawable(colorStateList,sd,nil);
  mBinding.setBackground(rippleDrawable);
end

function getExtension(str)
    return str:match(".+%.(%w+)$")
  end
import "android.widget.ArrayAdapter"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "java.io.File"
import "android.widget.ListView"
import "android.app.AlertDialog"
function ChoicePath(StartPath,callback)
  data={}
  adp=LuaAdapter(activity,data,item)
  lv.setAdapter(adp)
  function SetItem(path)
    path=tostring(path)
    adp.clear()--清空适配器
    cp.Text=tostring(path)--设置当前路径
    switch path
      case "/"
      
      case "/storage/emulated/0"
      
      default
      adp.add{file="返回上级目录",img="folder.png"}
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果是文件夹则
        adp.add{file=c.Name,img=loadbitmap(activity.getLuaDir().."/folder.png")}
       elseif c.isFile() then--如果是文件则
        adp.add{file=c.Name,img=loadbitmap(activity.getLuaDir().."/file.png")}
      end
    end
  end
  lv.onItemClick=function(l,v,p,s)--列表点击事件
    项目=tostring(v.tag.file.Text)
    switch tostring(cp.Text)
      case "/storage/emulated/0"
      路径=ls[p+1]
     default
      路径=ls[p]
    end

    switch 项目
      case "返回上级目录"
      SetItem(File(cp.Text).getParentFile())
     default
     switch 路径.isDirectory()
       case true
      SetItem(路径)
     default
     switch 路径.isFile()
       case true
      switch getExtension(tostring(路径))
    case "alp"
    
  local sc={
        CardView;
        radius=30;
        layout_width="match_parent";
        --orientation="vertical";
        layout_height="match_parent";
        {
          CardView;
          layout_gravity="center";
          layout_height="280dp";
          layout_width="match_parent";
          backgroundColor=颜色2,
          radius=20;
          {
            TextView;
            layout_marginLeft="25dp";
            layout_marginTop="10dp";
            textSize="20sp";
            textColor="0xFF03A9F4";
            text="提示";
          };
          {
            TextView;
            textSize="15sp";
            textColor=颜色6,
            layout_marginLeft="25dp";
            text="是否导入此工程？";
            layout_marginTop="45dp";
          };
          {
            LinearLayout;
            layout_marginBottom="50dp";
            layout_gravity="bottom";
            layout_marginTop="20dp";
            layout_width="match_parent";
            layout_height="50dp";
            {
              Button;
              text="取消";
              layout_gravity="center";
              layout_marginLeft="20dp";
              id="取消导入工程";
              layout_height="40dp";
            };
            {
              LinearLayout;
              layout_width="match_parent";
              gravity="right";
              layout_height="match_parent";
              {
                Button;
                layout_marginRight="20dp";
                layout_gravity="center";
                text="导入";
                layout_height="40dp";
                id="确定导入工程";
              };
            };
          };
        };
      };

      dialog2= AlertDialog.Builder(this)
      dialog3=dialog2.show()
      dialog3.getWindow().setContentView(loadlayout(sc));
      dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
      local dialogWindow = dialog3.getWindow();
      dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  美化按钮1(取消导入工程,10,0x7E000000,0x7E000000)
      美化按钮1(确定导入工程,10,0x7a00bfff,0x7a00bfff)
       function 取消导入工程.onClick()
        dialog3.dismiss()
      end
      function 确定导入工程.onClick()
        import "java.io.File"   
        local a=File(tostring(路径)).getName()
        local b=a:match("(.-).alp")
        local c=项目文件夹.."/"..a
        local d=项目文件夹.."/"..b..".zip"
        local e=项目文件夹.."/"..b
        LuaUtil.copyDir(tostring(路径),c)
        File(c).renameTo(File(d))
        LuaUtil.unZip(d,e)
        os.remove(d)
        dialog3.dismiss()
        activity.result{true}
      end
    default
    print"暂不支持导入此工程"
    end
    end
end
end
  end

  SetItem(StartPath)
end



ChoicePath("/storage/emulated/0",
function(path)
  
end)