using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalR
{
    /// <summary>
    /// 聊天消息转发器
    /// </summary>
    [HubName("chatHub")]
    public class ChatHub : Hub
    {
        /// <summary>
        /// 在线用户集
        /// </summary>
        private IList<ChatUserInfo> UserList = ChatUserCache.UserList;

        /// <summary>
        /// 聊天消息处理类对象
        /// </summary>
        private readonly ChatHandler _chatHandler;

        /// <summary>
        /// 默认构造函数
        /// </summary>
        public ChatHub() 
            : this(ChatHandler.Instance) { }

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="chatHandler"></param>
        public ChatHub(ChatHandler chatHandler)
        {
            _chatHandler = chatHandler;
        }

        /// <summary>
        /// 供客户端调用的【聊天消息】方法
        /// </summary>
        /// <param name="message"></param>
        public void SendMessage(Message msg)
        {
            msg.ChatTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //这里的showMessage方法是动态解析的，必须与客户端方法一致，方可调用成功(下同)
            _chatHandler.Clients.All.showMessage(msg);
        }

        /// <summary>
        /// 心跳包
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public void TriggerHeartbeat(Message msg)
        {
            var userInfo = UserList.Where(x => x.ID.Equals(msg.UserID) && x.Name.Equals(msg.Name)).FirstOrDefault();
            if (userInfo != null)
            {
                userInfo.Count = 0;  //收到心跳，重置计数器
            }
        }

        /// <summary>
        /// 供客户端调用的【通知用户在线】方法
        /// </summary>
        /// <param name="message"></param>
        public void SendOnLine(Message msg)
        {
            var userInfo = new ChatUserInfo() { ID = msg.UserID, Name = msg.Name };
            userInfo.TimeOutEvent += () =>
            {
                //用户20s无心跳包应答，则视为掉线，会抛出事件，这里会接住，然后处理用户掉线动作。
                SendOffLine(msg);
            };
            if (!IsExistUser(userInfo))
                UserList.Add(userInfo);
            _chatHandler.Clients.All.onLine(UserList);
            SendMessage(new Message() { UserID = msg.UserID, Name = msg.Name, Content ="" });
        }

        /// <summary>
        /// 供客户端调用的【通知用户下线】方法
        /// </summary>
        /// <param name="message"></param>
        public void SendOffLine(Message msg)
        {
            var userInfo = UserList.Where(x => Convert.ToString(x.ID).Equals(msg.UserID) && Convert.ToString(x.Name).Equals(msg.Name)).FirstOrDefault();
            if (userInfo != null)
            {
                if (UserList.Remove(userInfo))
                {
                    _chatHandler.Clients.All.offLine(UserList);
                    SendMessage(new Message() { UserID = msg.UserID, Name = msg.Name, Content = "" });
                }
            }
        }

        /// <summary>
        /// 是否存在用户
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public bool IsExistUser(ChatUserInfo info)
        {
            foreach (ChatUserInfo item in UserList)
            {
                if (info.Name == item.Name && info.ID == item.ID)
                    return true;
            }
            return false;
        }
    }
}