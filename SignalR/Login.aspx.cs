using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net;
using System.IO;
using System.Xml;

namespace SignalR
{
    public partial class Home : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){
            //Label1.Text = "my";
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e){
            Password_error.Text = "";
            Name_error.Text = "";
            if (NameText.Text == String.Empty){
                Name_error.Text = "The name is empty";
            }
            if (PasswordText.Text == String.Empty){
                Password_error.Text = "The password is empty";
            }

            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from user";
            MySqlDataReader reader = null;
            try{
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                int sign_name = 1;
                int sign_password = 1;
                int right = 0;
                while (reader.Read()){
                    String name = reader[2].ToString();
                    String password = reader[1].ToString();
                    if (name == NameText.Text && password == PasswordText.Text){
                        Name_error.Text += "login";
                        string s_url;
                        s_url = "Home.aspx?name=" + name;
                        Response.Redirect(s_url);
                        right = 1;
                        sign_name = 1;
                        sign_password = 1;
                        break;
                    }
                    else if(name == NameText.Text){
                        sign_password = 0;
                    }
                    else{
                        sign_name = 0;
                    }
                    
                }
                if (right == 0){
                    if (sign_password == 0){
                        Password_error.Text = "error_of_password";
                    }
                    else if (sign_name == 0){
                        Name_error.Text = "This user does not exist";
                    }
                }
                

            }
            catch (Exception ex) { }
            finally{
                reader.Close();
                sqlCon.Close();
            }
        }

        protected void Register_Click(object sender, EventArgs e){
            string s_url;
            s_url = "Register.aspx";
            Response.Redirect(s_url);
        }

        /* protected void Button1_Click(object sender, EventArgs e){

             Response.Write("<script language='javascript'>window.open('http://www.hao123.com')</script>");


             Label1.Text = "my0";
             MySqlConnection sqlCon = new MySqlConnection();
             sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
             MySqlCommand cmd = new MySqlCommand();
             cmd.Connection = sqlCon;
             cmd.CommandText = "select * from user";
             MySqlDataReader reader = null;
             try
             {
                 Label2.Text = "";
                 //打开连接
                 sqlCon.Open();
                 //执行查询，并将结果返回给读取器
                 reader = cmd.ExecuteReader();
                  while (reader.Read())
                  {
                     Label2.Text += "ID=" + reader[0].ToString() + " , Name=" + reader[1].ToString() ;
                  }
                // Label2.Text = reader[0].ToString();

             }
             catch (Exception ex) { }
             finally
             {
                 reader.Close();
                 sqlCon.Close();
             }


         }
         */

    }
}