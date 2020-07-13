<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadoTurno.aspx.cs" Inherits="HiperPatagonico1.EmpleadoTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-9">
                <h2>Lista de Horarios</h2>
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
  <div class="modal-dialog" >
    <div class="modal-content" >
      <div class="modal-header">
          <div class="row">
              <div class="col-md-11">
                  <h3 class="modal-title" id="exampleModalLabel">Asignar Turno a usuario</h3>
              </div>
              <div class="col-md-1">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                  </button>
              </div>
          </div>
        
        
      </div>
      <div class="modal-body" style="">
          <div class="row" >
              
          </div>
     </div>
                      <asp:Label ID="LabelMsg" runat="server" Text=""></asp:Label>
      <div class="modal-footer">
        <button type="button" id="cancelar" class="btn btn-secondary" data-dismiss="modal" onclick="clearTextBox()" >Cancelar</button>

          <script type="text/javascript">
              function clearTextBox() {
                  var elements = [];
                  elements = document.getElementsByClassName("form-control"); // your class name 

                  for (var i = 0; i < elements.length; i++) {
                      elements[i].value = "";
                  }
              }

          </script>
          <asp:Button ID="ButtonAgregar" class="btn btn-primary" runat="server" Text="Guardar" />
      </div>
    </div>
  </div>
    </div>
   
     <!--tabla con Repeater-->
    <div class="jumbotron">
                

        <div class="row ">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive text-center">        
                        <table id="example" class="table table-striped table-bordered"  >
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombre</th>                               
                                <th class="text-center">Apellido</th>
                                <th class="text-center">Codigo</th>
                                <th class="text-center">Hora Inicio</th>
                                <th class="text-center">Hora Termino</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterUsuarios" runat="server" >
                                <ItemTemplate>
                                   <tr>
                                       <td><asp:Label ID="Label_id" runat="server" Text='<%#Eval("Id_empleadoTurno") %>'/></td>
                                       <td><%# Eval("empleado.nombre")%></td>
                                       <td><%# Eval("empleado.apellido")%></td>
                                       <td><%# Eval("turno.codigo")%></td>
                                       <td><%# Eval("turno.horaInicio")%></td>
                                       <td><%# Eval("turno.horaTermino")%></td>
                                       <td>
                                           <asp:linkbutton ID="Linkbutton1" class="btn btn-warning btn-sm" commandname="Update"
                                               runat="server" text="Editar"  
                                               CommandArgument='<%#Eval("Id_empleadoTurno")%>' />
                                           <asp:linkbutton ID="Linkbutton2" class="btn btn-danger btn-sm" commandname="Destroy"
                                               runat="server" text="Eliminar"  
                                               CommandArgument='<%#Eval("Id_empleadoTurno")%>' />

<%--                                           <asp:Button ID="ButtonEditar" class="btn btn-warning btn-sm" runat="server" Text="Editar" OnClick="ButtonEditar_Click"  />--%>
<%--                                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-eliminar">Eliminar</button>--%>
                                       </td>
                                   </tr>
                               </ItemTemplate>
                            </asp:Repeater>            
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

            $('#example').dataTable({
                "lengthChange": false,
                "lengthMenu": [5]
            });
            $('#myModal').modal('toggle')
        });
    </script>
</asp:Content>


