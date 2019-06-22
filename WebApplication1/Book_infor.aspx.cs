using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1{
    public partial class Book_infor : System.Web.UI.Page{
        String book_id;
        String link_dangdang;
        protected void Page_Load(object sender, EventArgs e){
            //book_id = Request.QueryString["name"];
            book_id = "1000000";
            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from book";
            MySqlDataReader reader = null;
            try{
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                while (reader.Read()){
                    String id = reader[0].ToString();
                    if (id != book_id) continue;
                    ISBN.Text = "ISBN: " + reader[2].ToString();
                    BookName.Text = reader[3].ToString();
                    OriginalPrice.Text = "Original Price :¥" + reader[4].ToString();
                    SellPrice.Text = "Sell Price :¥" + reader[5].ToString();
                    Category.Text= "Category: "+ reader[6].ToString();
                    Brief.Text = "Brief introduction:" + reader[7].ToString();
                    Link.Text = "Link to Real Dangdang  ";
                    link_dangdang= reader[9].ToString();
                    Image1.ImageUrl = "./bookimg/" + reader[8].ToString();

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
            Response.Write("<script language='JavaScript'>window.open('" + link_dangdang + "');</script>");
        }
    }
}