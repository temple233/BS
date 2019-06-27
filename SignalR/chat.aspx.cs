using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalR{
    public partial class chat : System.Web.UI.Page{
        public String name = "";
        String book_id = "";
        protected void Page_Load(object sender, EventArgs e){
            name = Request.QueryString["name"];
            book_id = Request.QueryString["book"];
        }
        public String s(){
            return Request.QueryString["name"];
        }
    }
}