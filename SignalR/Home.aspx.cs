using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1{
    public partial class Home1 : System.Web.UI.Page {
        public static int number = 0;
        public static String[] Book_id = new String[16];
        String consumer ;
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                number = 0;
            }
            consumer = Request.QueryString["id"];
            //Label1.Text = Request.QueryString["name"];
            user_id.Text = consumer;
            // ImageButton2.Visible = false;
            load();
        }
        public void load() {
            for (int i = 1; i < 8; i++)
            {
                string id_book_name = "Name" + i.ToString();
                object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label L = ((Label)o);
                L.Visible = true;
                string id_Image = "Image" + i.ToString();
                o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                ImageButton I = ((ImageButton)o);
                I.Visible = true;
                string id_Sell = "Sell" + i.ToString();
                o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label S = ((Label)o);
                S.Visible = true;
                string id_Origin = "Origin" + i.ToString();
                o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label P = ((Label)o);
                P.Visible = true;
            }
            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from book";
            MySqlDataReader reader = null;
            try {
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                int t = 1;
                int count = number;
                while (reader.Read()) {
                    if (count > 0) { count--; continue; }
                    Book_id[t - 1] = reader[0].ToString();
                    String Book_name = reader[3].ToString();
                    String Original = reader[4].ToString();
                    String Sell = reader[5].ToString();
                    String Picture = reader[8].ToString();
                    string id_book_name = "Name" + t.ToString();
                    object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label L = ((Label)o);
                    L.Text = Book_name;
                    string id_Image = "Image" + t.ToString();
                    o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    ImageButton I = ((ImageButton)o);
                    String imgurl = reader[8].ToString();
                    I.ImageUrl = "./bookimg/" + imgurl;
                    string id_Sell = "Sell" + t.ToString();
                    o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label S = ((Label)o);
                    S.Text = "¥" + Sell + "      ";
                    string id_Origin = "Origin" + t.ToString();
                    o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label P = ((Label)o);
                    P.Text = "¥" + Original;
                    /*Image1.ImageUrl = "./bookimg/" + reader[8].ToString();
                    Name1.Text = Book_name;
                    Sell1.Text = "¥" + Sell + "      ";
                    Origin1.Text = "¥" + Original;*/
                    t++;
                    if (t > 8) break;
                }
                if (t <= 8)
                {
                    for (int i = t; i <= 8; i++)
                    {
                        string id_book_name = "Name" + i.ToString();
                        object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label L = ((Label)o);
                        L.Visible = false;
                        string id_Image = "Image" + i.ToString();
                        o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        ImageButton I = ((ImageButton)o);
                        I.Visible = false;
                        string id_Sell = "Sell" + i.ToString();
                        o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label S = ((Label)o);
                        S.Visible = false;
                        string id_Origin = "Origin" + i.ToString();
                        o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label P = ((Label)o);
                        P.Visible = false;
                    }
                }
            }
            catch (Exception ex) { }
            finally
            {
                reader.Close();
                sqlCon.Close();
            }
        }

        public void select(){
            for(int i = 0; i < 8; i++)
            {
                Book_id[i] = "";
            }
            for(int i = 1; i < 8; i++){
                string id_book_name = "Name" + i.ToString();
                object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label L = ((Label)o);
                L.Visible = true;
                string id_Image = "Image" + i.ToString();
                o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                ImageButton I = ((ImageButton)o);
                I.Visible = true;
                string id_Sell = "Sell" + i.ToString();
                o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label S = ((Label)o);
                S.Visible = true;
                string id_Origin = "Origin" + i.ToString();
                o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                Label P = ((Label)o);
                P.Visible = true;
            }
            number = 0;
            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            String wher = " where Book_name like '%" + SearchText.Text + "%' ";
            cmd.CommandText = "select * from book"+wher;
            
            MySqlDataReader reader = null;
            try{
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                int t = 1;
                int count = number;
                while (reader.Read()){
                    if (count > 0) { count--; continue; }
                    Book_id[t - 1] = reader[0].ToString();
                    String Book_name = reader[3].ToString();
                    String Original = reader[4].ToString();
                    String Sell = reader[5].ToString();
                    String Picture = reader[8].ToString();
                    string id_book_name = "Name" + t.ToString();
                    object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label L = ((Label)o);
                    L.Text = Book_name;
                    string id_Image = "Image" + t.ToString();
                    o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    ImageButton I = ((ImageButton)o);
                    String imgurl = reader[8].ToString();
                    I.ImageUrl = "./bookimg/" + imgurl;
                    string id_Sell = "Sell" + t.ToString();
                    o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label S = ((Label)o);
                    S.Text = "¥" + Sell + "      ";
                    string id_Origin = "Origin" + t.ToString();
                    o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label P = ((Label)o);
                    P.Text = "¥" + Original;
                    /*Image1.ImageUrl = "./bookimg/" + reader[8].ToString();
                    Name1.Text = Book_name;
                    Sell1.Text = "¥" + Sell + "      ";
                    Origin1.Text = "¥" + Original;*/
                    t++;
                    if (t > 8) break;
                }
                if (t <= 8){
                    for(int i = t; i <= 8; i++){
                        string id_book_name = "Name" + i.ToString();
                        object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label L = ((Label)o);
                        L.Visible = false;
                        string id_Image = "Image" + i.ToString();
                        o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        ImageButton I = ((ImageButton)o);
                        I.Visible = false;
                        string id_Sell = "Sell" + i.ToString();
                        o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label S = ((Label)o);
                        S.Visible = false;
                        string id_Origin = "Origin" + i.ToString();
                        o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                        Label P = ((Label)o);
                        P.Visible = false;
                    }
                }
            }
            catch (Exception ex) { }
            finally
            {
                reader.Close();
                sqlCon.Close();
            }
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e){
            select();
        }

        protected void Image1_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" +Book_id[0] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Publish.aspx?user=" + consumer;
            Response.Redirect(s_url);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Shop_and_want.aspx?id=" + consumer;
            Response.Redirect(s_url);
        }

        protected void Button1_Click(object sender, EventArgs e){
            number += 8;
            int start = number;
            String page = (start / 8 + 1).ToString();
            Label1.Text = "Page:" + page;
            load();
        }

        protected void Button2_Click(object sender, EventArgs e){
            if (number != 0){
                number -= 8;
                String page = (number / 8 + 1).ToString();
                Label1.Text = "Page:" + page;
                load();
            }
        }

        protected void Image2_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[1] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void Image3_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[2] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void Image4_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[3] + "&User=" + consumer;
            Response.Redirect(s_url);
        }
        protected void Image5_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[4] + "&User=" + consumer;
            Response.Redirect(s_url);
        }
        protected void Image6_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[5] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void Image7_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[6] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void Image8_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[7] + "&User=" + consumer;
            Response.Redirect(s_url);
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Home.aspx?id=" + consumer;
            Response.Redirect(s_url);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "chat.aspx?name=" + consumer;
            Response.Redirect(s_url);
        }
    }
}