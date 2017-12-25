【VPN】: Virtual Private Network, 虚拟专用网络
  虚拟专用网络的功能是：在公用网络上建立专用网络，进行加密通讯。在企业网络中有广泛应用。
VPN网关通过对数据包的加密和数据包目标地址的转换实现远程访问。
VPN有多种分类方式，主要是按协议进行分类。
VPN可通过服务器、硬件、软件等多种方式实现。


【VPS】: Virtual Private Server, 虚拟专用服务器
  VPS（Virtual Private Server 虚拟专用服务器）技术，将一台服务器分割成多个虚拟专享服务器的优质服务。
实现VPS的技术分为容器技术，和虚拟化技术。
在容器或虚拟机中，每个VPS都可分配独立公网IP地址、独立操作系统、实现不同VPS间磁盘空间、内存、CPU资源、进程和系统配置的隔离，为用户和应用程序模拟出“独占”使用计算资源的体验。
VPS可以像独立服务器一样，重装操作系统，安装程序，单独重启服务器。
VPS为使用者提供了管理配置的自由，可用于企业虚拟化，也可以用于IDC资源租用。
  IDC资源租用，由VPS提供商提供。
不同VPS提供商所使用的硬件VPS软件的差异，及销售策略的不同，VPS的使用体验也有较大差异。
尤其是VPS提供商超卖，导致实体服务器超负荷时，VPS性能将受到极大影响。
相对来说，容器技术比虚拟机技术硬件使用效率更高，更易于超卖，所以一般来说容器VPS的价格都高于虚拟机VPS的价格。
  这些VPS主机以最大化的效率共享硬件、软件许可证以及管理资源。
每个VPS主机都可分配独立公网IP地址、独立操作系统、独立超大空间、独立内存、独立CPU资源、独立执行程序和独立系统配置等。
VPS主机用户除了可以分配多个虚拟主机及无限企业邮箱外，更具有独立主机功能，可自行安装程序，单独重启主机。
  简单理解VPS就是一台拥有公网IP的服务器

****************************************************************************************************
****************************************************************************************************

使用shadowsocks科学上网

  刚刚，有司又对VPN下手了。墙越来越高了。
  7月1日，中国加大力度打击 VPN
  据报导，自7月1日起，中国的 Android 和苹果应用商店将不再允许 VPN 应用下载，以阻止中国网民绕过“网络防火墙”（GFW）浏览墙外内容。
  VPN 供应商 Green 已于6月22日发布公告，证实自7月1日起停止服务。
  此外，Netfits、VPN Master Pro、Ponhon、Snap VPN 和 SkyX 等 VPN 供应商在过去几个月里，也或被迫停止服务，或从应用商店消失。
  不过，想翻墙还是有办法的，比如本文要介绍的shadowsocks。
  shadowsocks是一款自定义协议的代理软件，由于其流量特征不明显，不太容易用技术手段拦截。
  虽然作者@clowwindy两年前就被有司请喝茶了，shadowsocks却一直运转良好没有被彻底封杀过。

一、简单介绍一下shadowsocks翻墙的原理
    shadowsocks客户端启动后会在本地开启一个代理，可以理解为一个数据的出入口。用户想通过shadowsocks访问墙外网站的请求都要经过这个本地代理。
    通过shadowsocks翻墙上网的过程是这样的：
    1. 用户发起一个网络访问请求，比如用浏览器访问google.com，请求被发送到本地代理。
    2. 客户端从本地代理拿到请求数据，然后发送至墙外的shadowsocks服务端。
    3. 服务端向google.com发起请求，然后收到google的响应数据，也就是google首页的数据。
    4. 服务端把响应数据发回客户端。
    5. 客户端再通过本地代理把响应数据交给浏览器，google首页就显示出来了。
    整个过程中的第2步和第4步都是通过shadowsocks自定义的协议隐蔽地进行，很难被过滤，所以我们才能一直用它顺畅地翻墙。

二、我不想听原理，我只想马上翻墙
    简单地说，用shadowsocks翻墙，你需要一个客户端和一个服务端。
    1. 客户端
       （1）Windows、macOS、Android平台都有官方提供的免费客户端可用，下载地址如下：
            Windows
            macOS
            Android
       （2）iOS平台有一些收费的App支持shadowsocks, 比如：
            shadowrocket
    2. 服务端
       市面上有一些shadowsocks服务可供购买，比如：
       https://www.shadowsocks.com.hk/
       如果你愿意折腾，可以自己租一个VPS搭建shadowsocks服务，成本更低，而且流量上限取决于你购买的VPS套餐，一般来说都很充裕。

三、shadowsocks服务搭建指南
    1. 购买VPS服务器
       主流的VPS（虚拟主机）服务器提供商有三家：
       （1）linode
       （2）digital ocean
       （3）bandwagon
       下面的比上面的便宜。如果只是自用，bandwagon足够。
       一般使用paypal绑定一个visa或mastercard信用卡来付款。注意要用国际paypal帐号，国内的是不能用外币付款的。
       在bandwagon购买VPS以后会获得一个主机地址和用于ssh登录的root密码。
    2. 远程登陆VPS
       Mac OS X 或Linux下直接在终端中：
       # ssh root@your_vps_ip -p your_ssh_port
       即可。
       在windows系统下需要专门的客户端来SSH登录VPS。在xShell官网  下载xShell。
       家庭和学校用户可以免费试用，下载时选择home and school use即可。需要用邮箱注册一下，下载链接会发送到邮箱中。
       xShell中新建一个连接，会要求输入目标IP地址和端口，以及root密码，按提示操作即可。
    3. 安装shadowsocks
       打开shell，使用VPS服务商提供的root用户和密码SSH登录VPS。然后执行如下命令：
       （1）Debian/Ubuntu:
            # apt-get install python-pip
            # pip install shadowsocks
       （2）CentOS:
            # yum install python-setuptools && easy_install pip
            # pip install shadowsocks
       shadowsocks就安装好了。
       有时Ubuntu会遇到第一个命令安装python-pip时找不到包的情况。pip官方给出了一个安装脚本，可以自动安装pip。先下载脚本，然后执行即可：
       # wget https://bootstrap.pypa.io/get-pip.py
       # python get-pip.py
       或者使用easy_install安装：
       # sudo easy_install shadowsocks
    4. 编写配置文件
       shadowsocks启动时的参数，如服务器端口，代理端口，登录密码等，可以通过启动时的命令行参数来设定，也可以通过json格式的配置文件设定。
       推荐使用配置文件，方便查看和修改。
       用vi新建一个配置文件：
       # vi /etc/shadowsocks.json
       然后输入如下内容：
       { 
         "server":"my_server_ip", 
         "server_port":25, 
         "local_address": "127.0.0.1", 
         "local_port":1080, 
         "password":"mypassword",
         "timeout":300, 
         "method":"aes-256-cfb", 
         "fast_open": false
       }
       简单说明一下各个配置项：
       （1）server
            你的VPS服务器的IP地址
       （2）server_port
            你的shadowsocks服务端口。一般可以填一个1025到49151之间的数字。
            不过如果使用一个知名端口，比如25（电子邮件）、21（FTP），“可能”会更安全，因为GFW对这些基础互联网服务下手的可能性似乎会小一些。
            注意不要和你的VPS上已经有的服务冲突。
       （3）local_address
            本地IP地址，作为服务器使用的时候可以不用关注，填127.0.0.1即可。
       （4）local_port
            本地端口，也不用关注。
       （5）password
            你的shadowsocks服务密码，客户端连接时需要填写的。
       （6）timeout
            超时时间，如果当心网络不好可以设置大一点。
       （7）method
            加密方式，建议填写aes-256-cfb，安全性比较高。
       （8）fast_open
            在Ubuntu上建议填True。
       填好以后保存退出。
    5. 启动shadowsocks
       如果已经写好了配置文件，启动shadowsocks服务器的命令如下：
       # ssserver -c /etc/shadowsocks.json
       后台启动和停止shadowsocks服务器：
       # ssserver -c /etc/shadowsocks.json -d start
       # ssserver -c /etc/shadowsocks.json -d stop
       shadowsocks的日志保存在
       /var/log/shadowsocks.log

四、配置shadowsocks客户端
    客户端和服务端都有了，只要配置一下客户端就可以愉快地翻墙了。
    客户端需要按照服务器的配置填写服务器IP地址、服务器端口、本地端口（如果没有本地端口选项，就是默认的1080）、密码、加密方式等参数，
    可以参看上面的“编写配置文件”小节。
    Windows和macOS客户端支持全局代理和PAC代理两种方式，后者会使用一个脚本来自动检查一个网站是否在需要代理的网站列表中，自动选择直接连接或代理连接。
    PAC列表可以在线更新，但是难免有收录不全的情况。如果你用Chrome,可以使用支持自定义规则的代理管理插件来实现自动切换代理，比如switchyOmega。

五、使用switchyOmega实现自动切换代理
    switchyOmega是Chrome浏览器上一个很好用的代理管理插件。
    chrome应用商店本身需要翻墙才能访问，因此需要先在shadowsocks启动代理模式下下载安装，再关闭shadowsocks代理。
    安装完毕后，右击switchyOmega图标，选择选项，进入switchOmega配置界面。
    1. 创建shadowsocks情景模式
       新建一个情景模式，比如叫SS，代理协议选择socks5，代理地址为127.0.0.1，端口1080。
       现在切换到SS情景模式就可以通过shadowsocks科学上网了。后面获取自动切换规则列表
    2. 设置自动切换模式
       在设置界面选择自动切换模式，在“切换规则”中勾选“规则列表规则”，对应的情景模式选择刚刚新建的SS。
       然后在下面的规则列表地址中填写
       https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
       规则列表格式选择AutoProxy。这是一个一直在维护的被墙网站列表，项目地址是https://github.com/gfwlist/gfwlist。
       然后点击立即更新情景模式， 更新完成后会有提示。
       点击左侧的“应用选项”。然后单击switchyOmega图标，选择自动切换，就可以在访问“不存在的网站”时自动切换到shadowsocks代理了。
    3. 添加自定义规则
       如果遇到某个国外网站无法直接连接或速度太慢时，可以单击switchyOmega图标，选择“添加条件”，情景模式选择SS，就可以了。
       这时打开switchyOmega选项，在自动切换模式的切换规则中就可以看到刚刚添加的规则。可以在这里管理自定义的规则。
    4. 导入和导出switchyOmega设置
       如果换了一台电脑，重新设置一遍switchyOmega就太麻烦了。
       可以在设置好的switchyOmega中导出设置文件，在另一个chrome浏览器中导入，就可以直接复制原来的设置了。
       在switchyOmega选项的左侧点击“导入/导出”，点击“生成备份文件”即可生成switchyOmega设置备份。点击“从备份文件恢复”可以导入备份文件。
