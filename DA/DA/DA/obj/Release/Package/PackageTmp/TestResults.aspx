<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestResults.aspx.cs" Inherits="DA.TestResults" %>

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
        <div align="center" style="margin-top: 5%" class="container">
            <h1>CBREN- Test Results</h1>
            <h3>Pre Test Results</h3>
            <br />
           <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Linguistic</th>
                        <th>Puzzle</th>
                        <th>Memory</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                        <td  style="width: 18%">
                            <asp:Label ID="lblPreL" CssClass="labeltext" runat="server" ></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPreP" CssClass="labeltext" runat="server" ></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPreM" CssClass="labeltext" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPreT" CssClass="labeltext" runat="server" ></asp:Label></td>

                    </tr>

                </thead>
            </table>
            <br />
            <br />
            <br />
            <h3>Post Test Results</h3>
            <br />
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Linguistic</th>
                        <th>Puzzle</th>
                        <th>Memory</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPostL" CssClass="labeltext" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPostP" CssClass="labeltext" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPostM" CssClass="labeltext" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPostT" CssClass="labeltext" runat="server"></asp:Label></td>

                    </tr>

                </thead>
            </table>
        </div>
    </form>
</body>
</html>
