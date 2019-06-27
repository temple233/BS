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
            user_id.Text = name;
        }
        public String s(){
            return Request.QueryString["name"];
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Home.aspx?id=" + name;
            Response.Redirect(s_url);
        }
    }
}