using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication1{
    public partial class Register_ : System.Web.UI.Page{
        public string City_Text = "城市";
        protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e){
            BindCity();
        }

        void BindProvince(){
            string CurrentPath = this.Server.MapPath(".");
            if (System.IO.File.Exists(CurrentPath + "//Province.xml")){
                this.ddlProvince.Items.Clear();
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(CurrentPath + "//Province.xml");
                XmlNodeList nodes = doc.DocumentElement.ChildNodes;
                XmlNode nodeCity = doc.DocumentElement.SelectSingleNode(@"Province/City[@Name='" + this.City_Text + "']");
                foreach (XmlNode node in nodes){
                    this.ddlProvince.Items.Add(node.Attributes["Name"].Value);
                    int n = this.ddlProvince.Items.Count - 1;
                    if (nodeCity != null && node == nodeCity.ParentNode)
                        this.ddlProvince.SelectedIndex = n;
                }
                BindCity();
            }
            else { }
        }

        void BindCity(){
            string CurrentPath = this.Server.MapPath(".");
            if (System.IO.File.Exists(CurrentPath + "//Province.xml")){
                this.ddlCity.Items.Clear();
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(CurrentPath + "//Province.xml");
                XmlNodeList nodes = doc.DocumentElement.ChildNodes[this.ddlProvince.SelectedIndex].ChildNodes;
                foreach (XmlNode node in nodes){
                    this.ddlCity.Items.Add(node.Attributes["Name"].Value);
                    int n = this.ddlCity.Items.Count - 1;
                    if (node.Attributes["Name"].Value == this.City_Text)
                    {
                        this.ddlCity.SelectedIndex = n;
                    }
                }

                if (this.ddlCity.SelectedIndex == -1)
                    this.ddlCity.SelectedIndex = 0;
            }
            else
            {

            }

        }

        protected void Page_Load(object sender, EventArgs e){
            if (!IsPostBack){
                BindProvince();
            }
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

                    String insert_data = "insert into user values ('" + number + "','" + PasswordText.Text + "','" + NameText.Text + "','" + EmailText.Text + "','" + ddlProvince.SelectedValue + ":" + ddlCity.SelectedValue + "')";
                    Message.Text = insert_data;
                    MySqlCommand cmd2 = new MySqlCommand(insert_data, sqlCon);
                    try{
                        //打开连接
                        sqlCon.Open();
                        //执行查询，并将结果返回给读取器
                        int result = cmd2.ExecuteNonQuery();
                        if (result == 1){
                            Message.Text = "Account:" + number + "create successfully and will return to login page";
                            
                        }
                        else{

                        }
                        Response.Write("<script>alert('create account successfully');</script>");
                        Response.Write("<script language='javascript'>setTimeout(\"{location.href='Login.aspx'}\",1500);</script>");
                        
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