<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="HiperPatagonico1.Crud_usuarios.EditarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="row">
        <div class="col-sm-12">

    <div class="col-sm-5 col-sm-offset-3">
        <div style="background-color:#EAEAEA;margin-top:3%;border-radius:5px">
        <div class="modal-header">
          <div class="row" style="margin-left: 57px">
              <div class="col-md-5 " style="left: 0px; top: 0px; width: 271px">
                  <h3 class="modal-title">Editar Usuario</h3>
              </div>
          </div>
      </div><br />
          <div class="row" >
                    <div class="col-md-5 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelRUT" class="control-label" runat="server" Text="RUT"></asp:Label>
                            <asp:TextBox ID="rutTxt" class="form-control" name="rut" runat="server" placeholder="Ingrese RUT..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombreTxt" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellidoTxt" class="form-control" name="apellido" runat="server" placeholder="Ingrese apellido..." Width="300px" required autocomplete="off"></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelContrasena" class="control-label" runat="server" Text="Contraseña"></asp:Label>
                            <asp:TextBox ID="contrasenaTxt" type="password" class="form-control" name="contrasena" runat="server" placeholder="Ingrese Contraseña..." Width="300px" required></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>
                            <asp:DropDownList ID="DropDownCargo" runat="server" class="form-control" style="width:300px" required>
                                <asp:ListItem value="Supervisor">Supervisor</asp:ListItem>
                                <asp:ListItem value="Secretaría">Secretaría</asp:ListItem>
                                <asp:ListItem value="Empleado">Empleado</asp:ListItem>
                            </asp:DropDownList>                  
                        </div> 
                  </div>
          </div>
            <div class="modal-footer">
          <asp:Button ID="ButtonGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonGuardar_Click" />
                </div>
            </div>
        <asp:Label ID="LabelErr" ForeColor="White" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>
    
</asp:Content>
