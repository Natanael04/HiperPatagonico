<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="HiperPatagonico1.Ingresar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            border-bottom: 3px solid #fff;
            outline: none;
            color: #fff;
            font-size: 16px;
            background-color: transparent;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
    </style>
</head>
<body>
<div class="loginbox" style="border-radius:10px">
        <img src="img/avatar.png" alt="Alternate Text" class="user" />
        <h2>Iniciar Sesión</h2> <br />
        <form id="form1" runat="server">
            <asp:Label Text="Rut" CssClass="lblrut" runat="server" />
            <asp:TextBox runat="server" CssClass="txtrut" Placeholder="Ingrese Rut" required ID="txtRut" autocomplete="off"/>
            <asp:Label Text="Contraseña" CssClass="lblpass" runat="server" />
            <asp:TextBox TextMode="Password"  runat="server"  CssClass="auto-style1" Placeholder="Ingrese contraseña" Width="270px" required ID="txtPass" />
            <br />
            <br />
            <asp:Button Text="Ingresar" CssClass="btn" runat="server" OnClick="Unnamed5_Click"   />
           
            <asp:Label ID="lblMensaje" ForeColor="Red" runat="server" Text="Label"></asp:Label>
        </form>
    </div> 
</body>
</html>