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
            var pa = <%=s()%>;
            initChat(userID, pa);
            layer.msg('account：' + pa);
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
                    if (content == '')
                        return;
                    chatHub.server.sendMessage(message(userID, nickName, content));
                    $('.msg-content').val('')
                });
                $('.msg-content').keypress(function (event) {
                    var keycode = (event.keyCode ? event.keyCode : event.which);
                    if (keycode == '13') {
                        var content = $('.msg-content').val();
                        if (content == '')
                            return;
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

        <table>
            <tr>
                <td Width="100px"></td>
                <td><asp:Image ID="Search" runat="server" ImageUrl="~/webimg/TIM图片20190620162637.png" /></td>
                <td class="auto-style1">
                </td>
                <td>
                    <table border="2" bordercolor="red" Width="400px" Height="50px"><tr><td>
                           <asp:TextBox ID="SearchText" runat="server" Height="40px" Width="260px"></asp:TextBox>
                           <asp:DropDownList ID="DropDownList1" runat="server" Height="46px" Width="120px" Font-Size="X-Large">
                                <asp:ListItem Value = "1" Text = "Study">Study</asp:ListItem>
                                <asp:ListItem Value = "2" Text =  "Teaching">Teaching</asp:ListItem>
                                <asp:ListItem Value = "3" Text = "Amusement">Amusement</asp:ListItem>
                                <asp:ListItem Value = "4" Text = "Sports">Sports</asp:ListItem>
                           </asp:DropDownList>
                    </td></tr></table>
                </td>      
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/webimg/search.jpg"  Height="36px" /></td>      
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="36px" ImageUrl="~/webimg/Publish_book.png"  Width="135px" /></td>
                <td width="20px"></td>
                <td>
                    <asp:Label ID="user_id" runat="server" BackColor="Red" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Height="36px"></asp:Label>
                </td>
                <td width="20px"></td>
                <td>

                    <asp:ImageButton ID="ImageButton3" runat="server" Height="50px" ImageUrl="~/webimg/want.jpg"  />

                </td>
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/webimg/main.jpg" Height="60px" OnClick="ImageButton4_Click"  />
                </td>
            </tr>
        </table>
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
  
        <div class="wrap">
            <div class="user">
                <br />
                <div class="user-head">
                    <h1 class="">Account</h1>
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
                    <h1>Communication</h1>
                </div>
                <div class="chat-main">
                    <ul class="chat-list">
                    </ul>
                    <div class="hr"></div>
                    <textarea class="msg-content"></textarea><br />
                    <%--<input type="button" id="btnSend" value="发送" />--%>
                </div>
                <div class="user-end">
                    <h1 id="send">Send</h1>
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
