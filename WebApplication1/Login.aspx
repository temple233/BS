<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 700px;
        }
    </style>
</head>
<body style="height: 768px">
    <form id="form1" runat="server">
        <div>
     <table >
         <tr>
             <td Width="100px"></td>
             <td class="auto-style1"><asp:Image ID="Image1" runat="server" Height="650px" Width="650px" ImageUrl="~/webimg/Login.png" /></td>
             <td Width="100px"></td>
             <td>
                 <table border="1" >
                     <tr><td>
                         <table>
                             <tr><td><br /><br /></td></tr>
                             <tr><td>
                                 <table>
                                     <tr><td>
                                         <asp:Label ID="Name" runat="server" Text="Name" Font-Size="X-Large"></asp:Label>
                                         :&nbsp;&nbsp;&nbsp;
                                         <asp:TextBox ID="NameText" runat="server" Font-Size="X-Large"></asp:TextBox>
                                         <br />
                                         <asp:Label ID="Name_error" runat="server" Font-Size="X-Large"></asp:Label>
                                         <br />
                                         <br />
                                         </td>
                                     </tr>
                                     <tr><td>
                                         <asp:Label ID="Password" runat="server" Text="Password" Font-Size="X-Large"></asp:Label>
                                         :&nbsp;
                                         <asp:TextBox ID="PasswordText" runat="server" Font-Size="X-Large"></asp:TextBox>
                                         <br />
                                         <asp:Label ID="Password_error" runat="server" Font-Size="X-Large"></asp:Label>
                                         <br />
                                         <br />
                                         </td>
                                    </tr>
                                </table>
                                </td>
                            </tr>
                             <tr align="right">
                                 <td> <asp:ImageButton style='width:60%' align="center" ID="ImageButton1" runat="server" ImageUrl="~/webimg/Loginp.png" OnClick="ImageButton1_Click" />
                                     <br />
                                </td>
                                 </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" Height="43px" Width="125px" Font-Size="Large"></asp:Button>
                                      &nbsp;&nbsp;
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                      <br />
                                 </td>
                             </tr>
                        </table>

                         </td>
                     </tr>
                 </table>
             </td>
             <td Width="100px"></td>
         </tr>
     </table>
        </div>
    </form>
</body>
</html>
