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
    public partial class Horario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpleadoTurno_BO relacion = new EmpleadoTurno_BO();
            RepeaterEmp.DataSource = relacion.Listar();
            RepeaterEmp.DataBind();
        }
    }
}