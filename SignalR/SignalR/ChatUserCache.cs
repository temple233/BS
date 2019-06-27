using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalR
{
    /// <summary>
    /// 在线用户缓存集合
    /// 所有用户的登陆信息，持久化到了缓存集合中
    /// </summary>
    public static class ChatUserCache
    {
        /// <summary>
        /// 在线用户缓存集
        /// </summary>
        public static IList<ChatUserInfo> UserList = new List<ChatUserInfo>();
    }
}