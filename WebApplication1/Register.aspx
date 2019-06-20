<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register_" %>

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
            <td Width="50px"></td>
            <td><asp:Image ID="Image1" runat="server" ImageUrl="~/webimg/TIM图片20190620162637.png" /></td>
        </tr>
    </table>
    <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
    
    <table align="center">
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="New user" Font-Size="XX-Large"></asp:Label></td>
            <td Width="300px">
                <br />
            </td>
        </tr>
    </table>
    <table align="center">
        <tr>
            <td><asp:Label ID="Name" runat="server" Text="Name:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="NameText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Password" runat="server" Text="Password:" Font-Size="X-Large"></asp:Label>
            </td>
            <td><asp:TextBox ID="PasswordText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Email" runat="server" Text="Email:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="EmailText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="City" runat="server" Text="City:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="CityText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
    </table>
    <table align="center">
        <tr>
            <td width="200px"></td>
            <td><asp:Button ID="Register" runat="server" Text="Register" Height="43px" Width="125px" Font-Size="Large" OnClick="Register_Click"></asp:Button></td>
        </tr>
    </table>
    <table align="center">
        <tr>
            <td>
                <asp:Label ID="Message" runat="server" Font-Size="Large" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
