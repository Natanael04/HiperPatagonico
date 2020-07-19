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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario_BO usuario = new Usuario_BO();
            RepeaterUsuarios.DataSource = usuario.Listar();
            RepeaterUsuarios.DataBind();
        }
            Usuario_BO userBO = new Usuario_BO();
        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            string sw;
            try
            {
                Usuario u = new Usuario();
                if (u.rut == "" || u.nombre == "" || u.apellido == "" || u.rol == "" || u.contraseña == "")
                {
                    sw = "Complete todos los campos!";
                }
                else
                {
                    u.rut = this.rutTxt.Text.Trim();
                    u.nombre = this.nombreTxt.Text.Trim();
                    u.apellido = this.apellidoTxt.Text.Trim();
                    u.rol = this.DropDownCargo.Text;
                    u.contraseña = this.contraseñaTxt.Text.Trim();
                    sw = userBO.Ingresar(u);
                    this.rutTxt.Text = ""; this.nombreTxt.Text = ""; this.apellidoTxt.Text = ""; this.contraseñaTxt.Text = "";
                    sw = "Usuario Ingresado"; DropDownCargo.SelectedItem.Text = "Seleccione Cargo";
                    Response.Redirect("~/Usuarios.aspx");
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

                Response.Redirect("~/Crud_usuarios/EditarUsuario.aspx?id=" + id);

            }
            if (e.CommandName == "Destroy")
            {

                int id = Int32.Parse(Convert.ToString(e.CommandArgument));
                Usuario_BO userBO = new Usuario_BO();
                userBO.Eliminar(id);

                Response.Redirect("~/Usuarios.aspx");

            }
        }

    }
}