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
        <div class="row">
              <div class="col-md-11">
                  <h3 class="modal-title" id="exampleModalLabel">Nuevo Turno</h3>
              </div>
              <div class="col-md-1">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                  </button>
              </div>
          </div>
      </div>
      <div class="modal-body">
          <div class="row" >
                    
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelCodigo" class="control-label" runat="server" Text="Codigo"></asp:Label>
                            <asp:TextBox ID="codigoTxt" class="form-control" name="Codigo" runat="server" placeholder="Ingrese Codigo..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelInicio" class="control-label" runat="server" Text="Inicio"></asp:Label>
                            <asp:TextBox ID="inicioTxt" class="form-control" type="time"  min="07:00" max="22:00" name="Inicio" runat="server" placeholder="Hora inicio" Width="300px" required autocomplete="off"></asp:TextBox>
                            
                            
                        </div>
              </div>
               <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="Label1" class="control-label" runat="server" Text="Termino"></asp:Label>
                            <asp:TextBox ID="terminoTxt" class="form-control" type="time" min="07:00" max="22:00" name="Termino" runat="server" placeholder="Hora salida" Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>
              </div>
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
          <asp:Button ID="ButtonAgregar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonAgregar_Click" />
      </div>
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
                    <div class="table-responsive text-center">        
                        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Codigo</th>
                                <th class="text-center">Inicio</th>                               
                                <th class="text-center">Termino</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterTurnos" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                                <ItemTemplate>
                                   <tr>
                                       <td><asp:Label ID="Label_id" runat="server" Text='<%#Eval("Id_turno") %>'/></td>
                                       <td><%# Eval("codigo")%></td>
                                       <td><%#Eval("horaInicio") %></td>
                                       <td><%#Eval("horaTermino") %></td>
                                       <td>
                                           <asp:linkbutton ID="Linkbutton1" class="btn btn-warning btn-sm" commandname="Update"
                                               runat="server" text="Editar"  
                                               CommandArgument='<%#Eval("Id_turno")%>' />
                                           <asp:linkbutton ID="Linkbutton2" class="btn btn-danger btn-sm" commandname="Destroy"
                                               runat="server" text="Eliminar"  
                                               CommandArgument='<%#Eval("Id_turno")%>' />

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
    <script>
        $(document).ready(function () {
            
            $('#example').DataTable();
            $('#myModal').modal('toggle')
        });
    </script>
</asp:Content>
