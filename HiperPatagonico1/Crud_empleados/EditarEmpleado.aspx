<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarEmpleado.aspx.cs" Inherits="HiperPatagonico1.Crud_empleados.EditarEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="row">
        <div class="col-sm-12">

    <div class="col-sm-5 col-sm-offset-3">
        <div style="background-color:#EAEAEA;margin-top:3%;border-radius:5px">
        <div class="modal-header">
          <div class="row" style="margin-left: 57px">
              <div class="col-md-5 " style="left: 0px; top: 0px; width: 271px">
                  <h3 class="modal-title">Editar Empleado</h3>
              </div>
          </div>
      </div><br />
          <div class="row" >
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px" value="Vicente"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese apellido..." Width="300px" value="Galindo"></asp:TextBox>
                    </div>
                  </div>
          </div>
            <div class="modal-footer">
          <asp:Button ID="ButtonGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonGuardar_Click" />
                </div>
                    <asp:Label ID="LabelErr" ForeColor="White" runat="server" Text=""></asp:Label>

            </div>
        </div>
    </div>
</div>
    
</asp:Content>

