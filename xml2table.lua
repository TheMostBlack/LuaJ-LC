require "import"
import "console"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "com.androlua.*"
import "loadlayout3"
import "lj"
import "toast"
--activity.setTitle('XML转换器')
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
t={
  LinearLayout;
  id="l";
  orientation="vertical";
  {
    LinearLayout;
    layout_width="fill";
    backgroundColor="0xffffffff";
    {
      Button;
      layout_width="fill";
      layout_weight=1;
      id="open";
      background="0";
      text="转换";
      onClick="click";
    };
    {
      Button;
      layout_width="fill";
      layout_weight=1;
      id="open";
      background="0";
      text="预览";
      onClick="click2";
    };
    {
      Button;
      layout_width="fill";
      layout_weight=1;
      id="open";
      background="0";
      text="复制";
      onClick="click3";
    };
    {
      Button;
      layout_width="fill";
      layout_weight=1;
      id="open";
      background="0";
      text="确定";
      onClick="click4";
    };
  };
  {
    RelativeLayout;
    layout_width="match_parent";
    layout_height="match_parent";
    {
      LuaEditor;
      id="edit";
    };
    {
      LinearLayout;
      layout_alignParentBottom="true";
      layout_width="fill";
      layout_height="6%h";
      {
        HorizontalScrollView;
        background="#ffffff";
        layout_width="fill";
        layout_height="fill";
        horizontalScrollBarEnabled=false;
        {
          LinearLayout;
          id="bar3";
          layout_height="fill";
          layout_width="fill";
        }
      }
    };
  };
};


function xml2table(xml)
  local xml,s=xml:gsub("</%w+>","}")
  if s==0 then
    return xml
  end
  xml=xml:gsub("<%?[^<>]+%?>","")
  xml=xml:gsub("xmlns:android=%b\"\"","")
  xml=xml:gsub("%w+:","")
  xml=xml:gsub("\"([^\"]+)\"",function(s)return (string.format("\"%s\"",s:match("([^/]+)$")))end)
  xml=xml:gsub("[\t ]+","")
  xml=xml:gsub("\n+","\n")
  xml=xml:gsub("^\n",""):gsub("\n$","")
  xml=xml:gsub("<","{"):gsub("/>","}"):gsub(">",""):gsub("\n",",\n")
  return (xml)
end
dlg=Dialog(activity,android.R.style.Theme_DeviceDefault_Light)
dlg.setTitle("布局表预览")
function show(s)
  dlg.setContentView(loadlayout3(loadstring("return "..s)(),{}))
  dlg.show()
end
function click()
  local str=edit.getText().toString()
  str=xml2table(str)
  str=console.format(str)
  edit.setText(str)
end

function click2()
  local str=edit.getText().toString()
  show(str)
end


function click3(s)
  local cd = ClipData.newPlainText("label", edit.getText().toString())
  cm.setPrimaryClip(cd)
  Toast.makeText(activity,"已复制的剪切板",1000).show()
end

function click4()
  local str=edit.getText().toString()
  layout.main=loadstring("return "..str)()
  activity.setContentView(loadlayout2(layout.main,{}))
  dlg2.hide()

end


loadlayout(t)
dlg2=Dialog(activity,android.R.style.Theme_DeviceDefault_Light)
dlg2.setTitle("编辑代码")
dlg2.getWindow().setSoftInputMode(0x10)

dlg2.setContentView(l)
edit.setBasewordColor(0xff8dbdc9)--基词
edit.setPanelBackgroundColor(0xffffffff)--卡片颜色
edit.setPanelTextColor(0xFF03A9F4)--卡片字体颜色
edit.setStringColor(0xFF03A9F4)--字符串颜色
edit.setTextColor(0xFF383A3D)--文本颜色
edit.setUserwordColor(0xFF03A9F4)--数字
edit.setCommentColor(0xffa0a0a0)--注释颜色
edit.setKeywordColor(0xFF03A9F4)--if then等
local fh=io.open(activity.getLuaDir().."/Verify/set2.XY"):read("*a")
for t,c in fh:gmatch("(.-) ") do
  button={
    Button;
    text=tostring(t);
    layout_width="45dp";
    layout_height="fill";
    background="#ffffff";
    textColor=0xFF03A9F4;
    padding="5dp",
    id="sssss1",
  };
  m31=loadlayout(button)
  bar3.addView(m31)
  波纹(sssss1,0xE7EAEEEE)
  m31.onClick=function(v)
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
  m31.onLongClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
      q.paste("function")
     else
      if v.text=="End" or v.text=="end" then
        q.paste("end")
       else
        q.paste(v.Text..v.text)
      end
    end
    return true
  end
end
function editlayout(txt)
  edit.Text=txt
  edit.format()
  dlg2.show()
end

function onResume2()
  local cd=cm.getPrimaryClip();
  local msg=cd.getItemAt(0).getText()--.toString();
  edit.setText(msg)
end
