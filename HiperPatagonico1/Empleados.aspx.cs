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
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado_BO empleado = new Empleado_BO();
            RepeaterEmplados.DataSource = empleado.Listar();
            RepeaterEmplados.DataBind();
        }
        Empleado_BO empleadoBO = new Empleado_BO();

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            string sw;
            try
            {
                Empleado u = new Empleado();
                if (u.nombre == "" || u.apellido == "")
                {
                    sw = "Complete todos los campos!";
                }
                else
                {
                    u.nombre = this.nombre.Text;
                    u.apellido = this.apellido.Text;

                    

                    //LabelMsg.Text = u.Horario.Id_horario.ToString();

                    try
                    {
                        empleadoBO.Ingresar(u);
                        this.nombre.Text = "";
                        this.apellido.Text = "";
                        sw = "Empleado Ingresado";
                        Response.Redirect("~/Empleados.aspx");
                    }
                    catch (Exception ex)
                    {
                        sw = ex.Message;
                        LabelMsg.Text = sw;
                        Response.Redirect("~/Empleados.aspx");
                    }
                    
                }

                //LabelMsg.Text = sw;
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

                Session["emp"] = id;

                Response.Redirect("~/Crud_empleados/EditarEmpleado.aspx?id=" + id);

            }
            if (e.CommandName == "Destroy")
            {

                int id = Int32.Parse(Convert.ToString(e.CommandArgument));
                Empleado_BO EmpleadoBO = new Empleado_BO();
                EmpleadoBO.Eliminar(id);

                Response.Redirect("~/Empleados.aspx");

            }
        }

    }
}