# LuaJ++LC
LuaJ++JC,基于LuaJ++开发的编辑器

入口文件

Activity main.lua

Service service.lua

AccessibilityService accessibility.lua

NotificationListenerService notification.lua


可省略非必要关键字
--
省略then
if a then
end
-->
if a
end

省略do
while a do
end

while a
end

省略in
for k,v in pairs(t) do
end
-->
for k,v pairs(t)
end

支持switch
--
    switch a
    case 1,3,5,7,9
    print(1)
    case 2,4,6,8
    print(2)
    case 0
    print(0)
    default
    print(nil)
    end


支持when
--
    a=when a
    case 1,3,5,7,9
    return 1
    case 2,4,6,8
    return 2
    case 0
    return 0  
    default
    return nil
 end
 

支持continue
--
    for n=1,10
    if n%2==0
    continue
    end
    print(n)
    end



支持foreach
--
    for k,v : t
    end



支持defer
--
defer后语句将在函数结束时运行，多个defer将按照后入先出原则运行。

    function f()
    defer print("defer")
    print("func")
    end
    f()



支持try-catch-finally
--
    try
    error("err")
    catch(m)
    print("catch",m)
    finally
    print("finally")
    end



支持import
--

import将导入包并设置为局部变量，支持别名。

    import "java.lang.String"
    import str "java.lang.String"
    import "java.lang.String","java.lang.Integer"

支持导入java包。

    import "java.lang.*"

支持导入并返回值，返回模式不设置局部变量或全局导入包。

    str=import "java.lang.String"
    lang=import "java.lang.*"



支持module
--
module自带环境，默认设置环境表的metatable为自己

    module "name"



支持自赋值local
--
将全局print设置为局部print

    local:print



调用java优化
--
直接()构建实例或实现接口

    b=ArrayList()
    m=HashMap()
    i=interface{
    methodname=function(arg)
    end
    }


支持覆盖方法
--
    list=ArrayList.override{
    function add(a,s)
    s(a) 
    end
    }()


直接创建数组
--
    i=int[10]
    java 方法使用.调用
    b.add(!)
    java getter/setter
    b.setText("")
    -->
    b.text=""
    m.abc=1
    t=b.getText()
    -->
    t=b.text
    t=m.abc


支持64位整数
--
    i=0xffffffffff


支持位运算
--

按位与

    a=1&2

按位或

    a=1|2

按位异或

    a=1~2

右移

    a=1>>8

左移

    a=8<<2

按位非

    a=~2

Lua标准库请参考官方文档
