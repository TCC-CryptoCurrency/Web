using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastra_Click(object sender, EventArgs e)
        {
            string confirma, senha;
            confirma = txtConfirma.Text;
            senha = txtSenha.Text;

            if (ckbTermos.Checked)
            {
                if (senha == confirma)
                {
                    lblErro.Text = "deu bom";
                }
                else
                {
                    lblErro.Text = "As senhas não são iguais";
                }
            }
            else
            {
                lblErro.Text = "Por favor, aceite os termos e condições de uso";
            }
        }
    }
}