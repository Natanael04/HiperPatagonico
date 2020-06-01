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
        <form>
          <div class="row" >
                    <div class="col-md-5 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelRUT" class="control-label" runat="server" Text="RUT"></asp:Label>
                            <asp:TextBox ID="rut" class="form-control" name="rut" runat="server" placeholder="Ingrese RUT..." Width="300px" value="20317991-k"></asp:TextBox>
                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px" value="Pamela"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese apellido..." Width="300px" value="Diaz"></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>

                            <select class="form-control" id="cargo" style="width:300px">
                                <option value=""  disabled hidden>Seleccione Cargo</option>
                                <option value="supervisor" selected>Surpervisores</option>
                                <option value="secretaria">Secretaría</option>
                            </select>                    
                        </div> 
                  </div>
          </div>
            <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
          </form>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>
