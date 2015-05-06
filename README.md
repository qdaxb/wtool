     __    __  _____            _
    / / /\ \ \/__   \___   ___ | |
    \ \/  \/ /  / /\/ _ \ / _ \| |
     \  /\  /  / / | (_) | (_) | |
      \/  \/   \/   \___/ \___/|_|
# 介绍
* 开发、运维工具及相关配置(基于mac及linux)。

# 系统需求
* Mac/Linux
* git 1.7.4+
* php4.0+（部分模块）

# 安装
```
curl -s "https://raw.githubusercontent.com/qdaxb/wtool/master/doc/get.sh" |bash -s 
```

# 使用
## 系统命令
* `wtool`
> 显示系统命令列表

* `wtool list`
> 列出所有可用命令

* `wtool update`
> 更新wtool

* `wtool addmodule group/project`
> 添加自定义模块，group/project对应github中的组名/项目名.

* `wtool rmmodule group/project`
> 删除自定义模块，group/project对应github中的组名/项目名.

## 通用命令

* `wtool mc ip1[:port1][,ip2[:port2]] [port] "command"`
> 批量执行mc命令

* `wtool redis ip1[:port1][,ip2[:port2]] [port] "command"`
> 批量执行redis命令(需要redis-cli)

* `wtool send filename [port]`
> 使用nc发送文件（默认8888端口），接收方可以通过浏览器下载

* `wtool encode "string" [type]`
> 编码字符串，可选的type为url(default) | utf8 | html | base64。需要安装php。

* `wtool decode "string" [type]`
> 解码字符串，可选的type为url(default) | utf8 | html | base64。需要安装php。

* `wtool hex [0x]number[b]`
> 计算数字的10进制、16进制及2进制文本，输入参数默认为10进制，可选16进制（0x）及二进制（b）。

## java命令
* `wtool housemd pid [java_home]`
> 使用housemd对java程序进行运行时跟踪，支持的操作有：
> > - 查看加载类
> > - 跟踪方法 
> > - 查看环境变量
> > - 查看对象属性值
> 
> 详细信息请参考[housemd说明文档](https://github.com/qdaxb/wtool/raw/master/java/tools/housemd.lib/README.md)

* `wtool jarconfict path`
> 查找jar包间冲突的类

* `wtool jarfind classname path`
> 在jar包中查找类名

* `wtool jargrep "text" <path or jarfile>`
> 在jar包中查找文本，可查找常量字符串、类引用。

* `wtool findcycle [path]`
> 查找当前工程中是否存在循环引用（目前仅支持maven工程，默认为当前路径）

* `wtool jvm pid`
> 执行jvm debug工具，包含对java栈、堆、线程、gc等状态的查看。
> > * 进入jvm工具后可以输入序号执行对应命令
> > * 可以一次执行多个命令，用分号";"分隔，如：1;3;4;5;6
> > * 每个命令可以带参数，用冒号":"分隔，同一命令的参数之间用逗号分隔，如：1:1000,100;3;5:/data1/output.bin

更多介绍请参考：
https://github.com/qdaxb/wtool_java

## 目录说明
```
.
├── common        
    └── tools    # 通用工具目录
└── custom       # 自定义模块目录

``` 
