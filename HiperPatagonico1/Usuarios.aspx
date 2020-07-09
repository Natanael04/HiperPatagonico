<%@ Page EnableEventValidation="false" Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="HiperPatagonico1.Usuarios" %>
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
   <script lang="JavaScript">
       function validar_rut(source, arguments) {
           var rut = arguments.Value; suma = 0; mul = 2; i = 0;

           for (i = rut.length - 3; i >= 0; i--) {
               suma = suma + parseInt(rut.charAt(i)) * mul;
               mul = mul == 7 ? 2 : mul + 1;
           }

           var dvr = '' + (11 - suma % 11);
           if (dvr == '10') dvr = 'K'; else if (dvr == '11') dvr = '0';

           if (rut.charAt(rut.length - 2) != "-" || rut.charAt(rut.length - 1).toUpperCase() != dvr)
               arguments.IsValid = false;
           else
               arguments.IsValid = true;
       }
</script>
                                

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" >
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
          <div class="row" >
                    <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelRUT" class="control-label" runat="server" Text="RUT (con guión)"></asp:Label>
                            <asp:TextBox id="rutTxt" runat="server" Columns="20" MaxLength="10" class="form-control" Placeholder="Ingrese Rut" required autocomplete="off"/>

                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombreTxt" class="form-control" name="nombreTxt" runat="server" placeholder="Ingrese nombre..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellidoTxt" class="form-control" name="apellidoTxt" runat="server" placeholder="Ingrese apellido..." Width="300px" required autocomplete="off"></asp:TextBox>
                    </div>
              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelPass" class="control-label" runat="server" Text="Contraseña"></asp:Label>
                            <asp:TextBox ID="contraseñaTxt" type="password" class="form-control" name="contraseñaTxt" runat="server" placeholder="Ingrese contraseña..." required Width="300px"></asp:TextBox>
                    </div>
              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>
                            <asp:DropDownList ID="DropDownCargo" runat="server" class="form-control" style="width:300px" required>
                                <asp:ListItem value="" selected disabled hidden>Seleccione Cargo</asp:ListItem>
                                <asp:ListItem value="Supervisor">Supervisor</asp:ListItem>
                                <asp:ListItem value="Secretaría">Secretaría</asp:ListItem>
                                <asp:ListItem value="Empleado">Empleado</asp:ListItem>
                            </asp:DropDownList>
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
            <br /><asp:CustomValidator id="cv_rut" runat="server" ForeColor="red" ControlToValidate="rutTxt" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />
          <asp:Button ID="ButtonAgregar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonAgregar_Click" />
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
                                <th class="text-center">RUT</th>
                                <th class="text-center">Nombre</th>                               
                                <th class="text-center">Apellido</th>
                                <th class="text-center">Cargo</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterUsuarios" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                                <ItemTemplate>
                                   <tr>
                                       <td><asp:Label ID="Label_id" runat="server" Text='<%#Eval("Id_usuario") %>'/></td>
                                       <td><%# Eval("rut")%></td>
                                       <td><%# Eval("nombre")%></td>
                                       <td><%# Eval("apellido")%></td>
                                       <td><%# Eval("rol")%></td>
                                       <td>
                                           <asp:linkbutton ID="Linkbutton1" class="btn btn-warning btn-sm" commandname="Update"
                                               runat="server" text="Editar"  
                                               CommandArgument='<%#Eval("Id_usuario")%>' />
                                           <asp:linkbutton ID="Linkbutton2" class="btn btn-danger btn-sm" commandname="Destroy"
                                               runat="server" text="Eliminar"  
                                               CommandArgument='<%#Eval("Id_usuario")%>' />

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

