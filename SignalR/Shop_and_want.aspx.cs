using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace SignalR {
    public class DealInfo {
        public DealInfo() { }
        public int DealID { get; set; }
        public int Book { get; set; }
        public String Mode { get; set; }
        public int Number { get; set; }
    }
    public class WantInfo {
        public WantInfo() { }
        public String Book_name { get; set; }
        public String Writer { get; set; }
        public String Place { get; set; }
        public Double Price { get; set; }
    }

    public partial class Shop_and_want : System.Web.UI.Page {
        String user = "316010176";
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                BindProvince();
            }
            //user = Request.QueryString["name"];
            Deal_bind();
            Want_bind();
        }
        public string City_Text = "城市";
        protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();
        }

        void BindProvince()
        {
            string CurrentPath = this.Server.MapPath(".");
            if (System.IO.File.Exists(CurrentPath + "//Province.xml"))
            {
                this.ddlProvince.Items.Clear();
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(CurrentPath + "//Province.xml");
                XmlNodeList nodes = doc.DocumentElement.ChildNodes;
                XmlNode nodeCity = doc.DocumentElement.SelectSingleNode(@"Province/City[@Name='" + this.City_Text + "']");
                foreach (XmlNode node in nodes)
                {
                    this.ddlProvince.Items.Add(node.Attributes["Name"].Value);
                    int n = this.ddlProvince.Items.Count - 1;
                    if (nodeCity != null && node == nodeCity.ParentNode)
                        this.ddlProvince.SelectedIndex = n;
                }
                BindCity();
            }
            else { }
        }

        void BindCity()
        {
            string CurrentPath = this.Server.MapPath(".");
            if (System.IO.File.Exists(CurrentPath + "//Province.xml"))
            {
                this.ddlCity.Items.Clear();
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(CurrentPath + "//Province.xml");
                XmlNodeList nodes = doc.DocumentElement.ChildNodes[this.ddlProvince.SelectedIndex].ChildNodes;
                foreach (XmlNode node in nodes)
                {
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
        public void Deal_bind() {
            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from deal";
            List<DealInfo> Deal = new List<DealInfo>();
            MySqlDataReader reader = null;
            try {
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (user != reader[1].ToString()) continue;
                    Deal.Add(new DealInfo()
                    {
                        DealID = int.Parse(reader[0].ToString()),
                        Book = int.Parse(reader[2].ToString()),
                        Mode = reader[3].ToString(),
                        Number = int.Parse(reader[6].ToString())
                    });
                }
            }
            catch (Exception ex) { }
            finally
            {
                reader.Close();
                sqlCon.Close();
            }
            GridView1.DataSource = Deal;
            GridView1.DataBind();
        }
        public void Want_bind() {
            MySqlConnection sqlCon = new MySqlConnection();
            sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select * from want";
            List<WantInfo> Want = new List<WantInfo>();
            MySqlDataReader reader = null;
            try {
                //打开连接
                sqlCon.Open();
                //执行查询，并将结果返回给读取器
                reader = cmd.ExecuteReader();
                while (reader.Read()) {
                    if (user != reader[1].ToString()) continue;
                    Want.Add(new WantInfo() {
                        Book_name = reader[2].ToString(),
                        Writer = reader[3].ToString(),
                        Place = reader[4].ToString(),
                        Price = Double.Parse(reader[5].ToString())
                    });
                }
            }
            catch (Exception ex) { }
            finally
            {
                reader.Close();
                sqlCon.Close();
            }
            GridView2.DataSource = Want;
            GridView2.DataBind();
        }

        protected void ADD_Click(object sender, EventArgs e) {
            if (tt.Visible == false) tt.Visible = true;
            else tt.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e) {
            Message.Text = "";
            if (NameText.Text.Length == 0) {
                Message.Text = "Please input book name";
            }
            else if (TextBox1.Text.Length == 0) {
                Message.Text = "Please input write name";
            }
            else if (TextBox2.Text.Length == 0) {
                Message.Text = "Please input price";
            }
            else {
                MySqlConnection sqlCon = new MySqlConnection();
                sqlCon.ConnectionString = "server = '127.0.0.1'; uid = 'temple'; pwd = 'temple'; database = 'bs';";//连接字符串
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = sqlCon;
                cmd.CommandText = "select * from want";
                MySqlDataReader reader = null;
                String number = "";
                try {
                    //打开连接
                    sqlCon.Open();
                    //执行查询，并将结果返回给读取器
                    reader = cmd.ExecuteReader();
                    while (reader.Read()) {
                        number = reader[0].ToString();
                    }
                }
                catch (Exception ex) { }
                finally {
                    reader.Close();
                    sqlCon.Close();
                }
                number = (int.Parse(number) + 1).ToString();
                //string sql ="insert into testinfo(name)values('"+ par+"')";
                String insert_data = "insert into want values ('" + number + "','" + user + "','" + NameText.Text + "','" + TextBox1.Text + "','" + ddlProvince.SelectedValue + ":" + ddlCity.SelectedValue + "','" + TextBox2.Text + "')";
                MySqlCommand cmd2 = new MySqlCommand(insert_data, sqlCon);
                try {
                    sqlCon.Open();
                    //执行查询，并将结果返回给读取器
                    int result = cmd2.ExecuteNonQuery();
                    if (result == 1) {
                       // Message.Text = "insert successfully and will return to login page";
                    }
                    else { }
                }
                catch (Exception ex) { }
                finally {
                    sqlCon.Close();
                }
                string s_url;
                s_url = "Shop_and_want.aspx?user=" + user;
                Response.Redirect(s_url);
            }
        }
    }
}