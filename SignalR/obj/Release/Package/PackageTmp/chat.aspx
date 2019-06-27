<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="SignalR.chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Css/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/layer/layer.js"></script>
    <script src="Scripts/layer/extend/layer.ext.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.min.js"></script>
    <%--以下引用是必须的（该目录是不存在的，但是SignalR运行必须的虚拟目录）--%>
    <script src="/SignalR/hubs"></script>
    <script>
        var msgTemplate = '<li class="{Type}">'
                            + '<p class="chat-name">{NickName}（{ChatTime}）</p>'
                            + '<p class="chat-content">{Content}</p>'
                        + '</li>';
        var userID;

        $(function () {
            //prompt层
            userID = new Date().getTime().toString(36);
            layer.prompt({
                title: '输入您的聊天昵称，并确认',
                formType: 0 
            }, function (pass) {
                initChat(userID, pass);
                layer.msg('您的昵称设置为：' + pass);
            });
        });
        
        //初始化聊天
        function initChat(userID,nickName) {
            //生成客户端代理(注意：这里的chatHub与集线器ChatHub的HubName属性要一致)
            var chatHub = $.connection.chatHub;

            //==========添加客户端hub方法以供服务端调用===========
            //聊天内容
            chatHub.client.showMessage = function (msgObj) {
                //(向列表中添加信息)。msgObj是一个json对象
                if (msgObj.content == '' || msgObj == null)
                    return;
                var html = '';
                if (userID == msgObj.userid) {
                    html = msgTemplate.replace('{Type}', 'owner');
                }
                else {
                    html = msgTemplate.replace('{Type}', 'other');
                }
                html = html.replace('{NickName}', msgObj.name)
                        .replace('{ChatTime}', msgObj.chattime)
                        .replace('{Content}', msgObj.content);
                $('.chat-list').append(html).scrollTop($('.chat-list')[0].scrollHeight);

            }
            //在线通知
            chatHub.client.onLine = function (userlist) {
                reloadUser(userlist);
            }
            //下线通知
            chatHub.client.offLine = function (userlist) {
                reloadUser(userlist);
            }
            //日志输出，以备调试使用
            $.connection.hub.logging = true;
            //开启hub连接
            $.connection.hub.start().done(function () {
                //发送上线信息
                chatHub.server.sendOnLine(message(userID, nickName, ''));
                //点击按钮，发送聊天内容
                $('#send').click(function () {
                    var content = $('.msg-content').val();
                    chatHub.server.sendMessage(message(userID, nickName, content));
                    $('.msg-content').val('')
                });
                $('.msg-content').keypress(function (event) {
                    var keycode = (event.keyCode ? event.keyCode : event.which);
                    if (keycode == '13') {
                        var content = $('.msg-content').val();
                        chatHub.server.sendMessage(message(userID, nickName, content));
                        $('.msg-content').val('')
                    }
                });
                //每隔10秒，发送心跳包信息
                setInterval(function () {
                    chatHub.server.triggerHeartbeat(message(userID, nickName, ''));
                }, 10000);
            });
        }

        //重新加载用户列表
        var reloadUser = function (userlist) {
            $(".user-list").children("li").remove();
            for (i = 0; i < userlist.length; i++) {
                $(".user-list").append("<li>" + userlist[i].Name + "</li>");
            }
        }
        var message = function (userid, name, content) {
            return { userid: userid, name: name, content: content };
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--背景-->
        <div>
            <img class="bg" src="Images/bg.jpg" />
        </div>
        <div class="wrap">
            <div class="user">
                <br />
                <div class="user-head">
                    <h1 class="">会话</h1>
                </div>
                <ul class="user-list">
                </ul>
                <div class="user-end">
                    <h1 class="">--------End--------</h1>
                </div>
            </div>
            <div class="chat">
                <br />
                <div class="user-head">
                    <h1>聊天窗口</h1>
                </div>
                <div class="chat-main">
                    <ul class="chat-list">
                        <li class="other">
                            <p class="chat-name">张三(2016-04-17)：</p>
                            <p class="chat-content">没什么好说的，再见！！</p>
                        </li>
                        <li class="owner">
                            <p class="chat-name">杨良斌(2016-04-17)：</p>
                            <p class="chat-content">没什么好说的，再见！！</p>
                        </li>
                    </ul>
                    <div class="hr"></div>
                    <textarea class="msg-content"></textarea><br />
                    <%--<input type="button" id="btnSend" value="发送" />--%>
                </div>
                <div class="user-end">
                    <h1 id="send">发送消息</h1>
                </div>
            </div>
        </div>

        <%--消息：
        <div style="height:200px; overflow-y:scroll; border:solid 2px #eee;">
            <ul id="msg-list"></ul>
        </div>
        回复：
        <div style="height:200px; overflow-y:scroll; border:solid 2px #eee;">
            <asp:TextBox runat="server" ID="txtContent"></asp:TextBox>
            <input value="Send" id="btnSend" type="button" />
        </div>

        <div style="height:200px; overflow-y:scroll; border:solid 2px #eee;">
            <ul id="user-list"></ul>
        </div>--%>
    </form>
</body>
</html>
