<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_infor.aspx.cs" Inherits="WebApplication1.Book_infor" %>

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
                <td><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/webimg/search.jpg"  Height="36px" /></td>      
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton5" runat="server" Height="36px" ImageUrl="~/webimg/Publish_book.png"  Width="135px" /></td>
                <td width="20px"></td>
                <td>
                    <asp:Label ID="user" runat="server" BackColor="Red" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Height="36px"></asp:Label>
                </td>
                <td width="20px"></td>
                <td>

                    <asp:ImageButton ID="ImageButton6" runat="server" Height="50px" ImageUrl="~/webimg/want.jpg"  />

                </td>
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/webimg/main.jpg" Height="60px" OnClick="ImageButton7_Click"  />
                </td>
            </tr>
        </table>
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
  
        <br />
        <table><tr><td>
            <table><tr>
            <td Width="100px"></td>
            <td>
                <asp:Image ID="Image1" runat="server" Width="400px" Height="500px"/>
            </td>
            <td Width="100px"></td>
                   </tr></table>
            <td>
                <table Width="800px"><tr><td>
                    <asp:Label ID="BookName" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="SellPrice" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="OriginalPrice" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="ISBN" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="Category" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="Brief" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="Link" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Blank" runat="server" Text=" " Width="300px"></asp:Label>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/webimg/Link.jpg" OnClick="ImageButton1_Click" />
                        </td></tr>
                    <tr><td Height="5px"></td></tr>
                    <tr><td><asp:Label ID="Number_book" runat="server" Text="Number of books you want to buy:"></asp:Label>
                        &nbsp;<asp:TextBox ID="Number" runat="server" Font-Size="X-Large" Width="100px" ></asp:TextBox>
                        </td></tr>
                    <tr><td>
                        <asp:Label ID="Mode" runat="server" Text="Transaction mode:"/>
                        &nbsp;<asp:RadioButton ID="radMode" runat="server"  Text="Offline" Checked="true" GroupName="Way" Font-Size="Large"/>
                        &nbsp;<asp:RadioButton ID="radMode2" runat="server" Text="Send" GroupName="Way" Font-Size="Large" />

                        &nbsp;

                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/webimg/Shop.jpg" OnClick="ImageButton3_Click" />
                        </td></tr>
                    <tr><td>
                        <asp:ImageButton ID="ImageButton4" runat="server" Height="40px" ImageUrl="~/webimg/Contact.jpg" OnClick="ImageButton4_Click" />
                        <asp:Label ID="Message" runat="server" Font-Size="Large" Text=""></asp:Label></td></tr>
                </table>
                <table><tr></tr></table>
            </td>

              </td></tr></table>
        
    
    </div>
    </form>
</body>
</html>
