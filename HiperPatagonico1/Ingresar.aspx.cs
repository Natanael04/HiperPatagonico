using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace HiperPatagonico1
{
    public partial class Ingresar : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-7FO13N5P\SQLEXPRESS;Initial Catalog=control_clientes;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Visible = false;
        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {
            if (txtRut.Text == "")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Complete el campo RUT";
            }
            else
            {
                lblMensaje.Text = "";
            }
            if (txtPass.Text == "")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Ingrese contraseña";
            }
            else
            {
                lblMensaje.Text = "";
            }
            if (lblMensaje.Text == "")
            {
                string rut = this.txtRut.Text.Replace(";", "").Replace("--", "");
                string contrasena = this.txtPass.Text.Replace(";", "").Replace("--", "");

                SqlCommand cmd = new SqlCommand("Select * From Usuario where rut='" + rut + "'", con);

                con.Open();
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (rut == dr[1].ToString() && contrasena == dr[4].ToString())
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Credenciales incorrectas verifique Usuario y Contraseña por favor.";
                    }
                }
                dr.Close();
            }

        }

    }

}