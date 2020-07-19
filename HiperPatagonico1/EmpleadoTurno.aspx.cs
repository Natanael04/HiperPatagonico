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
    public partial class EmpleadoTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpleadoTurno_BO relacion = new EmpleadoTurno_BO();
            RepeaterUsuarios.DataSource = relacion.Listar();
            RepeaterUsuarios.DataBind();

            Empleado_BO empleado = new Empleado_BO();
            RepeaterEmpleados.DataSource = empleado.ListaFiltrada();
            RepeaterEmpleados.DataBind();

            Turno_BO turno = new Turno_BO();
            RepeaterTurnos.DataSource = turno.ListaFiltrada();
            RepeaterTurnos.DataBind();
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            EmpleadoTurno_BO relacion = new EmpleadoTurno_BO();
            int idEmpleado = Convert.ToInt32(Request.Form["selectEmpleado"]);
            int idTurno = Convert.ToInt32(Request.Form["selectTurno"]);


            relacion.Ingresar(idEmpleado,idTurno);

            Response.Redirect("~/EmpleadoTurno.aspx");

        }
        protected void RepeaterUsuarios_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Destroy")
            {

                int id = Int32.Parse(Convert.ToString(e.CommandArgument));
                EmpleadoTurno_BO relacion = new EmpleadoTurno_BO();
                relacion.Eliminar(id);

                Response.Redirect("~/EmpleadoTurno.aspx");

            }
        }
    }
}