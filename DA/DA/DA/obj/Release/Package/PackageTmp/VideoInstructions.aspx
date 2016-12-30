<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoInstructions.aspx.cs" Inherits="DA.VideoInstructions" %>

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
            <h1>C-BREN - Brain Entertainment Instructions!</h1>
         <br />
         <br />
         <h3> The next session is the Brain Entertainment.

             Ensure that your Emotive band is properly connected! </h3>

         <br />
         <asp:Button ID="btnSubmit" Text="Proceed to Brain Entertainment" runat="server" CssClass="theme-btn" OnClick="btnSubmit_Click" />
    
    </div>
    </form>
</body>
</html>
