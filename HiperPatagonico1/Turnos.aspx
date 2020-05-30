<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="HiperPatagonico1.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <h2><%: Title %>.</h2>
    <h3>Youturnosssss .</h3>
    <p>Use this area to provide additional information.</p>
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
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

     <!--Ejemplo tabla con DataTables-->
    <div class="container">
        <div class="row">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Agregar</button>
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
                                    <button type="button" class="btn btn-danger btn-sm" >Danger</button>
                                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#exampleModal">Warning</button>
                                    
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
