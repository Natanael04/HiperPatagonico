﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiperPatagonico1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = (string)Session["usuario_id"];
            if (!IsPostBack)
            {
                if (userid == "" || userid == null)
                    Response.Redirect("~/Ingresar.aspx");
            }
        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}