using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;
namespace HiperPatagonico1.Crud_empleados
{
    public partial class EditarEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Empleado_BO empleadoBO = new Empleado_BO();
                Empleado empleado = new Empleado();
                int id = Int32.Parse((string)Session["emp"]);
                empleado = empleadoBO.Buscar(id);
                nombre.Text = empleado.nombre.ToString();
                apellido.Text = empleado.apellido.ToString();
            }
        }

        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {
            Empleado_BO empleadoBO = new Empleado_BO();
            Empleado empleado = new Empleado();
            String sw = "";
            try
            {
                empleado.Id_empleado = Int32.Parse((string)Session["emp"]);
                empleado.nombre = this.nombre.Text.Trim();
                empleado.apellido = this.apellido.Text.Trim();

                empleadoBO.Modificar(empleado);

                Response.Redirect("~/Empleados.aspx");
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            LabelErr.Text = sw;
        }
    }
}