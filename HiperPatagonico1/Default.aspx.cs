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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioLog = new Usuario();
            usuarioLog = (Usuario)Session["Usuario"];
            LabelNombreUsuario.Text = usuarioLog.nombre;
            LabelApellidoUsuario.Text = usuarioLog.apellido;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }
    }
}