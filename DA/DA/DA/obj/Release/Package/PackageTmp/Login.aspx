<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DA.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 
    <link rel="icon" href="../../favicon.ico"/>
    <title>C-BREN</title>
    <!-- Bootstrap core CSS -->

    <link href="Content/StyleSheet.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="margin-left: 5%; width: 90%; margin-top: 0%; margin-right: 10%;">
            <tr><td colspan="3" align="center"><h1>C-BREN</h1></td></tr>
            <tr>
                <td style="width: 36%; line-height: 10px;">
                    
                        <img src="images/happy-people-silhouettes-2.jpg" onmouseover="this.style.cursor='pointer';" id="imglogo" style="height:100px" />
                </td>
                <td>
              
                </td>
                <td style="width: 30%;">
                    <table>
                        <tr>
                            <td style="text-align: left; width: 150px;">
                                <asp:TextBox ID="txtUname" CssClass="textboxlogin" runat="server" placeholder="Username"></asp:TextBox>
                            </td>
                            <td style="text-align: left; width: 150px;">
                                <asp:TextBox ID="txtPwd" CssClass="textboxlogin" runat="server" placeholder="Password"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td style="text-align: left; width: 150px;">
                                <asp:Button ID="btnLogin" Text="LOGIN" CssClass="theme-btn" runat="server" OnClick="btnLogin_Click"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblError" CssClass="labelErrortext" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <hr noshade size="1" width="56%" style="border-color: black;">
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <table>
                       
                        <tr>
                        </tr>
                        <tr>
                            <td class="labeltext">
                                <b>Depression Assist Features</b>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="labeltext"><img src="images/tick.png"  width="25px" height="25px"/>
                                Brain Entertainment
                            </td>
                        </tr>
                        <tr>
                            <td class="labeltext"><img src="images/tick.png"  width="25px" height="25px"/>
                                Neural Feedback
                            </td>
                        </tr>
                        <tr>
                            <td class="labeltext"><img src="images/tick.png"  width="25px" height="25px"/>
                                Pre post asssement
                            </td>
                        </tr>
                        <tr>
                            <td class="labeltext"><img src="images/tick.png"  width="25px" height="25px"/>
                                Cognitive improvement measurement
                            </td>
                        </tr>
                        <tr>
                            <td class="labeltext"><img src="images/tick.png"  width="25px" height="25px"/>
                                Analytics
                            </td>
                        </tr>
                       
                    </table>
                </td>
                <td>
                    <hr style="border-color: #E6E6E6;" size="400" width="1">
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblhead" runat="server" Style="font-family: Arial; color: Blue; font-size: 14px;">New User Registration</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtFname" CssClass="textbox" runat="server" placeholder="First name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtLname" CssClass="textbox" runat="server" placeholder="Last name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtUsername" CssClass="textbox" runat="server" placeholder="Username"> </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPassword" CssClass="textbox" runat="server" TextMode="Password"
                                    placeholder="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtEmail" CssClass="textbox" runat="server" placeholder="Email"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:TextBox ID="txtDOB" CssClass="textbox" runat="server" placeholder="Date of Birth"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="rdgender" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CssClass="labeltext" >
                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSubmit" Text="REGISTER" CssClass="theme-btn" runat="server" OnClick="btnSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <hr noshade size="1" width="56%" style="border-color: black;">
                </td>
            </tr>
             <tr>
                <td colspan="3" style="text-decoration: none; font-size: small; font-family: Arial;
                    text-align: center;">
                    © 
                    <asp:Label ID="lblDate" CssClass="labeltext" runat="server" Text="2016"></asp:Label>. &nbsp;All
                    rights reserved.
                </td>
            </tr>
        </table>
    </div>
    </form>​
</body>
</html>
