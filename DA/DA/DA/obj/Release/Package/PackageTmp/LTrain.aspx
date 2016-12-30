<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LTrain.aspx.cs" Inherits="DA.LTrain" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>C-BREN</title>
    <!-- Bootstrap core CSS -->

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
        <div align="center" style="margin-top: 1%">
            <h2>C-BREN - Linguistic Training</h2>
            <h3> Your Test starts now : 1 of 8</h3>

            <h4>Play the audio files to listen for the words</h4>

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

            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/apple.jfif" Height="70px" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Play to listen in French" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/applefr.mp3" type="audio/mp3" />

            </audio>
            &nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="<b>Text : pomme</b>" CssClass="labeltext"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Play to listen in Spanish" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/applesp.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label6" runat="server" Text="<b>Text : manzana</b>" CssClass="labeltext"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Play to listen in German" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/appleger.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label4" runat="server" Text="<b>Text : Apfel</b>" CssClass="labeltext"></asp:Label><br />
            <br />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/boy.png" Height="70px" />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Play to listen in French" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/boyfr.mp3" type="audio/mp3" />

            </audio>
            &nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server" Text="<b>Text : garcon</b>" CssClass="labeltext"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Play to listen in Spanish" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/boysp.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label10" runat="server" Text="<b>Text : chico</b>" CssClass="labeltext"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Play to listen in German" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/boyger.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label12" runat="server" Text="<b>Text : Junge</b>" CssClass="labeltext"></asp:Label><br />
            <br />
            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/umbrella.jpg" Height="70px" />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Play to listen in French" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/umbrellafr.mp3" type="audio/mp3" />

            </audio>
            &nbsp;&nbsp;
            <asp:Label ID="Label14" runat="server" Text="<b>Text : parapluie</b>" CssClass="labeltext"></asp:Label>


            <br />
            <br />
            <asp:Label ID="Label15" runat="server" Text="Play to listen in Spanish" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/umbrellasp.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label16" runat="server" Text="<b>Text : paraguas</b>" CssClass="labeltext"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label17" runat="server" Text="Play to listen in German" CssClass="labeltext"></asp:Label>
            <audio controls="controls" height="90" width="100">
                <source src="AudioFiles/umbrellager.mp3" type="audio/mp3" />

            </audio>
            <asp:Label ID="Label18" runat="server" Text="<b>Text : Regenschirm</b>" CssClass="labeltext"></asp:Label><br />
            <br />
            <asp:Button ID="btnSubmit" Text="Proceed to Testing" CssClass="theme-btn" runat="server" OnClick="btnSubmit_Click" />
            &nbsp; &nbsp;
        </div>
    </form>
</body>
</html>
