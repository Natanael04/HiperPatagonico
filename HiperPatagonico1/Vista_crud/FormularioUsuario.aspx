<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="HiperPatagonico1.Vista_crud.FormularioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

   
    <div class="jumbotron">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="mx-auto">Ingreso nuevo usuario</h2>
                    
                </div>
                <div class="col-md-4">
                <img src="../img/Logo_hiper.png" alt="" style="width: 270px; height: 82px">
                    </div>
            </div>
    </div>
    <div class="row">
        <div class="col-sm-5 p-3 mb-2 bg-secondary text-white">
            <div class="card text-center">
                    <img src="../img/banner.jpg" alt="" style="width: 266px; height: 247px">
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="LabelRUT" class="control-label" runat="server" Text="RUT"></asp:Label>
                            <asp:TextBox ID="rut" class="form-control" name="rut" runat="server" placeholder="Ingrese RUT..."></asp:TextBox>
                        </div>    
                        
                        <div class="form-group">
                            <asp:Label ID="LabelNombre" class="control-label" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="nombre" class="form-control" name="nombre" runat="server" placeholder="Ingrese nombre..."></asp:TextBox>
                        </div>   

                        <div class="form-group">
                            <asp:Label ID="LabelApellido" class="control-label" runat="server" Text="Apellido"></asp:Label>
                            <asp:TextBox ID="apellido" class="form-control" name="apellido" runat="server" placeholder="Ingrese apellido..."></asp:TextBox>
                        </div>   

                        <div class="form-group">
                            <asp:Label ID="LabelCargo" runat="server" Text="Cargo"></asp:Label>

                            <select class="form-control" id="cargo">
                                <option value="" selected disabled hidden>Seleccione Cargo</option>
                                <option value="supervisor">Surpervisor</option>
                                <option value="secretaria">Secretaría</option>
                            </select>                    
                        </div>

                        <div class="form-group text-right">
                            <asp:Button ID="ingresar" CssClass="btn btn-primary" type="submit" runat="server" Text="Ingresar" />
                        </div>     
    
                    </form>

                </div>
            </div>
        </div>
    </div>
         </div>
</asp:Content>
