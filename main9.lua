import "android.app.*"
import "android.os.*"
import "java.io.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "com.androlua.*"
import "toast"
import "lj"
layout={
  main={
    LinearLayout,
    orientation="vertical",
  },
}

luapath,luadir=...
luadir=luadir or luapath:gsub("/[^/]+$","")
package.path=package.path..";"..luadir.."/?.lua;"
import "loadlayout2"
require "xml2table"

if luapath:find("%.aly$") then
  local f=io.open(luapath)
  local s=f:read("*a")
  f:close()
  xpcall(function()
    layout.main=assert(loadstring("return "..s))()
  end,
  function()
    提示("不支持编辑该布局")
    activity.result{true}
  end)
  showsave=true
end

function onTouch(v,e)
  if e.getAction() == MotionEvent.ACTION_DOWN then
    getCurr(v)
    return true
  end
end

local TypedValue=luajava.bindClass("android.util.TypedValue")
local dm=activity.getResources().getDisplayMetrics()
function dp(n)
  return TypedValue.applyDimension(1,n,dm)
end

function to(n)
  return string.format("%ddp",n//dn)
end

dn=dp(1)
lastX=0
lastY=0
vx=0
vy=0
vw=0
vh=0
zoomX=false
zoomY=false
function move(v,e)
  curr=v.Tag
  currView=v
  ry=e.getRawY()--获取触摸绝对Y位置
  rx=e.getRawX()--获取触摸绝对X位置
  if e.getAction() == MotionEvent.ACTION_DOWN then
    lp=v.getLayoutParams()
    vy=v.getY()--获取视图的Y位置
    vx=v.getX()--获取视图的X位置
    lastY=ry--记录按下的Y位置
    lastX=rx--记录按下的X位置
    vw=v.getWidth()--记录控件宽度
    vh=v.getHeight()--记录控件高度
    if vw-e.getX()<20 then
      zoomX=true--如果触摸右边缘启动缩放宽度模式
     elseif vh-e.getY()<20 then
      zoomY=true--如果触摸下边缘启动缩放高度模式
    end

   elseif e.getAction() == MotionEvent.ACTION_MOVE then
    --lp.gravity=Gravity.LEFT|Gravity.TOP --调整控件至左上角
    if zoomX then
      lp.width=(vw+(rx-lastX))--调整控件宽度
     elseif zoomY then
      lp.height=(vh+(ry-lastY))--调整控件高度
     else
      lp.x=(vx+(rx-lastX))--移动的相对位置
      lp.y=(vy+(ry-lastY))--移动的相对位置
    end
    v.setLayoutParams(lp)--调整控件到指定的位置
    --v.Parent.invalidate()
   elseif e.getAction() == MotionEvent.ACTION_UP then
    if (rx-lastX)^2<100 and (ry-lastY)^2<100 then
      getCurr(v)
     else
      curr.layout_x=to(v.getX())
      curr.layout_y=to(v.getY())
      if zoomX then
        curr.layout_width=to(v.getWidth())
       elseif zoomY then
        curr.layout_height=to(v.getHeight())
      end
    end
    zoomX=false--初始化状态
    zoomY=false--初始化状态
  end
  return true
end

function getCurr(v)
  curr=v.Tag
  currView=v
  fd_dlg.setView(View(activity))
  fd_dlg.Title=tostring(v.Class.getSimpleName())
  if luajava.instanceof(v,GridLayout) then
    fd_dlg.setItems(fds_grid)
   elseif luajava.instanceof(v,LinearLayout) then
    fd_dlg.setItems(fds_linear)
   elseif luajava.instanceof(v,ViewGroup) then
    fd_dlg.setItems(fds_group)
   elseif luajava.instanceof(v,TextView) then
    fd_dlg.setItems(fds_text)
   elseif luajava.instanceof(v,ImageView) then
    fd_dlg.setItems(fds_image)
   else
    fd_dlg.setItems(fds_view)
  end
  if luajava.instanceof(v.Parent,LinearLayout) then
    fd_list.getAdapter().add("layout_weight")
   elseif luajava.instanceof(v.Parent,AbsoluteLayout) then
    fd_list.getAdapter().insert(5,"layout_x")
    fd_list.getAdapter().insert(6,"layout_y")
   elseif luajava.instanceof(v.Parent,RelativeLayout) then
    local adp=fd_list.getAdapter()
    for k,v in ipairs(relative) do
      adp.add(v)
    end
  end
  fd_dlg.show()
end

function adapter(t)
  local ls=ArrayList()
  for k,v in ipairs(t) do
    ls.add(v)
  end
  return ArrayAdapter(activity,android.R.layout.simple_list_item_1, ls)
end

import "android.graphics.drawable.*"
gd=GradientDrawable()
gd.setColor(0x00ffffff)
gd.setStroke(2,0x44000000,5,5)
gd.setGradientRadius(700)
gd.setGradientType(1)

curr=nil
activity.setTitle('布局助手')
--activity.setTheme(R.AndLua5)

xpcall(function()
  activity.setContentView(loadlayout2(layout.main,{}))
end,
function()
  提示("不支持编辑该布局")
  activity.result{true}
end)

relative={
  "layout_above","layout_alignBaseline","layout_alignBottom","layout_alignEnd","layout_alignLeft","layout_alignParentBottom","layout_alignParentEnd","layout_alignParentLeft","layout_alignParentRight","layout_alignParentStart","layout_alignParentTop","layout_alignRight","layout_alignStart","layout_alignTop","layout_alignWithParentIfMissing","layout_below","layout_centerHorizontal","layout_centerInParent","layout_centerVertical","layout_toEndOf","layout_toLeftOf","layout_toRightOf","layout_toStartOf"
}

--属性列表对话框
fd_dlg=AlertDialogBuilder(activity)
fd_list=fd_dlg.getListView()
fds_grid={
  "添加","删除","父控件","子控件",
  "id","orientation",
  "columnCount","rowCount",
  "layout_width","layout_height","layout_gravity",
  "background","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}

fds_linear={
  "添加","删除","父控件","子控件",
  "id","orientation","layout_width","layout_height","layout_gravity",
  "background","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}

fds_group={
  "添加","删除","父控件","子控件",
  "id","layout_width","layout_height","layout_gravity",
  "background","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}

fds_text={
  "删除","父控件",
  "id","layout_width","layout_height","layout_gravity",
  "background","text","textColor","textSize","singleLine","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}
fds_image={
  "删除","父控件",
  "id","layout_width","layout_height","layout_gravity",
  "background","src","scaleType","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}

fds_view={
  "删除","父控件",
  "id","layout_width","layout_height","layout_gravity",
  "background","gravity",
  "layout_margin","layout_marginLeft","layout_marginTop","layout_marginRight","layout_marginBottom",
  "padding","paddingLeft","paddingTop","paddingRight","paddingButtom",
}

--属性选择列表
checks={}
checks.singleLine={"true","false"}
checks.orientation={"vertical","horizontal"}
checks.gravity={"left","top","right","bottom","start","center","end"}
checks.layout_gravity={"left","top","right","bottom","start","center","end"}
checks.scaleType={
  "matrix",
  "fitXY",
  "fitStart",
  "fitCenter",
  "fitEnd",
  "center",
  "centerCrop",
  "centerInside"}


function addDir(out,dir,f)
  local ls=f.listFiles()
  for n=0,#ls-1 do
    local name=ls[n].getName()
    if ls[n].isDirectory() then
      addDir(out,dir..name.."/",ls[n])
     elseif name:find("%.j?pn?g$") then
      table.insert(out,dir..name)
    end
  end
end

function checkid()
  local cs={}
  local parent=currView.Parent.Tag
  for k,v in ipairs(parent) do
    if v==curr then
      break
    end
    if type(v)=="table" and v.id then
      table.insert(cs,v.id)
    end
  end
  return cs
end

rbs={"layout_alignParentBottom","layout_alignParentEnd","layout_alignParentLeft","layout_alignParentRight","layout_alignParentStart","layout_alignParentTop","layout_centerHorizontal","layout_centerInParent","layout_centerVertical"}
ris={"layout_above","layout_alignBaseline","layout_alignBottom","layout_alignEnd","layout_alignLeft","layout_alignRight","layout_alignStart","layout_alignTop","layout_alignWithParentIfMissing","layout_below","layout_toEndOf","layout_toLeftOf","layout_toRightOf","layout_toStartOf"}
for k,v in ipairs(rbs) do
  checks[v]={"true","false","none"}
end

for k,v in ipairs(ris) do
  checks[v]=checkid
end

if luadir then
  checks.src=function()
    local src={}
    addDir(src,"",File(luadir))
    return src
  end
end

fd_list.onItemClick=function(l,v,p,i)
  fd_dlg.hide()
  local fd=tostring(v.Text)
  if checks[fd] then
    if type(checks[fd])=="table" then
      check_dlg.Title=fd
      check_dlg.setItems(checks[fd])
      check_dlg.show()
     else
      check_dlg.Title=fd
      check_dlg.setItems(checks[fd](fd))
      check_dlg.show()
    end
   else
    func[fd]()
  end
end

--子视图列表对话框
cd_dlg=AlertDialogBuilder(activity)
cd_list=cd_dlg.getListView()
cd_list.onItemClick=function(l,v,p,i)
  getCurr(chids[p])
  cd_dlg.hide()
end

--可选属性对话框
check_dlg=AlertDialogBuilder(activity)
check_list=check_dlg.getListView()
check_list.onItemClick=function(l,v,p,i)
  local v=tostring(v.Text)
  if #v==0 or v=="none" then
    v=nil
  end
  local fld=check_dlg.Title
  local old=curr[tostring(fld)]
  curr[tostring(fld)]=v
  check_dlg.hide()
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(fld)]=old
    print(l)
  end
end

func={}
setmetatable(func,{__index=function(t,k)
    return function()
      sfd_dlg.Title=k--tostring(currView.Class.getSimpleName())
      --sfd_dlg.Message=k
      fld.Text=curr[k] or ""
      sfd_dlg.show()
    end
  end
})
func["添加"]=function()
  add_dlg.Title=tostring(currView.Class.getSimpleName())
  for n=0,#ns-1 do
    if n~=i then
      el.collapseGroup(n)
    end
  end
  add_dlg.show()
end

func["删除"]=function()
  local gp=currView.Parent.Tag
  if gp==nil then
    提示("不可以删除顶部控件")
    return
  end
  for k,v in ipairs(gp) do
    if v==curr then
      table.remove(gp,k)
      break
    end
  end
  activity.setContentView(loadlayout2(layout.main,{}))
end


func["父控件"]=function()
  local p=currView.Parent
  if p.Tag==nil then
    提示("已是顶部控件")
   else
    getCurr(p)
  end
end

chids={}
func["子控件"]=function()
  chids={}
  local arr={}
  for n=0,currView.ChildCount-1 do
    local chid=currView.getChildAt(n)
    chids[n]=chid
    table.insert(arr,chid.Class.getSimpleName())
  end
  cd_dlg.Title=tostring(currView.Class.getSimpleName())
  cd_dlg.setItems(arr)
  cd_dlg.show()
end

--添加视图对话框
add_dlg=Dialog(activity)
add_dlg.Title="添加"
wdt_list=ListView(activity).setDividerHeight(0)

ns={
  "Widget - 小部件","Check View - 检查视图","Adapter View - 适配器视图","Advanced View - 高级控件","Layout - 布局","Advanxed Layout - 高级布局","Other Widget - 其它控件",
}
wdt={
  {"Button -按钮控件","EditText -编辑框控件","ImageButton -图片按钮控件","ImageView -图片控件","CircleImageView -圆形图片控件","SearchView -搜索框"},
  {"CheckBox -复选框","RadioButton -单选框","ToggleButton -按钮开关控件","Switch -开关控件"},
  {"ListView -列表视图","GridView -网格视图","PageView -滑动视图","ExpandableListView -折叠列表","Spinner -下拉框"},
  {"SeekBar -拖动条","ProgressBar -进度条","RatingBar -评分栏",
    "DatePicker -日期选择器","TimePicker -时间选择器","NumberPicker -数字选择器","Chronometer(未知)"},
  {"LinearLayout -线性布局","AbsoluteLayout -绝对布局","FrameLayout -帧布局","RelativeLayout -相对布局","TableLayout -表布局","RippleLayout -水波纹布局"},
  {"CardView -卡片控件","RadioGroup -单选视图","GridLayout -网格布局",
    "ScrollView -纵向滚动布局","HorizontalScrollView -横向滚动布局"},
  {"LuaEditor -Lua代码编辑框","LuaWebView -Lua浏览器控件","PullingLayout -下拉刷新"}
}

wds={
  {"Button","EditText","TextView",
    "ImageButton","ImageView","CircleImageView","SearchView"},
  {"CheckBox","RadioButton","ToggleButton","Switch"},
  {"ListView","GridView","PageView","ExpandableListView","Spinner"},
  {"SeekBar","ProgressBar","RatingBar",
    "DatePicker","TimePicker","NumberPicker","Chronometer"},
  {"LinearLayout","AbsoluteLayout","FrameLayout","RelativeLayout","TableLayout","RippleLayout"},
  {"CardView","RadioGroup","GridLayout",
    "ScrollView","HorizontalScrollView"},
  {"LuaEditor","LuaWebView","PullingLayout"}
}



mAdapter=ArrayExpandableListAdapter(activity)
for k,v in ipairs(ns) do
  mAdapter.add(v,wdt[k])
end

el=ExpandableListView(activity).setDividerHeight(0)
el.setAdapter(mAdapter)
add_dlg.setContentView(el)

el.onChildClick=function(l,v,g,c)
  local w={_G[wds[g+1][c+1]]}
  table.insert(curr,w)
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    table.remove(curr)
    print(l)
  end
  add_dlg.hide()
end



function ok()
  local v=tostring(fld.Text)
  if #v==0 then
    v=nil
  end
  local fld=sfd_dlg.Title
  local old=curr[tostring(fld)]
  curr[tostring(fld)]=v
  --sfd_dlg.hide()
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(fld)]=old
    print(l)
  end
end

function none()
  local old=curr[tostring(sfd_dlg.Title)]
  curr[tostring(sfd_dlg.Title)]=nil
  --sfd_dlg.hide()
  local s,l=pcall(loadlayout2,layout.main,{})
  if s then
    activity.setContentView(l)
   else
    curr[tostring(sfd_dlg.Title)]=old
    print(l)
  end
end


--输入属性对话框
sfd_dlg=AlertDialogBuilder(activity)
fld=EditText(activity)
sfd_dlg.setView(fld)
sfd_dlg.setPositiveButton("确定",{onClick=ok})
sfd_dlg.setNegativeButton("取消",nil)
sfd_dlg.setNeutralButton("无",{onClick=none})
function dumparray(arr)
  local ret={}
  table.insert(ret,"{\n")
  for k,v in ipairs(arr) do
    table.insert(ret,string.format("\"%s\";\n",v))
  end
  table.insert(ret,"};\n")
  return table.concat(ret)
end
function dumplayout(t)
  table.insert(ret,"{\n")
  table.insert(ret,tostring(t[1].getSimpleName()..";\n"))
  for k,v in pairs(t) do
    if type(k)=="number" then
      --do nothing
     elseif type(v)=="table" then
      table.insert(ret,k.."="..dumparray(v))
     elseif type(v)=="string" then
      if v:find("[\"\'\r\n]") then
        table.insert(ret,string.format("%s=[==[%s]==];\n",k,v))
       else
        table.insert(ret,string.format("%s=\"%s\";\n",k,v))
      end
     else
      table.insert(ret,string.format("%s=%s;\n",k,tostring(v)))
    end
  end
  for k,v in ipairs(t) do
    if type(v)=="table" then
      dumplayout(v)
    end
  end
  table.insert(ret,"};\n")
end

function dumplayout2(t)
  ret={}
  dumplayout(t)
  return table.concat(ret)
end
local function 拖动条颜色(id,颜色)
  id.ProgressDrawable.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
  id.Thumb.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
end
local function 调色板()
  require "import"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.PorterDuffColorFilter"
  import "android.graphics.PorterDuff"
  调色板布局=
  {
    LinearLayout;
    layout_width="fill";
    gravity="center";
    layout_height="fill";
    {
      CardView;
      layout_width="320dp";
      radius=25;
      layout_height="360dp";
      {
        LinearLayout;
        layout_width="fill";
        orientation="vertical";
        layout_height="fill";
        {
          TextView;
          layout_marginTop="10dp";
          layout_marginLeft="25dp";
          text="调色板";
          textColor="0xFF03A9F4";
          textSize="20sp";
        };
        {
          LinearLayout;
          layout_width="fill";
          orientation="vertical";
          gravity="center";
          layout_height="fill";
          {
            CardView;
            id="卡片颜色";
            CardElevation=0,
            radius="125",
            layout_width="85dp";
            layout_height="85dp";
          };
          {
            TextView;
            id="字体颜色";
            text="0xFFFFFFFF";
            layout_marginTop="10dp";
          };
          {
            LinearLayout;
            orientation="horizontal";
            gravity="center";
            layout_marginTop="10dp";
            layout_width="fill";
            layout_height="30dp";
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                text="A";
              };
            };
            {
              LinearLayout;
              gravity="center";
              layout_width="250dp";
              {
                SeekBar;
                id="拖动一";
                layout_width="250dp";
              };
            };
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                id="文本1";
                text="0xff";
              };
            };
          };
          {
            LinearLayout;
            orientation="horizontal";
            gravity="center";
            layout_marginTop="10dp";
            layout_width="fill";
            layout_height="30dp";
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                text="B";
              };
            };
            {
              LinearLayout;
              gravity="center";
              layout_width="250dp";
              {
                SeekBar;
                id="拖动二";
                layout_width="250dp";
              };
            };
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                id="文本2";
                text="0xff";
              };
            };

          };
          {
            LinearLayout;
            orientation="horizontal";
            gravity="center";
            layout_marginTop="10dp";
            layout_width="fill";
            layout_height="30dp";
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                text="C";
              };
            };
            {
              LinearLayout;
              gravity="center";
              layout_width="250dp";
              {
                SeekBar;
                id="拖动三";
                layout_width="250dp";
              };
            };
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                id="文本3";
                text="0xff";
              };
            };
          };
          {
            LinearLayout;
            orientation="horizontal";
            gravity="center";
            layout_marginTop="10dp";
            layout_width="fill";
            layout_height="30dp";
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                text="D";
              };
            };
            {
              LinearLayout;
              gravity="center";
              layout_width="250dp";
              {
                SeekBar;
                id="拖动四";
                layout_width="250dp";
              };
            };
            {
              LinearLayout;
              gravity="center";
              {
                TextView;
                id="文本4";
                text="0xff";
              };
            };
          };
          {
            LinearLayout;
            layout_width="fill";
            gravity="right";
            layout_height="fill";
            {
              Button;
              id="关闭调色板";
              textColor="0xFF383A3D",
              backgroundColor="0xffffff";
              text="取消";
            };
            {
              Button;
              textColor="0xFF03A9F4",
              id="复制";
              text="复制";
              backgroundColor="0xffffff";
              layout_marginRight="5dp";
            };
          };
        };
      };
    };
  };
  dialog= AlertDialog.Builder(this)
  dialog1=dialog.show()
  dialog1.getWindow().setContentView(loadlayout(调色板布局));
  dialog1.setCanceledOnTouchOutside(true)
  import "android.graphics.drawable.ColorDrawable"
  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
  拖动一.setMax(255)
  拖动二.setMax(255)
  拖动三.setMax(255)
  拖动四.setMax(255)
  拖动一.setProgress(0xFF)
  拖动二.setProgress(0xFF)
  拖动三.setProgress(0xFF)
  拖动四.setProgress(0xFF)
  拖动一.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动二.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动三.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动四.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }
  function updateArgb()
    local a=拖动一.getProgress()
    local b=拖动二.getProgress()
    local c=拖动三.getProgress()
    local d=拖动四.getProgress()
    local abcd_hex=(a<<24|b<<16|c<<8|d)
    字体颜色.Text=string.format("%#x", abcd_hex)
    卡片颜色.setCardBackgroundColor(abcd_hex)
    文本1.text=string.format("%#x",a)
    文本2.text=string.format("%#x",b)
    文本3.text=string.format("%#x",c)
    文本4.text=string.format("%#x",d)
  end
  复制.onClick=function()
    local a=拖动一.getProgress()
    local b=拖动二.getProgress()
    local c=拖动三.getProgress()
    local d=拖动四.getProgress()
    local abcd_hex=(a<<24|b<<16|c<<8|d)
    local abcd_str=string.format("%#x", abcd_hex)
    写入剪切板(abcd_str) print"已复制到剪切板"
    dialog1.dismiss()
  end
  关闭调色板.onClick=function()
    dialog1.dismiss()
  end
  function showArgbDialog()
    updateArgb()
  end
  showArgbDialog()
  拖动条颜色(拖动一,0xff000000)
  拖动条颜色(拖动二,0xffff0000)
  拖动条颜色(拖动三,0xFF1DE9B6)
  拖动条颜色(拖动四,0xFF6699FF)
end


function onCreateOptionsMenu(menu)
  menu.add("复制")
  menu.add("编辑")
  menu.add("预览")
  menu.add("调色板")
  menu.add("保存")
end


function save(s)
  local f=io.open(luapath,"w")
  f:write(s)
  f:close()
end

import "android.content.*"
cm=activity.getSystemService(activity.CLIPBOARD_SERVICE)

function onMenuItemSelected(id,item)
  local t=item.getTitle()
  if t=="复制" then
    local cd = ClipData.newPlainText("label",dumplayout2(layout.main))
    cm.setPrimaryClip(cd)
    print("已复制到剪切板")
   elseif t=="编辑" then
    editlayout(dumplayout2(layout.main))
   elseif t=="预览" then
    show(dumplayout2(layout.main))
   elseif t=="调色板" then
    调色板()
   elseif t=="保存" then
    save(dumplayout2(layout.main))
    activity.result{true}
  end
end



function onStart()
  activity.setContentView(loadlayout2(layout.main,{}))
end
参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 参数+2 > tonumber(os.time()) then
      activity.finish()
     else
      print("再按一次退出")
      参数=tonumber(os.time())
    end
    return true
  end
end
