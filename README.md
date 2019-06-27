# BS

Homework of B/S

整体使用MYSQL+asp.net+(一点点JavaScript) 已完成所有必须功能

使用IIS发布网站，注意不要使用有线网络发布，行不通，也不知道为什么

通信部分使用SignalR 参考自 https://github.com/shi-tou/SignalR_ChatRoom  移植也费了很久时间

需要实现的基本功能如下：

1、实现用户注册、登录功能，用户注册时需要填写必要的信息并验证，如用户名、密码要求在6字节以上，email的格式验证，并保证用户名和email在系统中唯一。

2、用户登录后可以发布要交易的书籍，需要编辑相关信息，包括书名、原价、出售价、类别和内容介绍等信息、外观照片等，可以通过ISBN和书名链接到外部系统（如Amazon/京东/当当等网站）的详细介绍页面。

3、根据用户发布的书籍聚合生成首页，可以分类检索。

4、用户可以设置交易模式为寄送还是线下交易，生成订单时录入不同内容。

5、集成一个消息系统，买家和卖家之间可以通信。

6、提供求购模块，用户可以发布自己想要的书籍。

7、界面样式需要适配PC和手机的浏览器。

增强功能：

8、实现一个Android或iphone客户端软件，功能同网站，额外支持定位功能，发布时记录位置，
可以根据用户的位置匹配最近的待售书籍。消息和订单支持推送。

为了提交作业方便，如有数据库，建议使用mysql或mangodb，提交作业时同时附带SQL脚本文件
