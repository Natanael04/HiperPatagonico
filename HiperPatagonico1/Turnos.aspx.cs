using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;

namespace HiperPatagonico1
{
    public partial class Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Turno_BO turno = new Turno_BO();
            RepeaterTurnos.DataSource = turno.Listar();
            RepeaterTurnos.DataBind();
        }
        Turno_BO turno_BO = new Turno_BO();
        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            string sw;
            try
            {
                Turno u = new Turno();
                if (u.codigo == "" || u.horaInicio == "" || u.horaTermino == "")
                {
                    sw = "Complete todos los campos!";
                }
                else
                {
                    u.codigo = this.codigoTxt.Text;
                    u.horaInicio = this.inicioTxt.Text;
                    u.horaTermino = this.terminoTxt.Text;
                    sw = turno_BO.Ingresar(u);
                    this.codigoTxt.Text = ""; this.inicioTxt.Text = ""; this.terminoTxt.Text = "";
                    sw = "Usuario Ingresado";
                    Response.Redirect("~/Turnos.aspx");
                }

                LabelMsg.Text = sw;
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }

        }
        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {

                string id = Convert.ToString(e.CommandArgument);

                Session["user"] = id;

                Response.Redirect("~/Crud_turnos/EditarTurno.aspx?id=" + id);

            }
            if (e.CommandName == "Destroy")
            {

                int id = Int32.Parse(Convert.ToString(e.CommandArgument));
                Turno_BO turno_BO = new Turno_BO();
                turno_BO.Eliminar(id);
                Response.Redirect("~/Turnos.aspx");

            }
        }
    }
}