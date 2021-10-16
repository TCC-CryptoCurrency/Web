using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Virtualet.PagesAspx
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.ToString();
            string senha = txtSenha.Text.ToString();

            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("select * from Usuario where Nome = '" + usuario + "' and Senha = '" + senha + "'");

            if (dt.Rows.Count > 0)
            {
                Session["login"] = 1;
                Session["IdUsuario"] = dt.Rows[0]["idCarteira"].ToString();
                Response.Redirect("homeusuario.aspx");
            }
            else
            {
                lblMsg.Text = "Usuário ou senha incorretos";
            }
        }
    }
}