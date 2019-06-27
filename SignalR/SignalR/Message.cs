using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalR
{
    /// <summary>
    /// 消息类
    /// </summary>
    public class Message
    {
        [JsonProperty("userid")]
        public string UserID { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("content")]
        public string Content { get; set; }

        [JsonProperty("chattime")]
        public string ChatTime { get; set; }
    }
}