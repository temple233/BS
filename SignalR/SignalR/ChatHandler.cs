using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNet.SignalR.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalR
{
    /// <summary>
    /// 聊天消息处理类
    /// </summary>
    public class ChatHandler
    {
        private readonly static Lazy<ChatHandler> _instance =
            new Lazy<ChatHandler>(() =>
               new ChatHandler(GlobalHost.ConnectionManager.GetHubContext<ChatHub>().Clients));
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="clients"></param>
        private ChatHandler(IHubConnectionContext<dynamic> clients)
        {
            Clients = clients;
        }

        /// <summary>
        /// 聊天消息处理类对象实例
        /// </summary>
        public static ChatHandler Instance { get { return _instance.Value; } }

        /// <summary>
        /// 消息转发器连接上下文 客户端集
        /// </summary>
        public IHubConnectionContext<dynamic> Clients { get; set; }
    }
}