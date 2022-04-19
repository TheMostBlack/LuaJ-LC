
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "lj"
import "java.io.File"

import "other"

import "color"
import "color1"
import "main10"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "Dialog"
import "toast"
import "com.androlua.Ticker"
import "com.androlua.LuaAdapter"
import "com.androlua.LuaEditor"
import "com.androlua.LuaUtil"
import "java.util.zip.ZipOutputStream"
import "android.net.Uri"
import "java.io.File"
import "android.widget.Toast"
import "java.util.zip.CheckedInputStream"
import "java.io.FileInputStream"
import "android.content.Intent"
import "java.security.Signer"
import "java.util.ArrayList"
import "java.io.FileOutputStream"
import "java.io.BufferedOutputStream"
import "java.util.zip.ZipInputStream"
import "java.io.BufferedInputStream"
import "java.util.zip.ZipEntry"
import "android.app.ProgressDialog"
import "java.util.zip.CheckedOutputStream"
import "java.util.zip.Adler32"
import "com.androlua.LuaUtil"
import "com.androlua.LuaDrawable"
import "java.io.FileInputStream"
import "android.graphics.drawable.GradientDrawable"
import "android.graphics.Typeface"




local version = luajava.bindClass("android.os.Build").VERSION.SDK_INT;
local h=tonumber(os.date("%H"))

if version >= 21 then
if h<=6 or h>=22 then

颜色1=0xffffffff
颜色3=0xff303030
颜色4=0xff757575
颜色2=0xFFF2F1F6
颜色6=0xff757575
颜色5=0x5FFFFFFF
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_NoActionBar)
else
颜色1=0xffffffff
颜色3=0xff303030
颜色4=0xff757575
颜色2=0xFFF2F1F6
颜色6=0xff757575
颜色5=0x5FFFFFFF
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_NoActionBar)
end
else
if h<=6 or h>=22 then
颜色1=0xff303030
颜色2=0xff212121
颜色3=0xffffffff
颜色4=0xffffffff
颜色6=0xffffffff
颜色5=0xff212121
activity.setTheme(android.R.style.Theme_DeviceDefault_NoActionBar)
else
颜色1=0xff303030
颜色2=0xff212121
颜色3=0xffffffff
颜色4=0xffffffff
颜色6=0xffffffff
颜色5=0xff212121
activity.setTheme(android.R.style.Theme_DeviceDefault_NoActionBar)
end
end

local function ps(str)
str = str:gsub("%b\"\"",""):gsub("%b\'\'","")
local _,f= str:gsub ('%f[%w]function%f[%W]',"")
local _,t= str:gsub ('%f[%w]then%f[%W]',"")
local _,i= str:gsub ('%f[%w]elseif%f[%W]',"")
local _,d= str:gsub ('%f[%w]do%f[%W]',"")
local _,e= str:gsub ('%f[%w]end%f[%W]',"")
local _,r= str:gsub ('%f[%w]repeat%f[%W]',"")
local _,u= str:gsub ('%f[%w]until%f[%W]',"")
local _,a= str:gsub ("{","")
local _,b= str:gsub ("}","")
return (f+t+d+r+a)*4-(i+e+u+b)*4
end


local function _format()
local p=0
return function(str)
str=str:gsub("[ \t]+$","")
str=string.format('%s%s',string.rep(' ',p),str)
p=p+ps(str)
return str
end
end


function format(Text)
local t=os.clock()
local Format=_format()
Text=Text:gsub('[ \t]*([^\r\n]+)',function(str)return Format(str)end)
print('操作完成,耗时:'..os.clock()-t)
return Text
end


function build(path)
if path then
local str,st=loadfile(path)
if st then
return nil,st
end
local path=path..'c'

local st,str=pcall(string.dump,str,true)
if st then
f=io.open(path,'wb')
f:write(str)
f:close()
return path
else
os.remove(path)
return nil,str
end
end
end

function build_aly(path2)
if path2 then
local f,st=io.open(path2)
if st then
return nil,st
end
local str=f:read("*a")
f:close()
str=string.format("local layout=%s\nreturn layout",str)
local path=path2..'c'
str,st=loadstring(str,path2:match("[^/]+/[^/]+$"),"bt")
if st then
return nil,st:gsub("%b[]",path2,1)
end

local st,str=pcall(string.dump,str,true)
if st then
f=io.open(path,'wb')
f:write(str)
f:close()
return path
else
os.remove(path)
return nil,str
end
end
end

attrsArray = { android.R.attr.selectableItemBackgroundBorderless }
typedArray =activity.obtainStyledAttributes(attrsArray)

ripple=typedArray.getResourceId(0, attrsArray[1]);

typedArray.recycle();

layout2={
LinearLayout;
layout_width="fill";
orientation="vertical";
layout_height="fill";
backgroundColor=颜色1;
{
RelativeLayout;
layout_width="match_parent";
layout_height="match_parent";

{
LinearLayout;
backgroundColor=颜色1;
orientation="horizontal";
layout_width="fill";
layout_height="60dp";
{
ImageView;
src="res/AndLuaXY1.png";
id="其他1x";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="13dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
LinearLayout;
layout_width="100dp";
orientation="vertical";
layout_height="fill";
layout_marginLeft="10dp";
gravity="center";

{
TextView;
textSize="18sp";
textColor="0xFF03A9F4";
layout_marginLeft="10dp";
singleLine=true;
id="xy22";
ellipsize="marquee";
focusable=true;
focusableInTouchMode=true;
layout_width="90dp";
text="编辑器";
};
{
TextView;
layout_width="70dp";
textColor="0xFF03A9F4";
focusableInTouchMode=true;
singleLine=true;
id="xy33";
ellipsize="marquee";
layout_marginTop="2dp";
focusable=true;
text="main.lua";
};
};

{
ImageView;
src="res/color.png";
id="调色";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="10dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
ImageView;
src="res/AndLuaXY3.png";
id="运行";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="17dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
ImageView;
src="res/AndLuaXY4.png";
id="撤销";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="17dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
ImageView;
src="res/AndLuaXY5.png";
id="恢复";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="17dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
ImageView;
src="res/AndLuaXY6.png";
id="其他2x";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="17dp";
layout_height="30dp";
backgroundResource=ripple,
};
};
{
LinearLayout;
layout_width="fill";
id="选择代码1";
visibility=8;
backgroundColor=颜色1;
layout_height="60dp";
{
TextView;
textSize="18sp";
layout_gravity="center";
textColor="0xFF03A9F4";
layout_marginLeft="15dp";
text="选择代码";
};
{
ImageView;
src="res3/2.png";
id="XY11";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="29dp";
layout_marginLeft="30dp";
layout_height="29dp";
backgroundResource=ripple,
};
{
ImageView;
src="res3/3.png";
id="XY21";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="25dp";
layout_height="25dp";
backgroundResource=ripple,
};
{
ImageView;
src="res3/4.png";
id="XY31";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="25dp";
layout_height="25dp";
backgroundResource=ripple,
};
{
ImageView;
src="res3/5.png";
id="XY41";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="25dp";
layout_marginLeft="25dp";
layout_height="25dp";
backgroundResource=ripple,
};
};
{
LinearLayout;
layout_width="fill";
id="转到";
visibility=8;
backgroundColor=颜色1;
layout_height="60dp";
{
ImageView;
src="res3/1.png";
id="关闭转到";
ColorFilter="0xFF03A9F4";
layout_gravity="center";
layout_width="30dp";
layout_marginLeft="10dp";
layout_height="30dp";
backgroundResource=ripple,
};
{
TextView;
textSize="16sp";
layout_gravity="center";
textColor="0xFF03A9F4";
layout_marginLeft="15dp";
text="转到";
};
{
LinearLayout;
layout_width="match_parent";
gravity="right";
layout_gravity="center";
layout_height="match_parent";
{
EditText;
textSize="15sp";
id="转到行数";
textColor=颜色4,
singleLine="true";
layout_gravity="center";
layout_width="140dp";
gravity="center";
};
{
Button;
layout_width="70dp";
textSize="12sp";
id="确定转到";
layout_height="match_parent";
backgroundColor="0";
textColor="0xFF03A9F4";
layout_gravity="center";
text="确定";
backgroundResource=ripple,
};
};
};
{
LinearLayout;
layout_width="match_parent";
layout_height="match_parent";
layout_marginTop="60dp";
{
DrawerLayout;
id="左侧滑";
layout_width="fill";
layout_height="fill";
{
RelativeLayout;
id="cf",
{
LinearLayout;
orientation="vertical";
layout_width="match_parent";

{
RelativeLayout;
layout_width="fill";
backgroundColor=颜色1;
layout_height="5%h";

{
HorizontalScrollView;
horizontalScrollBarEnabled=false;
backgroundColor=颜色1;
layout_width="fill";
layout_height="fill";
{
LinearLayout;
layout_width="fill";
id="bar2";
layout_height="fill";
};

};

{
LinearLayout;
layout_width="match_parent";
id="错误提示";
Visibility=8,
backgroundColor="0xFFFF0000";
layout_height="4%h";
{
TextView;
id="错误文字";
layout_gravity="center";
textColor="0xffffffff";
layout_marginLeft="10dp";
text="错误提示";
};
};
};
{
LuaEditor;

layout_width="fill";
id="q";
backgroundColor=颜色5,
layout_height="fill";
};
};
{
LinearLayout;
layout_width="fill";
layout_height="6%h";

layout_alignParentBottom="true";
{
HorizontalScrollView;
horizontalScrollBarEnabled=false;
backgroundColor=颜色1;
layout_width="fill";
layout_height="fill";
{
LinearLayout;
layout_width="fill";
id="bar";


layout_height="fill";
}
};
};
};
{
LinearLayout;
layout_gravity="left",
layout_width="match_parent";
background="0";
layout_height="match_parent";
{
LinearLayout;
layout_width="match_parent";
layout_height="match_parent";
{
LinearLayout;
layout_width="280dp";
backgroundColor=颜色2;
orientation="vertical";
layout_height="match_parent";
{
CardView;
layout_marginTop="10dp";
layout_gravity="center";
layout_height="50dp";
layout_width="260dp";
CardElevation=0;
radius=25;
backgroundColor=颜色1;

{
LinearLayout;
layout_width="match_parent";
gravity="center";
orientation="vertical";
layout_height="match_parent";
id="ch",
{
TextView;
textColor=颜色4,
textSize="16sp";
text="文件资源列表";
};
{
TextView;
textColor=颜色4,
ellipsize="marquee";
focusableInTouchMode=true;
focusable=true;
singleLine=true;
layout_width="240dp",
layout_height="15dp";
textSize="10sp";
text="路径";
layout_marginTop="5dp";
id="cp";
};
};
};
{
ListView;
layout_height="fill";
layout_width="fill";
DividerHeight=0;
id="lv";
layout_marginTop="5dp";
};
};
},
};
};
};
};
};

activity.setContentView(layout2)

activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(颜色1);
if tonumber(Build.VERSION.SDK) >= 23 then
activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
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
美化按钮2=function(mBinding,radiu,InsideColor,T1)
stateList = {
{android.R.attr.state_pressed},
{android.R.attr.state_focused},
{android.R.attr.state_activated},
{android.R.attr.selectableItemBackground},
};
sd.addState({ android.R.attr.state_enabled}, appt.C_Bacgg(mBinding,radiu,InsideColor,S,S2,T1))
pressedColor =InsideColor 
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

项目名称,状态,项目名=...
function 保存()
写入文件(项目名称.."/"..xy33.text,q.text)
end

ti=Ticker()
ti.Period=480000
ti.onTick=function()
保存()
local a=File(项目名称).getName()
LuaUtil.copyDir(项目名称,备份文件夹.."/"..a)
ZipUtil.zip(备份文件夹.."/"..a,备份文件夹)
LuaUtil.rmDir(File(备份文件夹.."/"..a))
File(备份文件夹.."/"..a..".zip").renameTo(File(备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp"))
print("备份成功"..备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp")

end
function 是否备份()
local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local b=a:match("3(.-)"..'"')
if b=="开" then
ti.start()
else
ti.stop()
end
end

local itemq={
LinearLayout;
background="0";
layout_width="match_parent";
layout_height="match_parent";
{
LinearLayout;
layout_width="match_parent";
gravity="center";
layout_height="match_parent";
{
LinearLayout;
layout_width="280dp";
gravity="center";
orientation="vertical";
layout_height="60dp";
{
CardView;
backgroundColor=颜色1;
CardElevation="0dp";
radius=25;
layout_width="260dp";
layout_height="50dp";
{
LinearLayout;
layout_width="fill";
gravity="center";
layout_height="match_parent";
{
LinearLayout;
layout_width="50dp";
gravity="center";
layout_height="match_parent";
{
ImageView;
layout_width="35dp";
src="res2/file.png";
id="wjlx";
ColorFilter=颜色6,
layout_height="35dp";
};
};
{
LinearLayout;
layout_width="match_parent";
layout_height="match_parent";
{
TextView;
textColor=颜色4,
id="wjm",
layout_gravity="center";
text="main.lua";
textSize="15sp";
};
};
};
};
};
};
};
function 刷新路径(StartPath)

collectgarbage("collect")
data={}
adpq=LuaAdapter(activity,data,itemq)
lv.setAdapter(adpq)
function SetItem(path)
path=tostring(path)
adpq.clear()
cp.Text=tostring(path)
if path~=tostring(项目名称) then
adpq.add{wjm="返回上级目录",wjlx="res2/folder.png"}
end
ls=File(path).listFiles()
if ls~=nil then
ls=luajava.astable(File(path).listFiles()) 
table.sort(ls,function(a,b)
return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
end)
else
ls={}
end
for index,c in ipairs(ls) do
if c.isDirectory() then
adpq.add{wjm=c.Name,wjlx="res2/folder.png"}
elseif c.isFile() then
adpq.add{wjm=c.Name,wjlx="res2/file.png"}
end
end
end
wh=activity.getWidth()
pio=(wh/10)*8

左侧滑.setDrawerListener(DrawerLayout.DrawerListener{

onDrawerSlide=function(v,i)

cf.setTranslationX(i*pio)







cf.setTranslationX(i*250)
cf.setTranslationY(i*100)










其他1x.setRotation(i*30)
ch.setAlpha(i)
ch.setScaleY(i)
lv.setAlpha(i)
lv.setScaleY(i)






end,







})

o=RippleHelper(lv)
o.RippleColor=0x34FFFFFF

lv.onItemLongClick=function(l,v,p,s)
项目=tostring(v.tag.wjm.Text)
collectgarbage("collect")
local wjcz={
CardView;
radius=30;
layout_width="match_parent";

layout_height="match_parent";
{
CardView;
layout_gravity="center";
layout_height="210dp";
layout_width="match_parent";
--backgroundColor=颜色1,
--radius=20;
{
TextView;
layout_marginTop="15dp";
text="文件操作";
layout_marginLeft="20dp";
textColor="0xFF03A9F4";
textSize="20sp";
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
{
Button;
textColor="0x7E000000";
layout_gravity="center";
text="删除";
layout_height="40dp";
layout_marginBottom="5dp";
id="删除";
layout_marginLeft="10dp";
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
gravity="right";
{
Button;
layout_marginRight="10dp";
textColor="0xFF03A9F4";
text="重命名";
layout_height="40dp";
layout_marginBottom="5dp";
id="重命名";
layout_gravity="center";
};
};
};
};
};
dialog= AlertDialog.Builder(this)
dialog1=dialog.show()
dialog1.getWindow().setContentView(loadlayout(wjcz));
dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
local dialogWindow = dialog1.getWindow();
dialogWindow.setGravity(Gravity.BOTTOM);
dialog1.getWindow().getAttributes().width=(activity.Width);
dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
local x=nil
美化按钮2(删除,10,0x7E000000,0x7E000000)
美化按钮2(重命名,10,0x7E000000,0x7E000000)
function 删除.onClick()
os.remove(cp.Text.."/"..项目)
刷新路径(项目名称)
print"删除成功"
dialog1.dismiss()
end
function 重命名.onClick()
dialog1.dismiss()
local cmm={
CardView;
radius=30;
layout_width="match_parent";

layout_height="match_parent";
{
CardView;
layout_gravity="center";
layout_height="350dp";
layout_width="match_parent";
backgroundColor=颜色1,
radius=20;
{
TextView;
layout_marginTop="15dp";
text="重命名";
layout_marginLeft="20dp";
textColor="0xFF03A9F4";
textSize="20sp";
};
{
LinearLayout;
layout_height="180dp";
layout_width="match_parent";
orientation="horizontal";
gravity="center";
{
EditText;

layout_width="150dp";
hint="请输入文件名称";
textSize="15sp";
hintTextColor=颜色3,
textColor=颜色3,
id="输入文件名称";
gravity="center";
};
{
Spinner;
layout_marginLeft="10dp";

items={
".lua";
".aly";
".txt";
};
id="类型";
layout_gravity="center";
};
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
{
Button;
textColor="0x7E000000";
layout_gravity="center";
text="取消";
layout_height="40dp";
layout_marginBottom="5dp";
id="取消";
layout_marginLeft="10dp";
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
gravity="right";
{
Button;
layout_marginRight="10dp";
textColor="0xFF03A9F4";
text="重命名";
layout_height="40dp";
layout_marginBottom="5dp";
id="重命名";
layout_gravity="center";
};
};
};
};
};
dialog= AlertDialog.Builder(this)
dialog1=dialog.show()
dialog1.getWindow().setContentView(loadlayout(cmm));
dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
local dialogWindow = dialog1.getWindow();
dialogWindow.setGravity(Gravity.BOTTOM);
dialog1.getWindow().getAttributes().width=(activity.Width);
dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
local x=nil
美化按钮2(取消,10,0x7E000000,0x7E000000)
美化按钮2(重命名,10,0x7E000000,0x7E000000)
控件圆角(输入文件名称,颜色2,30)
类型.onItemSelected=function(l,v,p,i)
x=v.text
end
function 取消.onClick()
dialog1.dismiss()
end
function 重命名.onClick()
os.execute("mv "..cp.Text.."/"..项目.." "..cp.Text.."/"..输入文件名称.Text..x)
刷新路径(项目名称)
print"重命名成功"
dialog1.dismiss()
end
end
end




collectgarbage("collect")

lv.onItemClick=function(l,v,p,s)
项目=tostring(v.tag.wjm.Text)
collectgarbage("collect")
if tostring(cp.Text)==tostring(项目名称) then
路径=ls[p+1]
else
路径=ls[p]
end
collectgarbage("collect")

if 项目=="返回上级目录" then
collectgarbage("collect")
SetItem(File(cp.Text).getParentFile())
elseif 路径.isDirectory() then
SetItem(路径)
elseif 路径.isFile() then
local a=路径.Name
collectgarbage("collect")
if a:find("%.lua$") or a:find("%.aly$") then
local b=File(tostring(路径)).getParentFile()
if tostring(b)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")

xy33.text=路径.Name
左侧滑.closeDrawer(3)
else
local c=File(tostring(b)).getParentFile()
if tostring(c)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")

xy33.text=b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)
collectgarbage("collect")
else
collectgarbage("collect")
local d=File(tostring(c)).getParentFile()
if tostring(d)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)
else
local e=File(tostring(d)).getParentFile()
if tostring(e)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local f=File(tostring(e)).getParentFile()
if tostring(f)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local g=File(tostring(f)).getParentFile()
if tostring(g)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local h=File(tostring(g)).getParentFile()
if tostring(h)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=g.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local i=File(tostring(h)).getParentFile()
if tostring(i)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=h.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local j=File(tostring(i)).getParentFile()
if tostring(j)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=i.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)

else
local k=File(tostring(j)).getParentFile()
if tostring(k)==tostring(项目名称) then
保存()
q.text=io.open(tostring(路径)):read("*a")
xy33.text=j.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
左侧滑.closeDrawer(3)
end
end
end
end
end
end
end
end
end
end
else
collectgarbage("collect")
print("暂不支持打开此类文件哦")
end
end
end
collectgarbage("collect")
SetItem(StartPath)
end


功能={"打开","新建","调色","打包","备份","属性","搜索","跳转","格式","编译"}
for i=1,#功能 do
activity.Debug=false
button2={
Button;
text=功能[i];
layout_width="45dp";
layout_height="fill";
background="#ffffff";
padding="5dp",
id="sssssw",
textColor=颜色4,
backgroundResource=ripple,
};
m2=loadlayout(button2)
bar2.addView(m2)

m2.onClick=function(v)
i=v.text
if i=="打开" then
左侧滑.openDrawer(3)
end
if i=="新建" then
local cj={
CardView;
radius=30;
layout_width="match_parent";

layout_height="match_parent";
{
CardView;
layout_gravity="center";
layout_height="350dp";
layout_width="match_parent";
--backgroundColor=颜色1,
--radius=20;
{
TextView;
layout_marginTop="15dp";
text="新建文件";
layout_marginLeft="20dp";
textColor="0xFF03A9F4";
textSize="20sp";
};
{
LinearLayout;
layout_height="180dp";
layout_width="match_parent";
orientation="horizontal";
gravity="center";
{
EditText;

layout_width="150dp";
hint="请输入新建文件名称";
textSize="15sp";
hintTextColor=颜色3,
textColor=颜色3,
id="输入文件名称";
gravity="center";
};
{
Spinner;
layout_marginLeft="10dp";

items={
"lua";
"aly";
"txt";
"文件夹";
};
id="类型";
layout_gravity="center";
};
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
{
Button;
textColor="0x7E000000";
layout_gravity="center";
text="取消";
layout_height="40dp";
layout_marginBottom="5dp";
id="取消创建文件";
layout_marginLeft="10dp";
};
{
LinearLayout;
layout_height="match_parent";
layout_width="match_parent";
gravity="right";
{
Button;
layout_marginRight="10dp";
textColor="0xFF03A9F4";
text="创建";
layout_height="40dp";
layout_marginBottom="5dp";
id="确定创建文件";
layout_gravity="center";
};
};
};
};
};
dialog= AlertDialog.Builder(this)
dialog1=dialog.show()
dialog1.getWindow().setContentView(loadlayout(cj));
dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
local dialogWindow = dialog1.getWindow();
dialogWindow.setGravity(Gravity.BOTTOM);
dialog1.getWindow().getAttributes().width=(activity.Width);
dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
local x=nil
美化按钮2(取消创建文件,10,0x7E000000,0x7a00bfff)
美化按钮2(确定创建文件,10,0x7a00bfff,0x7a00bfff)
控件圆角(输入文件名称,颜色2,30)
function 取消创建文件.onClick()
dialog1.dismiss()
end
类型.onItemSelected=function(l,v,p,i)
x=v.text
end
function 确定创建文件.onClick()
if #输入文件名称.text~=0 then
if x=="lua" then
local lua=[[import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
]]
if not File(项目名称.."/"..输入文件名称.text..".lua").isFile() then
写入文件(项目名称.."/"..输入文件名称.text..".lua",lua)
dialog1.dismiss()
print"创建成功"
刷新路径(项目名称)
else
print"文件已存在"
end
elseif x=="aly" then

local aly=[[{
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
};]]
if not File(项目名称.."/"..输入文件名称.text..".aly").isFile() then
写入文件(项目名称.."/"..输入文件名称.text..".aly",aly)
dialog1.dismiss()
print"创建成功"
刷新路径(项目名称)
else
print"文件已存在"
end
elseif x=="txt" then
if not File(项目名称.."/"..输入文件名称.text..".txt").isFile() then
创建文件(项目名称.."/"..输入文件名称.text..".txt")
dialog1.dismiss()
print"创建成功"
刷新路径(项目名称)
else
print"文件已存在"
end
elseif x=="文件夹" then
if not File(项目名称.."/"..输入文件名称.text).isDirectory() then
创建文件夹(项目名称.."/"..输入文件名称.text)
dialog1.dismiss()
print"创建成功"
刷新路径(项目名称)
else
print"文件夹已存在"
end
end
end
end

end
if i=="备份" then
保存()
local a=File(项目名称).getName()
LuaUtil.copyDir(项目名称,备份文件夹.."/"..a)
LuaUtil.zip(备份文件夹.."/"..a,备份文件夹)
LuaUtil.rmDir(File(备份文件夹.."/"..a))
File(备份文件夹.."/"..a..".zip").renameTo(File(备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp"))
print("备份成功"..备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp")
end
if i=="调色" then
yss1("调色板","0xFFFFFFFF")
end
if i=="打包" then
保存()
import "java.util.zip.ZipOutputStream"
import "android.net.Uri"
import "java.io.File"
import "android.widget.Toast"
import "java.util.zip.CheckedInputStream"
import "java.io.FileInputStream"
import "android.content.Intent"
import "java.security.Signer"
import "java.util.ArrayList"
import "java.io.FileOutputStream"
import "java.io.BufferedOutputStream"
import "java.util.zip.ZipInputStream"
import "java.io.BufferedInputStream"
import "java.util.zip.ZipEntry"
import "android.app.ProgressDialog"
import "java.util.zip.CheckedOutputStream"
import "java.util.zip.Adler32"
import "com.androlua.LuaUtil"

local bin_dlg, error_dlg
local function update(s)
bin_dlg.setMessage(s)
end

local function callback(s)
LuaUtil.rmDir(File(activity.getLuaExtDir("bin/.temp")))
bin_dlg.hide()
bin_dlg.Message = ""
if not s:find("成功") then
error_dlg.Message = s
error_dlg.show()
end
end

local function create_bin_dlg()
if bin_dlg then
return
end
bin_dlg = ProgressDialog(activity);
bin_dlg.setTitle("正在打包");
bin_dlg.setMax(100);
end

local function create_error_dlg2()
if error_dlg then
return
end

end

local bin_dlg, error_dlg
local function update(s)
bin_dlg.setMessage(s)
end

local function callback(s)
LuaUtil.rmDir(File(activity.getLuaExtDir("bin/.temp")))
bin_dlg.hide()
bin_dlg.Message = ""
if not s:find("成功") then
error_dlg.Message = s
error_dlg.show()
end
end

local function create_bin_dlg()
if bin_dlg then
return
end
bin_dlg = ProgressDialog(activity);
bin_dlg.setTitle("正在打包");
bin_dlg.setMax(100);
end

local function create_error_dlg2()
if error_dlg then
return
end

end
create_bin_dlg()
bin_dlg.show()
update("正在打包")
local function binapk(luapath,apkpath)



local function ps(str)
str = str:gsub("%b\"\"",""):gsub("%b\'\'","")
local _,f= str:gsub ('%f[%w]function%f[%W]',"")
local _,t= str:gsub ('%f[%w]then%f[%W]',"")
local _,i= str:gsub ('%f[%w]elseif%f[%W]',"")
local _,d= str:gsub ('%f[%w]do%f[%W]',"")
local _,e= str:gsub ('%f[%w]end%f[%W]',"")
local _,r= str:gsub ('%f[%w]repeat%f[%W]',"")
local _,u= str:gsub ('%f[%w]until%f[%W]',"")
local _,a= str:gsub ("{","")
local _,b= str:gsub ("}","")
return (f+t+d+r+a)*4-(i+e+u+b)*4
end


local function _format()
local p=0
return function(str)
str=str:gsub("[ \t]+$","")
str=string.format('%s%s',string.rep(' ',p),str)
p=p+ps(str)
return str
end
end


function format(Text)
local t=os.clock()
local Format=_format()
Text=Text:gsub('[ \t]*([^\r\n]+)',function(str)return Format(str)end)
print('操作完成,耗时:'..os.clock()-t)
return Text
end


function build(path)
if path then
local str,st=loadfile(path)
if st then
return nil,st
end
local path=path..'c'

local st,str=pcall(string.dump,str,true)
if st then
f=io.open(path,'wb')
f:write(str)
f:close()
return path
else
os.remove(path)
return nil,str
end
end
end

function build_aly(path2)
if path2 then
local f,st=io.open(path2)
if st then
return nil,st
end
local str=f:read("*a")
f:close()
str=string.format("local layout=%s\nreturn layout",str)
local path=path2..'c'
str,st=loadstring(str,path2:match("[^/]+/[^/]+$"),"bt")
if st then
return nil,st:gsub("%b[]",path2,1)
end

local st,str=pcall(string.dump,str,true)
if st then
f=io.open(path,'wb')
f:write(str)
f:close()
return path
else
os.remove(path)
return nil,str
end
end
end




import "java.util.zip.*"
import "java.io.*"
import "mao.res.*"
import "apksigner.*"
local b = byte[2 ^ 16]
local function copy(input, output)
LuaUtil.copyFile(input, output)
input.close()

end

local function copy2(input, output)
LuaUtil.copyFile(input, output)
end

local temp = File(apkpath).getParentFile();
if (not temp.exists()) then

if (not temp.mkdirs()) then

error("create file " .. temp.getName() .. " fail");
end
end


local tmp = activity.getLuaPath("tmp.apk")
local info = activity.getApplicationInfo()
local ver = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName
local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode


local zipFile = File(info.publicSourceDir)
local fis = FileInputStream(zipFile);

local zis = ZipInputStream(BufferedInputStream(fis));

local fot = FileOutputStream(tmp)


local out = ZipOutputStream(BufferedOutputStream(fot))
local f = File(luapath)
local errbuffer = {}
local replace = {}
local checked = {}
local lualib = {}
local md5s = {}
local libs = File(activity.ApplicationInfo.nativeLibraryDir).list()




local function checklib(path)
if checked[path] then
return
end
local cp, lp
checked[path] = true
local f = io.open(path)
local s = f:read("*a")
f:close()


end

local function addDir(out, dir, f)
local entry = ZipEntry("assets/" .. dir)
out.putNextEntry(entry)
local ls = f.listFiles()

for n = 0, #ls - 1 do
local name = ls[n].getName()
if name==(".using") then
checklib(luapath .. dir .. name)
elseif name:find("%.apk$") or name:find("%.luac$") or name:find("^%.") then
elseif name:find("%.lua$") then
checklib(luapath .. dir .. name)
local path, err = build(luapath .. dir .. name)

if path then
if replace["assets/" .. dir .. name] then
table.insert(errbuffer, dir .. name .. "/.aly")
end
local entry = ZipEntry("assets/" .. dir .. name)
out.putNextEntry(entry)

replace["assets/" .. dir .. name] = true
copy(FileInputStream(File(path)), out)
table.insert(md5s, LuaUtil.getFileMD5(path))
os.remove(path)
else
table.insert(errbuffer, err)
end

elseif ls[n].isDirectory() then
addDir(out, dir .. name .. "/", ls[n])
else
local entry = ZipEntry("assets/" .. dir .. name)
out.putNextEntry(entry)
replace["assets/" .. dir .. name] = true
copy(FileInputStream(ls[n]), out)
table.insert(md5s, LuaUtil.getFileMD5(ls[n]))
end
end
end

if f.isDirectory() then
import "android.content.pm.PackageManager"
local pm = activity.getPackageManager();
local pi = pm.getPackageInfo(activity.getPackageName(), 0);

local pkgName = pi.packageName;

local pkgInfo = pm.getPackageInfo(pkgName,
PackageManager.GET_PERMISSIONS); 
local sharedPkgList = pkgInfo.requestedPermissions; 
permission = {}
permission_info = {}
permission_info["BIND_ACCESSIBILITY_SERVICE"] = "辅助功能"
for i = 0, #sharedPkgList - 1 do
local permName = sharedPkgList[i];

local s, tmpPermInfo = pcall(pm.getPermissionInfo, permName, 0); 







permName = permName:match("%.([%w_]+)$")
table.insert(permission, permName)
if s then
permission_info[permName] = tmpPermInfo.loadLabel(pm)
else
permission_info[permName] = permName
end
end

dofile(luapath .. "init.lua")
if user_permission then
for k, v in ipairs(user_permission) do
user_permission[v] = true
end
end




local ss, ee = pcall(addDir, out, "", f)
if not ss then
table.insert(errbuffer, ee)
end

local wel = File(luapath .. "icon.png")

if wel.exists() then
local entry = ZipEntry("res/drawable/icon.png")
out.putNextEntry(entry)

replace["res/drawable/icon.png"] = true
copy(FileInputStream(wel), out)

end
local wel = File(luapath .. "welcome.png")
if wel.exists() then
local entry = ZipEntry("res/drawable/welcome.png")
out.putNextEntry(entry)
replace["res/drawable/welcome.png"] = true
copy(FileInputStream(wel), out)
end
else
return "error"
end




for name, v in pairs(lualib) do

local path, err = build(v)
if path then
local entry = ZipEntry(name)
out.putNextEntry(entry)
copy(FileInputStream(File(path)), out)
table.insert(md5s, LuaUtil.getFileMD5(path))
os.remove(path)
else
table.insert(errbuffer, err)
end
end

function touint32(i)
local code = string.format("%08x", i)
local uint = {}
for n in code:gmatch("..") do
table.insert(uint, 1, string.char(tonumber(n, 16)))
end
return table.concat(uint)
end

update("正在签名")
local entry = zis.getNextEntry();
while entry do
local name = entry.getName()

local lib = name:match("([^/]+%.so)$")
if replace[name] then
elseif lib and replace[lib] then
elseif name:find("^assets/") then

elseif name:find("META%-INF") then
elseif !name:find("%a") then
else
local entry = ZipEntry(name)
out.putNextEntry(entry)
if entry.getName() == "AndroidManifest.xml" then
if path_pattern and #path_pattern > 1 then
path_pattern = ".*\\\\." .. path_pattern:match("%w+$")
end
local list = ArrayList()
local xml = AXmlDecoder.read(list, zis)
local req = {
[activity.getPackageName()] = package_name,
[info.nonLocalizedLabel] = app_name,
[ver] = ver_name,
[".*\\\\.lua"] = "",
[".*\\\\.luac"] = "",
}
if path_pattern==nil or path_pattern=="" then
req[".*\\\\.alp"] = ""
req["application/alp"] = "application/1234567890"
else
path_pattern=path_pattern:match("%w+$") or path_pattern
req[".*\\\\.alp"] = ".*\\\\."..path_pattern
req["application/alp"] = "application/"..path_pattern
end
for n = 0, list.size() - 1 do
local v = list.get(n)
if req[v] then
list.set(n, req[v])
elseif user_permission then
local p = v:match("%.permission%.([%w_]+)$")
if p and (not user_permission[p]) then
list.set(n, "android.permission.UNKNOWN")
end
end
end

local pt = activity.getLuaPath(".tmp")
local fo = FileOutputStream(pt)
xml.write(list, fo)
local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode
fo.close()
local f = io.open(pt)
local s = f:read("a")
f:close()
s = string.gsub(s, touint32(code), touint32(tointeger(ver_code) or 1),1)
s = string.gsub(s, touint32(18), touint32(tointeger("15") or 18),1)

local f = io.open(pt, "w")
f:write(s)

task(1500,function()
bin_dlg.hide()
LuaUtil.copyDir(activity.getLuaPath("tmp.apk"),"/sdcard/LuaJ/bin/"..app_name..".apk")
import "apksigner.*"
local tmp = activity.getLuaDir().."/tmp.apk"
Sign.sign(tmp,"/sdcard/LuaJ/bin/"..app_name..".apk")
activity.installApk("/sdcard/LuaJ/bin/"..app_name..".apk");
print("打包完成")
end)

f:close()
local fi = FileInputStream(pt)
copy(fi,out)
os.remove(pt)

elseif not entry.isDirectory() then
copy2(zis, out)
end
end

entry = zis.getNextEntry()
end
out.setComment(table.concat(md5s))

zis.close();
out.closeEntry()
out.close()




end
task(1000,function()
binapk(项目名称.."/","/storage/emulated/0/LuaJ/bin/")
end)
end
if i=="属性" then
保存()
x90=io.open(项目名称.."/init.lua"):read("*a")
if x90:find("app_name") then
x91=x90:match('app_name="(.-)"')
end
if x90:find("ver_code") then
x92=x90:match('ver_code="(.-)"')
end
if x90:find("ver_name") then
x93=x90:match('ver_name="(.-)"')
end

if x90:find("package_name") then
x94=x90:match('package_name="(.-)"')
end
if x90:find("rue") or x90:find("tru") then
x95="开"
end
if x90:find("user_permission") then
x96=x90:match('user_permission={(.-)}')
end
x98=项目名称.."/init.lua"
x0=io.open(项目名称.."/init.lua"):read("*a")
activity.newActivity("main5",android.R.anim.fade_in,android.R.anim.fade_out,{
true,
x0,
x91,
x92,
x93,
x94,
x95,
x96,
x97,
x98,
项目名,
})
end
if i=="搜索" then
q.search()
end
if i=="跳转" then
if 转到.Visibility==8 then
转到.setVisibility(0)
else
转到.setVisibility(8)
end
end
if i=="格式" then
q.format()
end
if i=="编译" then
local 路径,错误=build(项目名称.."/"..xy33.text)
if 路径 then
print("编译成功"..路径)
else
print("编译失败"..错误)
end
end
end
activity.Debug=true
end

switch 状态
case true
刷新路径(项目名称)
是否备份()
q.text=io.open(项目名称.."/main.lua"):read("*a")
end
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)

q.setBasewordColor(0xff8dbdc9)
q.setPanelBackgroundColor(颜色1)
q.setPanelTextColor(0xFF03A9F4)
q.setStringColor(0xFF03A9F4)
q.setTextColor(颜色3)
q.setUserwordColor(0xFF03A9F4)
q.setCommentColor(0xffa0a0a0)
q.setKeywordColor(0xFF03A9F4)
hs={"删除文件()"}
q.addNames(hs)
fh=io.open(activity.getLuaDir().."/Verify/set2.XY"):read("*a")
for t,c in fh:gmatch("(.-) ") do
activity.Debug=false
button={
Button;
text=tostring(t);
layout_width="45dp";
layout_height="fill";
backgroundColor=颜色1;
textColor=0xFF03A9F4;
padding="5dp",
id="sssss",
};
m=loadlayout(button)
bar.addView(m)

m.onClick=function(v)
if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
q.paste("function")
else
if v.text=="End" or v.text=="end" then
q.paste("end")
else
q.paste(v.Text)
end
end
end
m.onLongClick=function(v)
if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
q.paste("function")
else
if v.text=="End" or v.text=="end" then
q.paste("end")
else
q.paste(v.Text..v.text)
end
end
activity.Debug=true
return true
end
end
q.OnSelectionChangedListener=function(a,b,c)
if a==true then
选择代码1.setVisibility(0)
else
选择代码1.setVisibility(8)
end
end
function XY11.onClick()
q.selectAll()
end
function XY21.onClick()
q.cut()
end
function XY31.onClick()
q.copy()
end
function XY41.onClick()
q.paste()
end


local ttf=Typeface.createFromFile(File(activity.getLuaDir().."/default.ttf"))
q.setTypeface(ttf)

function 确定转到.onClick()
if #转到行数.text~=0 then
q.gotoLine(tointeger(转到行数.text))
end
end
function 关闭转到.onClick()
转到.setVisibility(8)
end



ti1=Ticker()
ti1.Period=100
ti1.onTick=function()
保存()
luapath=项目名称.."/"..xy33.text
local src = q.getText()


end



switch 状态
case true
ti1.start()
end
function 其他1x.onClick()
if 左侧滑.isDrawerOpen(3) then
左侧滑.closeDrawer(3)
else
左侧滑.openDrawer(3)
end
end
function 运行.onClick()
保存()
activity.newActivity(项目名称.."/main.lua")
end
function 撤销.onClick()
q.undo()
end
function 恢复.onClick()
q.redo()
end
function 调色.onClick()
yss1("调色板","0xFFFFFFFF")
end
function 其他2x.onClick()
pop=PopupMenu(activity,其他2x)
menu=pop.Menu


menu.add("保存并退出").onMenuItemClick=function()
q.format()
保存()
ti1.stop()
ti.stop()
activity.finish()
end
pop.show()
end
function onKeyDown(e)
if e == 4 then
q.format()
保存()
ti1.stop()
ti.stop()
end
end