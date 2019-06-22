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
                <table Width="600px"><tr><td>
                    <asp:Label ID="BookName" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="SellPrice" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="OriginalPrice" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="ISBN" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Category" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Brief" runat="server" Text=""></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Link" runat="server" Text=""></asp:Label>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/webimg/Link.jpg" OnClick="ImageButton1_Click" />
                        </td></tr>

                </table>
            </td>

              </td></tr></table>
        
        
    
    </div>
    </form>
</body>
</html>
