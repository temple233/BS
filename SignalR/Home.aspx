﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home1" %>

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
                           <asp:TextBox ID="SearchText" runat="server" Height="40px" Width="260px"></asp:TextBox>
                           <asp:DropDownList ID="DropDownList1" runat="server" Height="46px" Width="120px" Font-Size="X-Large">
                                <asp:ListItem Value = "1" Text = "Study">Study</asp:ListItem>
                                <asp:ListItem Value = "2" Text =  "Teaching">Teaching</asp:ListItem>
                                <asp:ListItem Value = "3" Text = "Amusement">Amusement</asp:ListItem>
                                <asp:ListItem Value = "4" Text = "Sports">Sports</asp:ListItem>
                           </asp:DropDownList>
                    </td></tr></table>
                </td>      
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/webimg/search.jpg" OnClick="ImageButton1_Click" Height="36px" /></td>      
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="36px" ImageUrl="~/webimg/Publish_book.png" OnClick="ImageButton2_Click" Width="135px" /></td>
                <td width="20px"></td>
                <td>
                    <asp:Label ID="user_id" runat="server" BackColor="Red" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Height="36px"></asp:Label>
                </td>
                <td width="20px"></td>
                <td>

                    <asp:ImageButton ID="ImageButton3" runat="server" Height="50px" ImageUrl="~/webimg/want.jpg" OnClick="ImageButton3_Click" />

                </td>
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/webimg/main.jpg" Height="60px" OnClick="ImageButton4_Click" />
                </td>
                <td width="20px"></td>
                <td>
                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/webimg/chat.jpg" Height="60px" OnClick="ImageButton5_Click" />
                </td>
            </tr>
        </table>
        <hr style="clear: both;background-color:red;height: 5px;width:100%;border:none;"/>
  
  
        <br />
        <table><tr>
            <td Width="150px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image1" runat="server" OnClick="Image1_Click" Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name1" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell1" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Origin1" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image2" runat="server"  Width="200px" Height="250px" OnClick="Image2_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name2" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell2" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin2" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image3" runat="server"  Width="200px" Height="250px" OnClick="Image3_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name3" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell3" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin3" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image4" runat="server"  Width="200px" Height="250px" OnClick="Image4_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name4" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell4" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin4" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            </tr> 

            <tr>
            <td Width="150px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image5" runat="server" OnClick="Image5_Click" Width="200px" Height="250px"/></td></tr>
                    <tr><td><asp:Label ID="Name5" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell5" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Origin5" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image6" runat="server"  Width="200px" Height="250px" OnClick="Image6_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name6" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell6" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin6" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image7" runat="server"  Width="200px" Height="250px" OnClick="Image7_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name7" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell7" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin7" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            <td Width="100px"></td>
            <td><table><tr><td><asp:ImageButton ID="Image8" runat="server"  Width="200px" Height="250px" OnClick="Image8_Click"/></td></tr>
                    <tr><td><asp:Label ID="Name8" runat="server" Text="" Width="200px"></asp:Label></td></tr>
                    <tr><td><asp:Label ID="Sell8" runat="server" Text="" Width="70px" ForeColor="Red" Font-Bold="True"></asp:Label>
                            <asp:Label ID="Origin8" runat="server" Text="" Width="70px" Font-Overline="False" Font-Strikeout="True"></asp:Label></td></tr>
                </table></td>
            </tr>
            
        </table>
        <table>
            <tr><td Width="1000px"></td>
                <td>
                <asp:Button ID="Button1" runat="server" Text="+" OnClick="Button1_Click" /></td>
                <td>
                <asp:Label ID="Label1" runat="server" Text="Page:1"></asp:Label></td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="-" OnClick="Button2_Click" /></td>
            </tr>
        </table>
        
        <br />
        
        
        
        <br />
    
    </div>
    </form>
</body>
</html>
