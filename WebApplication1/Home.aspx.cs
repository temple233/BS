using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Home1 : System.Web.UI.Page{
        String[] Book_id = new String[16];
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = Request.QueryString["name"];



            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from book";
            MySqlDataReader reader = null;
            try
            {
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                int t = 1;
                while (reader.Read()){
                    Book_id[t - 1] = reader[0].ToString();
                    String Book_name = reader[3].ToString();
                    String Original = reader[4].ToString();
                    String Sell = reader[5].ToString();
                    String Picture = reader[8].ToString();
                    string id_book_name = "Name" + t.ToString();
                    object o = this.GetType().GetField(id_book_name, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label L = ((Label)o);
                    L.Text= Book_name;
                    string id_Image = "Image" + t.ToString();
                    o = this.GetType().GetField(id_Image, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    ImageButton I = ((ImageButton)o);
                    I.ImageUrl= "./bookimg/" + reader[8].ToString();
                    string id_Sell = "Sell" + t.ToString();
                    o = this.GetType().GetField(id_Sell, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label S = ((Label)o);
                    S.Text = "¥" + Sell + "      ";
                    string id_Origin = "Origin" + t.ToString();
                    o = this.GetType().GetField(id_Origin, System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.IgnoreCase).GetValue(this);
                    Label P = ((Label)o);
                    P.Text= "¥" + Original;
                    /*Image1.ImageUrl = "./bookimg/" + reader[8].ToString();
                    Name1.Text = Book_name;
                    Sell1.Text = "¥" + Sell + "      ";
                    Origin1.Text = "¥" + Original;*/
                    t++;
                    if (t > 4) break;

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
        }

        protected void Image1_Click(object sender, ImageClickEventArgs e){
            string s_url;
            s_url = "Book_infor.aspx?Book_id=" + Book_id[0];
            Response.Redirect(s_url);
        }
    }
}