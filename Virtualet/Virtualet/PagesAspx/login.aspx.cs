using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.ToString();
            string senha = txtSenha.Text.ToString();

            if(usuario == "admin" && senha == "123")
            {
                lblMsg.Text = "deu bom";
            }
            else
            {
                lblMsg.Text = "deu ruim otario";
            }
        }
    }
}