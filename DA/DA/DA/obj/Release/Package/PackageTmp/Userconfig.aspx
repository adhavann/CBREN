<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userconfig.aspx.cs" Inherits="DA.Userconfig" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Depression assist with multimodal trigger</title>
    <!-- Bootstrap core CSS -->

    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">

            <table>
                <tr>
                    <td colspan="2">
                        <h2>Neural Feedback Settings</h2>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblhead" runat="server" CssClass="labeltext">Left Mid Frontal alpha</asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="txtFname" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" CssClass="labeltext">Right Mid Frontal alpha</asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" CssClass="labeltext">Theta Value</asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="TextBox2" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>Likeability Settings</h2>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="labeltext">Alpha level</asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="TextBox3" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="labeltext">Theta level</asp:Label>
                    </td>

                    <td>
                        <asp:TextBox ID="TextBox4" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr><td></td></tr>
                
               
            </table><br />
          <asp:Button ID="btnSubmit" Text="DEFAULT" CssClass="theme-btn" runat="server" /> &nbsp; &nbsp;

 <asp:Button ID="Button1" Text="UPDATE" CssClass="theme-btn" runat="server" />
        </div>
    </form>
</body>
</html>
