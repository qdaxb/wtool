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
* expect（部分模块）
* php4.0+（部分模块）

# 安装
```
curl -s "https://raw.githubusercontent.com/qdaxb/wtool/master/doc/get.sh" |bash -s 
```
> * 无参数： 交互式安装
> * install：自动安装
> * download：仅下载

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


## 目录说明
```
.
├── common        
    └── tools    # 通用工具目录
└── custom       # 自定义模块目录

``` 
