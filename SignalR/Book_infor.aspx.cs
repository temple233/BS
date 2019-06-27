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
        String user_id;
        String link_dangdang;
        protected void Page_Load(object sender, EventArgs e){
            //book_id = Request.QueryString["name"];
            book_id = "1000000";
            user_id = "316010176";

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
            finally{
                reader.Close();
                sqlCon.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e){
            Response.Write("<script language='JavaScript'>window.open('" + link_dangdang + "');</script>");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e){
            if (Number_book.Text.Length == 0){
                Message.Text = "please input the number of book";
            }
            else{
                String Tran_mode = "send";
                if (radMode.Checked == true) Tran_mode = "offline";

                Message.Text = Tran_mode;
                MySqlConnection sqlCon = new MySqlConnection();
                sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
                MySqlCommand cmd = new MySqlCommand();
                
                cmd.Connection = sqlCon;
                cmd.CommandText = "select * from deal";
                MySqlDataReader reader = null;
                String number = "";
                try{
                    sqlCon.Open();
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
                String insert_data = "insert into deal values ('" + number + "','" + user_id + "','" + book_id + "','" + Tran_mode + "','true','false','" + Number.Text + "')";
                Message.Text = insert_data;
                MySqlCommand cmd2 = new MySqlCommand(insert_data, sqlCon);
                try{
                    sqlCon.Open();
                    int result = cmd2.ExecuteNonQuery();
                    if (result == 1){
                        Message.Text = "insert successfully and will return to login page";
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

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "chat.aspx?name=" + user_id+"&book="+book_id;
            Response.Redirect(s_url);
        }
    }
}