<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarTurno.aspx.cs" Inherits="HiperPatagonico1.Crud_turnos.EditarTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="row">
        <div class="col-sm-12">

    <div class="col-sm-5 col-sm-offset-3">
        <div style="background-color:#EAEAEA;margin-top:3%;border-radius:5px">
        <div class="modal-header">
          <div class="row" style="margin-left: 57px">
              <div class="col-md-5 " style="left: 0px; top: 0px; width: 271px">
                  <h3 class="modal-title">Editar Turno</h3>
              </div>
          </div>
      </div><br />
          <div class="row" >
                    <div class="col-md-5 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelCodigo" class="control-label" runat="server" Text="Codigo"></asp:Label>
                            <asp:TextBox ID="codigoTxt" class="form-control" name="codigo" runat="server" placeholder="Ingrese codigo..." Width="300px" required autocomplete="off"></asp:TextBox>
                        </div>
                        </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabelInicio" class="control-label" runat="server" Text="Inicio"></asp:Label>
                            <asp:TextBox ID="inicioTxt" class="form-control" name="inicio" type="time"  min="07:00" max="22:00" runat="server" placeholder="Ingrese hora inicio..." Width="300px" required autocomplete="off" ></asp:TextBox>
                        </div>

              </div>
              <div class="col-md-7 col-md-offset-1">
                        <div class="form-group" style="margin-left: 58px; width: 328px;">
                            <asp:Label ID="LabeTermino" class="control-label" runat="server" Text="Termino"></asp:Label>
                            <asp:TextBox ID="terminoTxt" class="form-control" name="termino" type="time"  min="07:00" max="22:00" runat="server" placeholder="Ingrese hora termino..." Width="300px" required autocomplete="off" ></asp:TextBox>
                    </div>
                  </div>
          </div>
            <div class="modal-footer">
          <asp:Button ID="ButtonGuardar" class="btn btn-primary" runat="server" Text="Guardar" OnClick="ButtonGuardar_Click" />
                </div>
            </div>
                <asp:Label ID="LabelErr" ForeColor="White" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>
    
</asp:Content>

