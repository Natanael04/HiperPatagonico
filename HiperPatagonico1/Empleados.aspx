<%@ Page Title="Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="HiperPatagonico1.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-9">
                <h2>Lista de <%: Title %>.</h2>
            </div>
            <div class="col-md-3">
                <img class="auto-style1" src="img/Logo_hiper.png"/>
            </div>
        </div>
    </div>
    
    <style>
            /*estilos para la tabla*/
    table th {
        background-color: #337ab7 !important;
        color: white;
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
                  <h3 class="modal-title" id="exampleModalLabel">Nuevo Empleado</h3>
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
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese Apellido..." Width="300px"></asp:TextBox>
                        </div>
              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="Label1" class="control-label" runat="server" Text="Cargo"></asp:Label>
                            <asp:TextBox ID="TextBox1" class="form-control" name="Cargo" runat="server" placeholder="Ingrese Cargo..." Width="300px"></asp:TextBox>
                        </div>
              </div>
          </div>
        
                         </div>
        
    
                    
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Guardar</button>
          </form>
      </div>
    </div>
  </div>
    </div>
   
     <!--Ejemplo tabla con DataTables-->
    <div class="container">
        <div class="row mx-auto ">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive text-center">        
                        <table id="example" class="table table-striped table-bordered"  width="80%">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Apellido</th>
                                <th class="text-center">Cargo</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Vicente</td>                                
                                <td>Galindo</td>
                                <td>Gerente</td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-sm">Editar</button>
                                    <button type="button" class="btn btn-danger btn-sm" >Eliminar</button>
                                    
                                    
                                </td>

                            </tr>
                                                    
                        </tbody>        
                       </table>                  
                    </div>
                </div>
        </div>  
    </div>
    <script>
        $(document).ready(function () {

            $('#example').DataTable();
            $('#myModal').modal('toggle')
        });
    </script>
</asp:Content>


