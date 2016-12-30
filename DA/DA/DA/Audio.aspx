<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Audio.aspx.cs" Inherits="DA.Audio" %>

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
    <script type="text/javascript">

        function onend() {

            window.location.href = "http://localhost:55906/Game";
        }


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
        <div align="center" style="margin-top: 2%">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <h1>C-BREN - Brain Entertainment!</h1>
            <h3> Test: 7 of 8</h3>
            <br />
            <h3>Play an audio you like!</h3>
            <h4>You will be redirected to a game after the audio is played!</h4>
            <table style="width: 50%;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">

                        <asp:RadioButtonList ID="rbq2" CssClass="labeltext" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" CellPadding="20" OnSelectedIndexChanged="rbq2_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text='Binural Beats' Value="1" Selected="true"></asp:ListItem>
                            <asp:ListItem Text='Rain Sounds' Value="2"></asp:ListItem>
                            <asp:ListItem Text='Instrumental (Piano)' Value="3"></asp:ListItem>

                        </asp:RadioButtonList>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <audio controls="controls" height="100" width="200" id="audio1" runat="server" autoplay onended="onend()">
                            <source src="AudioFiles/binural.mp3" />
                        </audio>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <audio controls="controls" height="100" width="200" id="audio2" runat="server" autoplay onended="onend()">
                            <source src="AudioFiles/Rainsound.mp3" />
                        </audio>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <audio controls="controls" height="100" width="200" id="audio3" runat="server" autoplay onended="onend()">
                            <source src="AudioFiles/piano.mp3" />
                        </audio>
                    </td>
                </tr>


            </table>




        </div>

    </form>
</body>
</html>
