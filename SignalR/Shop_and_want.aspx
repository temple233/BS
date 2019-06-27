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
                <td Width="500px">
                    
                </td>      
               
                <td>

                    <asp:ImageButton ID="ImageButton3" runat="server" Height="80px" ImageUrl="~/webimg/want.jpg"  />

                </td>
                <td>
                    <asp:Label ID="user_id" runat="server" BackColor="Red" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
        <div style="text-align: center;">
        <table  style="margin: auto;" >
            <tr><td>
                    <asp:Label ID="Label1" runat="server" Text="Deal" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td></tr>
            <tr><td>
                <asp:GridView ID="GridView1" runat="server" Font-Size="Large" HorizontalAlign="Center"></asp:GridView>
                </td></tr>
            <tr><td>
                    <asp:Label ID="Label2" runat="server" Text="Want" Font-Bold="True" Font-Size="Large"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ADD" runat="server" Text="Add_want" Font-Bold="True" Font-Size="Large" OnClick="ADD_Click" />
            </td></tr>
            <tr><td>
                <asp:GridView ID="GridView2" runat="server" Font-Size="Large" HorizontalAlign="Center"></asp:GridView>
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
