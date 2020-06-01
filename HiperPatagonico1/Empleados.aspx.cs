using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiperPatagonico1
{
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Crud_empleados/EditarEmpleado.aspx");
        }
    }
}