<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Videocola.aspx.cs" Inherits="DA.Videocola" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <link rel="icon" href="../../favicon.ico" />
    <title>C-BREN</title>
    <!-- Bootstrap core CSS -->

    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js">
    </script>
    <script type="text/javascript">


        $(document).ready(function () {
            $("#myVideo").bind('ended', function () {
                window.location.href = 'http://localhost:55906/Audio';
            });
        });

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
        <asp:HiddenField ID="vtime" runat="server" />

        <div align="center" style="margin-top: 2%">
            <h1>C-BREN - Brain Entertainment!</h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                        </asp:Timer>
                        <asp:Label ID="Label19" runat="server" CssClass="labelbigdisplay" Visible="false"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
            <br />
            <br />
            <video autoplay controls id="myVideo">
                <source src="Videofiles/cola.mp4" />
            </video>



        </div>
    </form>
</body>
</html>
