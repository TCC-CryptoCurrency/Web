using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class homeusuario : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

//          ---------------------------------NÃO TOCA NISSO------------------------------
            if (Session["login"] == null || (int)Session["login"] != 1)
            {
                Response.Redirect("login.aspx");
            }
//          -----------------------------------------------------------------------------

            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("select Nome from Usuario where idCarteira = " + Session["IdUsuario"].ToString()); ;

            lblBemVindo.Text = "Bem vindo, " + dt.Rows[0]["Nome"] + "!";

        }

        protected void DtCripto_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}