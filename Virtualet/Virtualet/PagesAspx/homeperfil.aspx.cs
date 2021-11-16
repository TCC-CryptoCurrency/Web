using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class homeperfil : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || (int)Session["login"] != 1)
            {
                Response.Redirect("login.aspx");
            }

            /* Preciso dar um jeito de fazer com que os dados apareçam na text box */

            con = new ClasseConexao();
            dt = new DataTable();

            /* String Nome = txtNome.Text;
            String Email = txtEmail.Text;
            DateTime Nasc = DateTime.ParseExact(txtDataNasc.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            String CPF = txtCPF.Text;
            String Senha = txtSenha.Text;

            SqlCommand cmd = new SqlCommand("SELECT Nome, Email, DataNasc, CPF, Senha VALUES (@nome, @email, @nasc, @cpf, @senha) WHERE idCarteira = " + Session["IdUsuario"].ToString());
            cmd.Parameters.Add("@nome", SqlDbType.NVarChar, 30).Value = Nome;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 30).Value = Email;
            cmd.Parameters.Add("@nasc", SqlDbType.Date, 3).Value = Nasc;
            cmd.Parameters.Add("@cpf", SqlDbType.NVarChar, 11).Value = CPF;
            cmd.Parameters.Add("@senha", SqlDbType.NVarChar, 24).Value = Senha; */
        } 
    }
}