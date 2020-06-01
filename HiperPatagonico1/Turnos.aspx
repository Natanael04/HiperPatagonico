<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="HiperPatagonico1.Turnos" %>
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
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="row" >
                    
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelCodigo" class="control-label" runat="server" Text="Codigo"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="Codigo" runat="server" placeholder="Ingrese Codigo..." Width="300px"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelInicio" class="control-label" runat="server" Text="Inicio"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="Inicio" runat="server" placeholder="Hora inicio" Width="300px"></asp:TextBox>
                            
                            
                        </div>
              </div>
               <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="Label1" class="control-label" runat="server" Text="Termino"></asp:Label>
                            <asp:TextBox ID="TextBox1" class="form-control" name="Termino" runat="server" placeholder="Hora salida" Width="300px"></asp:TextBox>
                        </div>
              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="Label2" class="control-label" runat="server" Text="Colacion"></asp:Label>
                            <asp:TextBox ID="TextBox2" class="form-control" name="Colacion" runat="server" placeholder="Hora colacion" Width="300px"></asp:TextBox>
                        </div>
              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="Label3" class="control-label" runat="server" Text="Total horas"></asp:Label>
                            <asp:TextBox ID="TextBox3" class="form-control" name="Termino" runat="server" placeholder="Total de horas" Width="300px"></asp:TextBox>
                        </div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Guardar</button>
      </div>
     </form>
    </div>
  </div>
</div>

     <!--Ejemplo tabla con DataTables-->
    <div class="jumbotron">
        <div class="row">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive">        
                        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Codigo</th>
                                <th>Inicio</th>                               
                                <th>Termino</th>
                                <th>Colacion</th>
                                <th>Total horas</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>01</td>
                                <td>T/33</td>
                                <td>123</td>                                
                                <td>987635</td>
                                <td>HORA</td>
                                <td>9</td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#exampleModal">Editar</button>
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
