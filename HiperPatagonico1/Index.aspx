<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HiperPatagonico1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/style.css" rel="stylesheet" />
</head>
<body>
<div class="loginbox">
        <img src="img/avatar.jpg" alt="Alternate Text" class="user" />
        <h2>Ingreso</h2>
        <form id="form1" runat="server">
            <asp:Label Text="Rut" CssClass="lblrut" runat="server" />
            <asp:TextBox runat="server" CssClass="txtrut" Placeholder="Ingrese Rut" />
            <asp:Label Text="Contraseña" CssClass="lblpass" runat="server" />
            <asp:TextBox TextMode="Password"  runat="server"  CssClass="txtpass" Placeholder="Ingrese contraseña"/>
            <br />
            <br />
            <asp:Button Text="Ingresar" CssClass="btn" runat="server" OnClick="Unnamed5_Click"   />
           
            <asp:LinkButton Text="olvidaste tu contraseña?" CssClass="btnolvidar" runat="server" />

        </form>
    </div> 
</body>
</html>
