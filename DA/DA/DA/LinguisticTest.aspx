<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinguisticTest.aspx.cs" Inherits="DA.LinguisticTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>C-BREN</title>
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <script type="text/javascript">

        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center" style="margin-top: 2%;">
            <h1>C-BREN - Linguistic Testing!</h1>
            <h3> Test: 2 of 8</h3>
            <h2>Select the correct word!</h2>
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                        </asp:Timer>
                        <asp:Label ID="Label19" runat="server" CssClass="labelbigdisplay"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
        </div>
        <div align="center">

            <table style="width: 70%; border: 1px solid black; margin-top: 10px;">
                <tr>
                    <td align="center">
                        <table>

                            <tr>
                                <td>
                                    <asp:Label ID="lblt1" Text="1. Choose the word in <b>German</b> for " runat="server" CssClass="labeltext" Style="text-align: center"></asp:Label>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/boy.png" Height="70px" ImageAlign="Middle" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid grey;">
                                    <asp:RadioButtonList ID="rbq1" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" CssClass="labeltext">
                                        <asp:ListItem Text="Bullen" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Junge" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Blume" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Garcon " Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Giege" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>

                        </table>
                    </td>
                    <td>
                        <table>

                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="2. Choose the word in <b>Spanish</b> for " runat="server" CssClass="labeltext" Style="text-align: start"></asp:Label>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/umbrella.jpg" Height="70px" ImageAlign="Middle" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid gray;">
                                    <asp:RadioButtonList ID="rbq2" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" CssClass="labeltext">
                                        <asp:ListItem Text="parami" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="parapluie" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="ninau" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="paraguas " Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Regenschirm" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>

                        </table>
                    </td>
                    <td>
                        <table>

                            <tr>
                                <td>
                                    <asp:Label ID="Label2" Text="3. Choose the word in <b>French</b> for " runat="server" CssClass="labeltext" Style="text-align: start"></asp:Label>
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/apple.jfif" Height="70px" ImageAlign="Middle" /></td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid gray;">
                                    <asp:RadioButtonList ID="rbq3" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" CssClass="labeltext">
                                        <asp:ListItem Text="manzana" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="pomme" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="apfel" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="chico " Value="4"></asp:ListItem>
                                        <asp:ListItem Text="jablko" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>

                        </table>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div align="center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="theme-btn" OnClick="btnSubmit_Click" /></div>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
