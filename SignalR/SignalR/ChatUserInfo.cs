using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Timers;

namespace SignalR
{
    /// <summary>
    /// 用户信息
    /// </summary>
    public class ChatUserInfo
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        public ChatUserInfo()
        {
            Count = 0;
            if (Timer == null) Timer = new Timer();
            Timer.Interval = 1000;  //1s触发一次
            Timer.Start();
            //事件
            Timer.Elapsed += (sender, args) =>
            {
                Count++;
                if (Count >= 30)
                    TimeOutEvent();  //该用户掉线了，抛出事件通知
            };
        }

        /// <summary>
        /// 时钟
        /// </summary>
        private readonly Timer Timer;

        /// <summary>
        /// 用户超时，掉线事件
        /// </summary>
        public event Action TimeOutEvent;

        /// <summary>
        /// 用户ID
        /// </summary>
        public string ID { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 内部计数器（每次递增1），如果服务端每5s能收到客户端的心跳包，那么Count被重置为0；
        /// 如果服务端20s后仍未收到客户端心跳包，那么视为掉线
        /// </summary>
        public int Count { get; set; }
    }
}
