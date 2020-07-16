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
            RepeaterEmpleados.DataSource = empleado.Listar();
            RepeaterEmpleados.DataBind();

            Turno_BO turno = new Turno_BO();
            RepeaterTurnos.DataSource = turno.Listar();
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

        protected void ListarDropEmpleados(object sender, RepeaterItemEventArgs e)
        {

            DropDownList selectList = e.Item.FindControl("selectEmpleadoDrop") as DropDownList;
            if (selectList != null)
            {
                Empleado_BO empleado = new Empleado_BO();
                selectList.DataSource = empleado.Listar(); //your datasource
                selectList.DataBind();

                selectList.DataTextField = "nombre";
                selectList.DataValueField = "Id_empleado";
            }


            //Empleado_BO empleado = new Empleado_BO();

            ////var customerInfo = (CustomerInfo)e.Item.DataItem;
            ////if (customerInfo == null) return;
            //var selectEmpleadoDrop = (DropDownList)e.Item.FindControl("selectEmpleadoDrop");
            //selectEmpleadoDrop.DataSource = empleado.Listar();
            //selectEmpleadoDrop.DataBind();
        }
    }
}