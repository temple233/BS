<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop_and_want.aspx.cs" Inherits="SignalR.Shop_and_want" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td Width="100px"></td>
                <td><asp:Image ID="Search" runat="server" ImageUrl="~/webimg/TIM图片20190620162637.png" /></td>
                <td class="auto-style1">
                </td>
                <td>
                    <table border="2" bordercolor="red" Width="400px" Height="50px"><tr><td>
                           <asp:TextBox ID="SearchText" runat="server" Height="40px" Width="260px"></asp:TextBox>
                           <asp:DropDownList ID="DropDownList1" runat="server" Height="46px" Width="120px" Font-Size="X-Large">
                                <asp:ListItem Value = "1" Text = "Study">Study</asp:ListItem>
                                <asp:ListItem Value = "2" Text =  "Teaching">Teaching</asp:ListItem>
                                <asp:ListItem Value = "3" Text = "Amusement">Amusement</asp:ListItem>
                                <asp:ListItem Value = "4" Text = "Sports">Sports</asp:ListItem>
                           </asp:DropDownList>
                    </td></tr></table>
                </td>      
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/webimg/search.jpg"  Height="36px" /></td>      
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="36px" ImageUrl="~/webimg/Publish_book.png"  Width="135px" /></td>
                <td width="20px"></td>
                <td>
                    <asp:Label ID="user_id" runat="server" BackColor="Red" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Height="36px"></asp:Label>
                </td>
                <td width="20px"></td>
                <td>

                    <asp:ImageButton ID="ImageButton3" runat="server" Height="50px" ImageUrl="~/webimg/want.jpg"  />

                </td>
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/webimg/main.jpg" Height="60px" OnClick="ImageButton4_Click"  />
                </td>
            </tr>
        </table>
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
        <div style="text-align: center;">
        <table  style="margin: auto;" >
            <tr><td>
                    <asp:Label ID="Label1" runat="server" Text="Deal" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ></asp:Label>
                </td></tr>
            <tr><td>
                <asp:GridView ID="GridView1" runat="server" Font-Size="Large" HorizontalAlign="Center" onrowdatabound="GridView1_RowDataBound" BorderColor="Red" BorderWidth="4px" ForeColor="#0033CC"></asp:GridView>
                </td></tr>
            <tr><td>
                    <asp:Label ID="Label2" runat="server" Text="Want" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ADD" runat="server" Text="Add_want" Font-Bold="True" Font-Size="Large" OnClick="ADD_Click" />
            </td></tr>
            <tr><td>
                <asp:GridView ID="GridView2" runat="server" Font-Size="Large" HorizontalAlign="Center" onrowdatabound="GridView1_RowDataBound" BorderColor="Red" BorderWidth="4px" ForeColor="#0033CC"></asp:GridView>
                </td></tr>
        </table>

        </div>

        <div style="text-align: center;">
        <table  ID="tt" style="margin: auto;" runat="server">
            <tr>
                <td><asp:Label ID="Name" runat="server" Text="Book:" Font-Size="X-Large"></asp:Label></td>
                <td><asp:TextBox ID="NameText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Writer:" Font-Size="X-Large"></asp:Label></td>
                <td><asp:TextBox ID="TextBox1" runat="server" Font-Size="X-Large"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="City" runat="server" Text="City:" Font-Size="X-Large"></asp:Label></td>
                <td><asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlProvince_SelectedIndexChanged" Font-Size="Large"></asp:DropDownList>
                <asp:DropDownList ID="ddlCity" runat="server" Font-Size="Large"></asp:DropDownList>
                </ContentTemplate>
                </asp:UpdatePanel></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Price:" Font-Size="X-Large"></asp:Label></td>
                <td><asp:TextBox ID="TextBox2" runat="server" Font-Size="X-Large"></asp:TextBox></td>
            </tr>
            <tr><td>
                <asp:Button ID="Button1" runat="server" Text="Submit" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" /></td></tr>
        <tr><td><asp:Label ID="Message" runat="server" Font-Size="Large" Text=""></asp:Label>
            </td></tr>
        </table>
            </div>
    </div>
    </form>
</body>
</html>
