using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiperPatagonico1
{
    public partial class Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int horasTotales = 0;
            int horaInicio = 800;
            int horaTermino = 1800;
            int colacion = 100;
            String horasTotalesTxt = "";

            horasTotales = horaTermino - horaInicio - colacion;
            horasTotalesTxt = horasTotales.ToString().Insert(1,":");

            LabelHoras.Text = horasTotalesTxt; 
        }

        protected void ButtonEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Crud_turnos/EditarTurno.aspx");
        }
    }
}