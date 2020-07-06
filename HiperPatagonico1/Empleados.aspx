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
          <div class="row" >
                    
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese Apellido..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>
              </div>
          </div>
                         </div>
        
    

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <asp:Button ID="ButtonAgregar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonAgregar_Click" />
      </div>
    </div>
  </div>
    </div>
             

     <!--Ejemplo tabla con Repeater-->
    <div class="jumbotron">

       <asp:Label ID="LabelMsg" runat="server" Text=""></asp:Label>


        <div class="row mx-auto ">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Agregar</button>
                    <br />
                    <br />
                    <div class="table-responsive text-center">        
                        <table id="example" class="table table-striped table-bordered"  width="80%">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Apellido</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterEmplados" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                                <ItemTemplate>
                                   <tr>
                                       <td><asp:Label ID="Label_id" runat="server" Text='<%#Eval("Id_empleado") %>'/></td>
                                       <td><%# Eval("nombre")%></td>
                                       <td><%# Eval("apellido")%></td>
                                       <td>
                                           <asp:linkbutton ID="Linkbutton1" class="btn btn-warning btn-sm" commandname="Update"
                                               runat="server" text="Editar"  
                                               CommandArgument='<%#Eval("Id_empleado")%>' />
                                           <asp:linkbutton ID="Linkbutton2" class="btn btn-danger btn-sm" commandname="Destroy"
                                               runat="server" text="Eliminar"  
                                               CommandArgument='<%#Eval("Id_empleado")%>' />

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
                <h3>Eliminar Empleado</h3>
            </div>
            <div class="modal-body">
                <p>¿Esta seguro de eliminar este empleado?, esta acción es irreversible.</p>
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


