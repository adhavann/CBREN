<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Puzzle.aspx.cs" Inherits="DA.Puzzle" %>

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
        <div align="center" style="margin-top: 1%;">
            <h1>C-BREN - Puzzle Solving!</h1>
            <h3> Test: 3 of 8</h3>
            <h2>Solve the puzzles below!</h2>
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
            <br />
            <table style="width: 60%; border: 1px solid black;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblq1" runat="server" Text="1. Please choose the next number: 13, 57, 911, 1315, 1719, ?" CssClass="labeltext"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid grey;">
                        <asp:RadioButtonList ID="rbq1" CssClass="labeltext" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15">
                            <asp:ListItem Text="3002" Value="1"></asp:ListItem>
                            <asp:ListItem Text="1784" Value="2"></asp:ListItem>
                            <asp:ListItem Text="2123" Value="3"></asp:ListItem>
                            <asp:ListItem Text="5345" Value="4"></asp:ListItem>
                            <asp:ListItem Text="1829" Value="5"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="2. Which of the diagram follows logically?" CssClass="labeltext"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="im1" runat="server" ImageUrl="~/images/PImage1.png" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid grey;">
                        <asp:RadioButtonList ID="rbq2" CssClass="labeltext" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" CellPadding="10">
                            <asp:ListItem Text='<img src="images/img1.png" alt="Image1" />' Value="1"></asp:ListItem>
                            <asp:ListItem Text='<img src="images/img3.png" alt="Image3" />' Value="2"></asp:ListItem>
                            <asp:ListItem Text='<img src="images/img2.png" alt="Image2" />' Value="3"></asp:ListItem>
                            <asp:ListItem Text='<img src="images/img4.png" alt="Image4" />' Value="4"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                    <tr>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="3. If NEW YORK can be encrypted as PGYAQTM, how can you code the word CHARLOTTE?" CssClass="labeltext"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid grey;">
                        <asp:RadioButtonList ID="rbq3" CssClass="labeltext" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15">
                            <asp:ListItem Text="EICSNPVVG" Value="1"></asp:ListItem>
                            <asp:ListItem Text="EICTNPVVF" Value="2"></asp:ListItem>
                            <asp:ListItem Text="EJCSMPVVG" Value="3"></asp:ListItem>
                            <asp:ListItem Text="EJCTNQVVG" Value="4"></asp:ListItem>
                            <asp:ListItem Text="EJCIQTTWG" Value="5"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                    <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr><td align="center"><asp:Button  ID="btnSubmit" Text="Submit" runat="server" CssClass="theme-btn" OnClick="btnSubmit_Click" /></td></tr>
            </table>
        </div>
    </form>
</body>
</html>


    
    
    
    