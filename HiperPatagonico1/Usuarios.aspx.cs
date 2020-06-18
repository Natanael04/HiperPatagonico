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
    public partial class Usuarios : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-7FO13N5P\SQLEXPRESS;Initial Catalog=control_horarios;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                    SqlCommand cmd = new SqlCommand("Select * From Usuario", con);
                    con.Open();

                    cmd.CommandType = CommandType.Text;
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        rutTxt.Text = dr[1].ToString();//test para select
                        //textBox2.Text = dr[1].ToString();
                        //textBox3.Text = dr[2].ToString();
                    }
                    dr.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Text = ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        protected void ButtonEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Crud_usuarios/EditarUsuario.aspx");
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (rutTxt.Text == "" || nombreTxt.Text == "" || apellidoTxt.Text == "" || contrasenaTxt.Text == "" || DropDownListCargo.Text == "")
                {
                    MessageBox.Text = "Debe Llenar todos los campos";
                }
                else
                {
                    SqlCommand cmdinsert = new SqlCommand("Insert into Usuario (rut, nombre, apellido, contrasena, cargo) values( ' " + rutTxt.Text + " ','" + nombreTxt.Text + "','" + apellidoTxt.Text + "','" + contrasenaTxt.Text + "','" + DropDownListCargo.Text + "' )", con);
                    con.Open();
                    cmdinsert.CommandType = CommandType.Text;
                    cmdinsert.ExecuteNonQuery();
                    Response.Redirect("~/Usuarios.aspx");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Text = ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}