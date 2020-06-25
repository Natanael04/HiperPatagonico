using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;
namespace HiperPatagonico1.Crud_usuarios
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Usuario_BO userBO = new Usuario_BO();
                Usuario usuario = new Usuario();
                int id = Int32.Parse((string)Session["user"]);
                usuario = userBO.Buscar(id);
                rutTxt.Text = usuario.rut.ToString();
                nombreTxt.Text = usuario.nombre.ToString();
                apellidoTxt.Text = usuario.apellido.ToString();
                contrasenaTxt.Text = usuario.contraseña.ToString();
                DropDownCargo.SelectedValue = usuario.rol;
            }
            
        }

        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {
            Usuario_BO userBO = new Usuario_BO();
            Usuario usuario = new Usuario();
            String sw  = "";
            try
            {
                usuario.Id_usuario = Int32.Parse((string)Session["user"]);
                usuario.rut = this.rutTxt.Text.Trim();
                usuario.nombre = this.nombreTxt.Text.Trim();
                usuario.apellido = this.apellidoTxt.Text.Trim();
                usuario.contraseña = this.contrasenaTxt.Text.Trim();
                usuario.rol = DropDownCargo.Text;

                userBO.Modificar(usuario);

                Response.Redirect("~/Usuarios.aspx");
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            LabelErr.Text = sw;
        }
    }
}