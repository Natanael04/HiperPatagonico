using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;

namespace HiperPatagonico1.Crud_turnos
{
    public partial class EditarTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Turno_BO turno_bo = new Turno_BO();
                Turno turno = new Turno();
                int id = Int32.Parse((string)Session["user"]);
                turno = turno_bo.Buscar(id);
                codigoTxt.Text = turno.codigo.ToString();
                inicioTxt.Text = turno.horaInicio.ToString();
                terminoTxt.Text = turno.horaInicio.ToString();
            }

        }
        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {
            Turno_BO Turno_BO = new Turno_BO();
            Turno turno = new Turno();
            String sw = "";
            try
            {
                turno.Id_turno = Int32.Parse((string)Session["user"]);
                turno.codigo = this.codigoTxt.Text.Trim();
                turno.horaInicio = this.inicioTxt.Text.Trim();
                turno.horaTermino = this.terminoTxt.Text.Trim();

                Turno_BO.Modificar(turno);

                Response.Redirect("~/Turnos.aspx");
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            LabelErr.Text = sw;
        }
    }
}