﻿<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HiperPatagonico1.Usuarios" %>
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
                            <asp:TextBox ID="rut" class="form-control" name="rut" runat="server" placeholder="Ingrese RUT..." Width="300px"></asp:TextBox>
                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese apellido..." Width="300px"></asp:TextBox>
                    </div>
                  </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>

                            <select class="form-control" id="cargo" style="width:300px">
                                <option value="" selected disabled hidden>Seleccione Cargo</option>
                                <option value="supervisor">Surpervisores</option>
                                <option value="secretaria">Secretaría</option>
                            </select>                    
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
   
     <!--tabla con DataTables-->
    <div class="jumbotron">
        <div class="row mx-auto ">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive text-center">        
                        <table id="example" class="table table-striped table-bordered"  >
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">RUT</th>
                                <th class="text-center">Nombre</th>                               
                                <th class="text-center">Apellido</th>
                                <th class="text-center">Cargo</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>20317991-K</td>
                                <td>Pamela</td>                                
                                <td>Diaz</td>
                                <td>Supervisora</td>
                                <td>
                                    <asp:Button ID="ButtonEditar" class="btn btn-warning btn-sm" runat="server" Text="Editar" OnClick="ButtonEditar_Click" />
                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-eliminar">Eliminar</button>
                                    
                                </td>

                            </tr>
                                                    
                        </tbody>        
                       </table>                  
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

            $('#example').DataTable();
            $('#myModal').modal('toggle')
        });
    </script>
</asp:Content>
