<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HiperPatagonico1.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-9">
                <h2>Lista de <%: Title %>.</h2>
            </div>
            <div class="col-md-3">
                <img class="auto-style1" src="img/Logo_hiper.png" />
            </div>
        </div>
    </div>
    <style>
            /*estilos para la tabla*/
    table th {
        background-color: #EA9800 !important;
        color: white;
        text-align: center;
    }
    table>tbody>tr>td {
        vertical-align: middle !important;
    }

    /*para alinear los botones y cuadro de busqueda*/
    .btn-group, .btn-group-vertical {
        position: absolute !important;
    }
        .auto-style1 {
            width: 210px;
            height: 72px;
        }
    </style>
   
    
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="margin-left:35%;margin-top:5%">
    <div class="modal-content" style="width:65%">
      <div class="modal-header">
          <div class="row">
              <div class="col-md-11">
                  <h3 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h3>
              </div>
              <div class="col-md-1">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                  </button>
              </div>
          </div>
        
        
      </div>
      <div class="modal-body" style="">
          <form>
          <div class="row" >
                    <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelRUT" class="control-label" runat="server" Text="RUT"></asp:Label>
                            <asp:TextBox ID="rutTxt" class="form-control" name="rutTxt" runat="server" required placeholder="Ingrese RUT..." Width="300px"></asp:TextBox>
                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombreTxt" class="form-control" name="nombreTxt" runat="server" required placeholder="Ingrese nombre..." Width="300px"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellidoTxt" class="form-control" name="apellidoTxt" runat="server" required placeholder="Ingrese apellido..." Width="300px"></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelContrasena" class="control-label" runat="server" Text="Contraseña"></asp:Label>
                            <asp:TextBox ID="contrasenaTxt" type="password" class="form-control" name="contrasenaTxt" runat="server" required placeholder="Ingrese contraseña..." Width="300px"></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>
                            <asp:DropDownList ID="DropDownListCargo" Width="300px" class="form-control" runat="server" required>
                                <asp:ListItem value="" selected disabled hidden>Seleccione Cargo</asp:ListItem>
                                <asp:ListItem value="supervisor">Supervisores</asp:ListItem>
                                <asp:ListItem value="secretaria">Secretaría</asp:ListItem>
                                <asp:ListItem value="empleado">Empleado</asp:ListItem>
                            </asp:DropDownList>                    
                        </div> 
                  </div>
          </div>
     </div>
                    
      <div class="modal-footer">
          <div class="row-center">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <asp:Button ID="ButtonAgregar" runat="server" class="btn btn-primary" Text="Guardar" OnClick="ButtonAgregar_Click"/>
          </div>
        
          <asp:Label ID="MessageBox" runat="server" Text=""></asp:Label>
          </form>
      </div>
    </div>
  </div>
    </div>
   

     <!--tabla con GridView-->
    <div class="jumbotron">
        <div class="row mx-auto ">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive text-center">  
                            <asp:GridView ID="GridView1" AutoGenerateColumns="false" class="table table-striped table-bordered" runat="server">
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" DataField="usuario_id" HeaderText="ID" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="rut" HeaderText="RUT" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="nombre" HeaderText="nombre" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="apellido" HeaderText="apellido" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="cargo" HeaderText="Cargo" />
                                    <asp:TemplateField ItemStyle-Width="150px" HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button ID="ButtonEditar" class="btn btn-warning btn-sm" runat="server" Text="Editar" OnClick="ButtonEditar_Click" />
                                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-eliminar">Eliminar</button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>           
                    </div>
                </div>
        </div>  
    </div>
    <div class="modal fade" id="confirm-eliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Eliminar Usuario</h3>
            </div>
            <div class="modal-body">
                <p>¿Esta seguro de eliminar este usuario?, esta acción es irreversible.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <a class="btn btn-danger">Eliminar</a>
            </div>
        </div>
    </div>
</div>
    <script>
        $(document).ready(function () {

            $('#GridView1').DataTable();
            $('#myModal').modal('toggle')
        });
    </script>
</asp:Content>

