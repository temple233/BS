using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1{
    public partial class Register_ : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){

        }

        protected void Register_Click(object sender, EventArgs e){
            Message.Text = "";
            if (NameText.Text.Length < 6){
                Message.Text = "The length of name is to small";
            }
            else if (PasswordText.Text.Length < 6){
                Message.Text = "The length of password is to small";
            }
            else if (!EmailText.Text.Contains('@')|| !EmailText.Text.Contains(".com")){
                Message.Text = "The type of email is wrong";
            }
            else{
                MySqlConnection sqlCon = new MySqlConnection();
                sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sqlCon;
                cmd.CommandText = "select * from user";
                MySqlDataReader reader = null;
                int exist_email = 0;
                int exist_name = 0;
                String number = "";
                try{
                    //打开连接
                    sqlCon.Open();
                    //执行查询，并将结果返回给读取器
                    reader = cmd.ExecuteReader();
                    while (reader.Read()){
                        String name = reader[2].ToString();
                        String email = reader[3].ToString();
                        number= reader[0].ToString();
                        if (name == NameText.Text){
                            exist_name = 1;
                            break;
                        }
                        if (email == EmailText.Text){
                            exist_email = 1;
                            break;
                        }
                    }
                    
                }
                catch (Exception ex) { }
                finally
                {
                    reader.Close();
                    sqlCon.Close();
                }
                if (exist_name == 1)
                {
                    Message.Text = "This name has existed,please input another name";
                }
                else if (exist_email == 1)
                {
                    Message.Text = "This email has existed,please input another email";
                }
                else
                {
                    number = (int.Parse(number) + 1).ToString();
                    //string sql ="insert into testinfo(name)values('"+ par+"')";

                    String insert_data = "insert into user values ('" + number + "','" + PasswordText.Text + "','" + NameText.Text + "','" + EmailText.Text + "','" + CityText.Text + "')";
                    Message.Text = insert_data;
                    MySqlCommand cmd2 = new MySqlCommand(insert_data, sqlCon);
                    try{
                        //打开连接
                        sqlCon.Open();
                        //执行查询，并将结果返回给读取器
                        int result = cmd2.ExecuteNonQuery();
                        /*if (result == 1){
                            Name.Text = "true";
                        }
                        else Name.Text = "flase";*/

                    }
                    catch (Exception ex) { }
                    finally
                    {
                        reader.Close();
                        sqlCon.Close();
                    }
                }
            }
        }
    }
}