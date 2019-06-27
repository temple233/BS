using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication1{
    public partial class Publish : System.Web.UI.Page{
        String user;
        protected void Page_Load(object sender, EventArgs e){
            user = Request.QueryString["user"];
            user_id.Text = user;
        }

        protected void Pub_Click(object sender, EventArgs e){
            //Message.Text = FileUpload1.PostedFile.FileName;
            String path = FileUpload1.FileName;
            String link = "http://search.dangdang.com/?medium=01&key4=" + ISBN.Text;
            if (NameText.Text.Length == 0) { Message.Text = "Please input the name of the book"; }
            else if (OriginalText.Text.Length == 0) { Message.Text = "Please input the origianl price of the book"; }
            else if (SellText.Text.Length == 0) { Message.Text = "Please input the sell price of the book"; }
            else if (Introduction.Text.Length == 0) { Message.Text = "Please input the brief introduction"; }
            else if (ISBN.Text.Length == 0) { Message.Text = "Please input the ISBN of the book"; }
            else if(!path.EndsWith(".jpg")&& !path.EndsWith(".png")&& !path.EndsWith(".bmp")) { Message.Text = "Please choose a picture"; }
            else{
                MySqlConnection sqlCon = new MySqlConnection();
                sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sqlCon;
                cmd.CommandText = "select * from book";
                MySqlDataReader reader = null;
                String number = "";
                try{
                    //打开连接
                    sqlCon.Open();
                    //执行查询，并将结果返回给读取器
                    reader = cmd.ExecuteReader();
                    while (reader.Read()){
                        number = reader[0].ToString();
                    }
                }
                catch (Exception ex) { }
                finally{
                    reader.Close();
                    sqlCon.Close();
                }
                number = (int.Parse(number) + 1).ToString();
                String insert_data = "insert into book values ('" + number + "','" + user + "','" + ISBN.Text + "','" + NameText.Text + "','" + OriginalText.Text + "','" + SellText.Text + "','" + DropDownList2.SelectedValue + "','" + Introduction.Text + "','" + path + "','" + link + "')";
                Message.Text = insert_data;
                MySqlCommand cmd2 = new MySqlCommand(insert_data, sqlCon);
                try{
                    //打开连接
                    sqlCon.Open();
                    //执行查询，并将结果返回给读取器
                    int result = cmd2.ExecuteNonQuery();
                    if (result == 1){
                        Message.Text = "publish book successfully";
                    }
                    else{}
                }
                catch (Exception ex) { }
                finally{
                    reader.Close();
                    sqlCon.Close();
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            string s_url;
            s_url = "Home.aspx?id=" + user;
            Response.Redirect(s_url);
        }
    }
}