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
    <script lang="JavaScript">
        function validar_rut(source, arguments)
        {
        var rut=arguments.Value;suma=0;mul=2;i=0;

        for (i=rut.length-3;i>=0;i--)
        {
        suma=suma+parseInt(rut.charAt(i)) * mul;
        mul= mul==7 ? 2 : mul+1;
        }

        var dvr = ''+(11 - suma % 11);
        if (dvr=='10') dvr = 'K'; else if (dvr=='11') dvr = '0';

        if (rut.charAt(rut.length-2)!="-"||rut.charAt(rut.length-1).toUpperCase()!=dvr)
        arguments.IsValid = false;
        else
        arguments.IsValid = true;
        }
</script>
</head>
<body style="background-size: cover;">
<div class="loginbox" style="border-radius:10px">
        <img src="img/avatar.png" alt="Alternate Text" class="user" />
        <h2>Iniciar Sesión</h2> <br />
        <form id="form1" runat="server">
            <asp:Label Text="Rut (con guión)" CssClass="lblrut" runat="server" />
            <asp:TextBox id="txtRut" runat="server" Columns="20" MaxLength="10" CssClass="txtrut" Placeholder="Ingrese Rut" required autocomplete="off"/>
            <br />
            <asp:Label Text="Contraseña" CssClass="lblpass" runat="server" /><br />
            <asp:TextBox TextMode="Password"  runat="server"  CssClass="txtrut" Placeholder="Ingrese contraseña" Width="270px" required ID="txtPass" /><br />
            <br /><br />
            <asp:Button Text="Ingresar" CssClass="btn" runat="server" OnClick="Unnamed5_Click"   />
           
            <asp:Label ID="lblMensaje" ForeColor="Red" runat="server" Text="Label"></asp:Label>
            <asp:CustomValidator id="cv_rut" runat="server" ForeColor="red" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />
        </form>
    </div> 
</body>
</html>