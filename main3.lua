
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"


import "toast"
import "android.graphics.drawable.ColorDrawable"
import "com.androlua.LuaAdapter"

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
attrsArray = { android.R.attr.selectableItemBackgroundBorderless }
typedArray =activity.obtainStyledAttributes(attrsArray)

ripple=typedArray.getResourceId(0, attrsArray[1]);

typedArray.recycle();
layout3={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  backgroundColor=颜色2,
  orientation="vertical";
  {
    RelativeLayout;
    layout_height="fill";
    layout_width="fill";
    {
      LinearLayout;
      layout_height="56dp";
      backgroundColor=颜色1;
      layout_width="fill";
      {
        ImageView;
        layout_gravity="center";
        src="res/AndLuaXY8.png";
        ColorFilter="0xFF03A9F4";
        layout_width="25dp";
        id="mImageView2";
        backgroundResource=ripple,
        layout_marginLeft="20dp";
      };
      {
        TextView;
        layout_gravity="center";
        text="教程手册";
        textSize="18sp";
        layout_marginLeft="30dp";
        textColor="0xFF03A9F4";
      };
    };
    {

      LinearLayout;
      gravity="center";
      layout_height="88.2%h";
      orientation="vertical";
      layout_alignParentBottom="true";
      layout_width="fill";
      {
        ListView;
        layout_gravity="end";
        layout_width="fill";
        layout_height="fill";
        id="中文列表";
        DividerHeight=0;
        layout_marginTop="5dp";
      };
    };
  };
}

activity.setContentView(loadlayout(layout3))


activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(颜色1);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)

item5={
  LinearLayout;
  gravity="center";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    gravity="center";
    orientation="vertical";
    layout_height="19.1%h";
    layout_width="fill";
    {
      CardView;
      radius=20;
      CardElevation=0;
      backgroundColor=颜色1;
      layout_height="120dp";
      layout_width="340dp";
      {
        LinearLayout;
        orientation="vertical";
        layout_height="fill";
        layout_width="fill";
        {
          TextView;
          id="标题1";
          layout_marginTop="5dp";
          layout_marginLeft="10dp";
          text="中文函数";
          textColor=颜色3;
          textSize="18sp";
        };
        {
          TextView;
          id="内容1";
          layout_marginLeft="10dp";
          textSize="14sp";
          textColor=颜色4,
          layout_marginTop="5dp";
          text=[==[LuaJ++LC]==];
        };
      };
    };
  };
};


内容=[[【编辑器作者】作者:MostBlack
作者QQ:176971467
官方QQ群:748285868【与AndroLua+的不同点】在main文件中和AndroLua+最大区别是不导入import模块
因为在LuaJ++中被写成了关键字
这样做的好处有:
1，可以把导入的模块设置为局部变量
2，可以导入时设置别名
3，编译时包的导入会解析为逐个使用的类
不影响全局环境，读写全局变量效率更高
导入的模块或类仅能在当前块中使用
不能像AndroLua+那样在main导入在其他文件使用
所以在布局表中,需要写上导入包的语句。
{
 import "android.widget.*";
 LinearLayout,
 orientation="vertical",
 layout_width="fill",
 layout_height="fill",
 {
   TextView,
   text="Hello LuaJ++",
   layout_width="fill",
 },
}
导入要紧挨着花括号后写
可以导入多个包
支持导入第三方包(放到libs文件夹即可)
LuaJ++不支持c模块,所以内置有json模块
LuaJ++默认是关闭debug的
如果代码出错要详细信息得添加debug.debug(true)开启debug
要不然获取不到全部详情【迭代器】for k,v : t
end
可以迭代表,Java数组,list和map【全局转同名局部】local:print
在定义模块时可以减少代码量【错误捕获】try
xxxx
catch(m)
print(m)
end【生成特殊表】a=[1,2,3]
只能数字键,一般用不到【switch】switch s
case 1
print(1)
case 2,4,6
print("偶数")
end
这个在AndroLua+也有,不过LuaJ++的Bug更少

a=when a
case 1,3,5,7
return 1
case 2,4,6,8
return 2
end
和switch类似,能返回值【延迟执行】f=io.open()
defer f:close()
s=f:read()
在函数结束时运行【module新建模块】module "abc"
function _M:new()
end【模块及构建函数】_M表示模块本身
使用模块可以有效防止环境污染
及方便把过多函数写到不同文件
只要声明相同的module名即可相互访问
模块相当于类,比类功能弱,灵活性强
这个模块概念Lua官方取消了

_ENV环境,LuaJ++默认使用函数局部环境
_ENV在函数中是局部变量，更改_ENV只会影响当前函数环境
默认继承上级函数环境
Lua官方版直接更改_ENV会更改全局环境
这样不够友好【模块演示】local:print
module"m"
function _M:new(a)
 self.a=a
 end

function _M:add(b)
 return self.a+b
end

function _M:__add(b)
 return self.a+b
end

self表示实例中的内容【res资源模块】res是为了实现多国语言适配做的模块
在默认创建文件中
有res/string/init.lua默认语言文件
可以创建如en.lua zh.lua等不同语言模块
在使用字符串时仅需要使用
res.string.xxx即可引用
res其他模块原理类似
res.view.xxx模块把res/layout/xxx.lua的布局表转为视图
而res.layout.xxx则输出表
如果不习惯这种文件夹嵌套
可以像AndroLua+一样
先导入布局表再设置视图
LuaJ++布局表后缀是lua
.aly不可以用了【LuaJ++的线程】task或者线程thread的函数中
是可以直接访问或调用主线程中的变量和函数的
请自行注意变量的线程安全问题
如果要在线程中更新视图要使用call函数
方法大体等同于AndroLua+
线程可以直接访问主线程变量,读写都可以
不过线程安全需要自己保证【局部函数简写】local f()
end【]]data={}
adp=LuaAdapter(activity,data,item5)
中文列表.Adapter=adp
标题=内容:gmatch("】(.-)【")
for i in 内容:gmatch("【(.-)】") do
  sss=标题()
  adp.add{标题1=i,内容1=sss}
end
中文列表.onItemClick=function(l,v,p,i)
  activity.newActivity("main4",android.R.anim.fade_in,android.R.anim.fade_out,{v.tag.标题1.text,v.tag.内容1.text})
  return true
end

function mImageView2.onClick()
  activity.finish()
end