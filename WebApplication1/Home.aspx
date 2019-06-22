<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
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
                           <asp:TextBox ID="SearchText" runat="server" Height="30px" Width="300px"></asp:TextBox>
                           <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="80px">
                                <asp:ListItem Value = "1" Text = "Study">Study</asp:ListItem>
                                <asp:ListItem Value = "2" Text =  "Teaching">Teaching</asp:ListItem>
                                <asp:ListItem Value = "3" Text = "Amusement">Amusement</asp:ListItem>
                                <asp:ListItem Value = "4" Text = "Sports">Sports</asp:ListItem>
                           </asp:DropDownList>
                    </td></tr></table>
                </td>      
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/webimg/search.jpg" OnClick="ImageButton1_Click" /></td>      
            </tr>
        </table>
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
  
  
        <br />
        <table><tr>
            <td Width="150px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image1" runat="server" OnClick="Image1_Click" Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name1" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell1" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Origin1" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image2" runat="server"  Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name2" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell2" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin2" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image3" runat="server"  Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name3" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell3" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin3" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image4" runat="server"  Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name4" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell4" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin4" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            </tr> </table>
        
        <br />
        
        
        
        <br />
    
    </div>
    </form>
</body>
</html>
