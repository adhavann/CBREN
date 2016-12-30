<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemoryTest.aspx.cs" Inherits="DA.MemoryTest" %>

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
            <h1>C-BREN - Memory Testing!</h1>
            <h3> Test: 5 of 8</h3>
            <h2>Choose the images objects seen previously!</h2>
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
                    <td style="width: 25%" align="center">
                        <asp:CheckBox ID="chk1" runat="server" />

                        <asp:Image ID="img1" runat="server" ImageUrl="~/MemoryImages/m1.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk2" runat="server" />

                        <asp:Image ID="img2" runat="server" ImageUrl="~/MemoryImages/m2.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk3" runat="server" />

                        <asp:Image ID="img3" runat="server" ImageUrl="~/MemoryImages/m3.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk4" runat="server" />

                        <asp:Image ID="img4" runat="server" ImageUrl="~/MemoryImages/m4.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk5" runat="server" />

                        <asp:Image ID="img5" runat="server" ImageUrl="~/MemoryImages/m5.png" Height="80px" ImageAlign="Middle" />


                    </td>
                    <td style="width: 25%" align="center">
                        <asp:CheckBox ID="chk6" runat="server" />

                        <asp:Image ID="img6" runat="server" ImageUrl="~/MemoryImages/m6.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk7" runat="server" />

                        <asp:Image ID="img7" runat="server" ImageUrl="~/MemoryImages/m7.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk8" runat="server" />

                        <asp:Image ID="img8" runat="server" ImageUrl="~/MemoryImages/m8.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk9" runat="server" />

                        <asp:Image ID="img9" runat="server" ImageUrl="~/MemoryImages/m9.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk10" runat="server" />

                        <asp:Image ID="img10" runat="server" ImageUrl="~/MemoryImages/m10.png" Height="80px" ImageAlign="Middle" />


                    </td>
                    <td style="width: 25%" align="center">
                        <asp:CheckBox ID="chk11" runat="server" />

                        <asp:Image ID="img11" runat="server" ImageUrl="~/MemoryImages/m11.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk12" runat="server" />

                        <asp:Image ID="img12" runat="server" ImageUrl="~/MemoryImages/m12.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk13" runat="server" />

                        <asp:Image ID="img13" runat="server" ImageUrl="~/MemoryImages/m13.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk14" runat="server" />

                        <asp:Image ID="img14" runat="server" ImageUrl="~/MemoryImages/m14.png" Height="80px" ImageAlign="Middle" />
                        <br />
                        <br />
                        <asp:CheckBox ID="chk15" runat="server" />

                        <asp:Image ID="img15" runat="server" ImageUrl="~/MemoryImages/m15.png" Height="80px" ImageAlign="Middle" />


                    </td>
                </tr>



            </table>
            <br />
            <asp:Button ID="btnSubmit" Text="Submit" CssClass="theme-btn" runat="server" OnClick="btnSubmit_Click" />

        </div>
    </form>
</body>
</html>
