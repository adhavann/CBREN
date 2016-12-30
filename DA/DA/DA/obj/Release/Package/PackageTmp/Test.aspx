<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="DA.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server">
    <title>Depression assist with multimodal trigger</title>
    <!-- Bootstrap core CSS -->

    <link href="Content/StyleSheet.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="margin-top:10%">
        <h2>Linguistic Training</h2>
        <h3>Play the audio to listen for the words in English and Spanish</h3>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/apple.jfif" Height="70px"  /><br />

        <asp:Label ID="Label1" runat="server" Text="Apple" CssClass="labeltext"></asp:Label> &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/images/audio.jfif" Height="12px"  /> <br />
        <asp:Label ID="Label2" runat="server" Text="Manzana" CssClass="labeltext"></asp:Label> &nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="~/images/audio.jfif" Height="12px"  /> <br />
        <br />
        <br />

        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/laptop.jfif" Height="70px"  /><br />

        <asp:Label ID="Label3" runat="server" Text="Laptop" CssClass="labeltext"></asp:Label> &nbsp;<asp:Image ID="Image5" runat="server" ImageUrl="~/images/audio.jfif" Height="12px"  /> <br />
        <asp:Label ID="Label4" runat="server" Text="Ordenador" CssClass="labeltext"></asp:Label> &nbsp;<asp:Image ID="Image6" runat="server" ImageUrl="~/images/audio.jfif" Height="12px"  /> <br />
        <br />
        <br />

    </div>
    </form>
</body>
</html>
