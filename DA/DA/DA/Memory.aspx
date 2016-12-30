<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Memory.aspx.cs" Inherits="DA.Memory" %>

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
        <div align="center" style="margin-top: 2%; margin-left: 5%">
            <h2>C-BREN - Memory!</h2>
            <h3> Test: 4 of 8</h3>
            <h4>Have a look at the images of the objects below!</h4>
            <br /><br />
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


            <asp:Image ID="imgall" ImageUrl="~/images/Memobj.png" runat="server" Height="300px" />
               <br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Proceed for Memory Testing" CssClass="theme-btn" OnClick="btnSubmit_Click" />           

        </div>
    </form>
</body>
</html>
