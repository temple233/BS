<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publish.aspx.cs" Inherits="WebApplication1.Publish" %>

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
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/webimg/search.jpg" Height="36px" /></td>      
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
        
        <table border="2" align="center"rules=none  >
        <tr><td width="800px"></td></tr>
        <tr><td>
    <table align="center">
        <tr>
            <td><asp:Label ID="Name" runat="server" Text="Book Name" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="NameText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr>
            <td><asp:Label ID="Original" runat="server" Text="Original Price:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="OriginalText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr><td><asp:Label ID="Sell" runat="server" Text="Sell Price:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:TextBox ID="SellText" runat="server" Font-Size="X-Large"></asp:TextBox></td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr>
            <td><asp:Label ID="Category" runat="server" Text="Category:" Font-Size="X-Large"></asp:Label></td>
            <td><asp:DropDownList ID="DropDownList2" runat="server" Height="40px" Width="150px" Font-Size="X-Large">
                                <asp:ListItem Value = "1" Text = "Study">Study</asp:ListItem>
                                <asp:ListItem Value = "2" Text =  "Teaching">Teaching</asp:ListItem>
                                <asp:ListItem Value = "3" Text = "Amusement">Amusement</asp:ListItem>
                                <asp:ListItem Value = "4" Text = "Sports">Sports</asp:ListItem>
                           </asp:DropDownList>
            </td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr>
            <td><asp:Label ID="Brief" runat="server" Text="Brief Introduction:" Font-Size="X-Large"></asp:Label></td>
            <td>
                <asp:TextBox ID="Introduction" runat="server" Font-Size="X-Large"></asp:TextBox>
            </td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr>
            <td><asp:Label ID="IS" runat="server" Text="ISBN:" Font-Size="X-Large"></asp:Label></td>
            <td>
                <asp:TextBox ID="ISBN" runat="server" Font-Size="X-Large"></asp:TextBox>
            </td>
        </tr>
        <tr><td Height="7px" ></td></tr>
        <tr>
            <td><asp:Label ID="pic" runat="server" Text="Picture:" Font-Size="X-Large"></asp:Label></td>
            <td> <asp:FileUpload ID="FileUpload1" style="display:none" runat="server" onchange="Picture.value=this.value" />
                <input id="Picture" type="button"  value="Choose picture url" style="height:36px; font-size:28px;"class="button"  onclick="FileUpload1.click()" />
         
         </tr>
        <tr><td Height="7px" ></td></tr>
    </table>
    
    <table align="center">
        <tr>
            <td>
                <asp:Button ID="Pub" runat="server" Text="Publish" Font-Size="X-Large" OnClick="Pub_Click" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Message" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr><td Height="30px"></td></tr>
        <tr><td></td></tr>
    </table>

    </td></tr></table>



        
    
    </div>
    </form>
</body>
</html>
