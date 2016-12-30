<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="DA.Config" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <link rel="icon" href="../../favicon.ico" />
    <title>C-BREN</title>
    <!-- Bootstrap core CSS -->

    <link href="Content/StyleSheet.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        <div align="center">

            <h1>C-BREN</h1>
            <h3>Neural Feedback Configuration</h3>
            <table>
                <tr>
                    <td align="left">
                        <asp:Label ID="lbl" Text="Left mid Frontal Alpha" runat="server" CssClass="labeltext"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtLeftAlpha" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblralpha" Text="Right mid Frontal Alpha" runat="server" CssClass="labeltext"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtRightAlpha" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblthata" Text="" runat="server" CssClass="labeltext"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtNTheta" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnDefault" Text="Load Default" runat="server" CssClass="theme-btn" OnClick="btnDefault_Click" />
                        &nbsp;&nbsp;

            <asp:Button ID="btnSubmit" Text="Submit" runat="server" CssClass="theme-btn" OnClick="btnSubmit_Click" />
                        &nbsp;&nbsp;</td>
                </tr>

            </table>
            <br />
            <h3>Likeability Configuration</h3>
            <table>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblal" Text="Alpha Level" runat="server" CssClass="labeltext"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtAlpha" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label2" Text="" runat="server" CssClass="labeltext"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtLTheta" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnLDefault" Text="Load Default" runat="server" CssClass="theme-btn" OnClick="btnLDefault_Click" />
                        &nbsp;&nbsp;

            <asp:Button ID="btnLSubmit" Text="Submit" runat="server" CssClass="theme-btn" OnClick="btnLSubmit_Click" />
                        &nbsp;&nbsp;</td>
                </tr>

            </table>
            <br />
            <br />
            <asp:LinkButton ID="lnkLtrain" runat="server" Text="Click here to Proceed for Training" CssClass="linktitle" OnClick="lnkLtrain_Click"></asp:LinkButton><br /><br />

            <hr noshade size="1" width="56%" style="border-color: black;">

            <a href="Login.aspx" style="text-decoration: none; font-size: small; font-family: Arial;">Logout</a><br />
            ©
                    <asp:Label ID="lblDate" CssClass="labeltext" runat="server" Text="2016"></asp:Label>. &nbsp;All
                    rights reserved.
             
        </div>
    </form>
</body>
</html>
