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

            dt = con.executarSQL("select * from Usuario where idCarteira = " + Session["idUsuario"]);

            DataRow[] dr = dt.Select();

            lblNomeEdit.Text = dr[0]["Nome"].ToString();
            lblEmailEdit.Text = dr[0]["Email"].ToString();
            lblDataEdit.Text = dr[0]["DataNasc"].ToString().Substring(0, 10);
            lblCPFEdit.Text = dr[0]["CPF"].ToString();

            string senha = "";
            for (int i = 0; i < dr[0]["Senha"].ToString().Length; i++)
            {
                senha += "*";
            }

            lblSenhaEdit.Text = senha;
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            btnAlterar.CssClass += " hide";
            btnSalvar.CssClass = btnSalvar.CssClass.Replace("hide", "").Trim();
            btnCancelar.CssClass = btnCancelar.CssClass.Replace("hide", "").Trim();

            lblNomeEdit.CssClass += " hide";
            lblDataEdit.CssClass += " hide";
            lblEmailEdit.CssClass += " hide";
            lblCPFEdit.CssClass += " hide";
            lblSenhaEdit.CssClass += " hide";

            txtNomeEdit.CssClass = txtNomeEdit.CssClass.Replace("hide", "").Trim();
            txtEmailEdit.CssClass = txtEmailEdit.CssClass.Replace("hide", "").Trim();
            txtDataEdit.CssClass = txtDataEdit.CssClass.Replace("hide", "").Trim();
            txtCPFEdit.CssClass = txtCPFEdit.CssClass.Replace("hide", "").Trim();
            txtSenhaEdit.CssClass = txtSenhaEdit.CssClass.Replace("hide", "").Trim();

            txtNomeEdit.Text = lblNomeEdit.Text;
            txtEmailEdit.Text = lblEmailEdit.Text;
            txtDataEdit.Text = lblDataEdit.Text;
            txtCPFEdit.Text = lblCPFEdit.Text;
            txtSenhaEdit.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            btnAlterar.CssClass = btnAlterar.CssClass.Replace("hide", "").Trim();
            btnCancelar.CssClass += " hide";
            btnSalvar.CssClass += " hide";

            txtNomeEdit.CssClass += " hide";
            txtEmailEdit.CssClass += " hide";
            txtDataEdit.CssClass += " hide";
            txtCPFEdit.CssClass += " hide";
            txtSenhaEdit.CssClass += " hide";

            lblCPFEdit.CssClass = lblCPFEdit.CssClass.Replace("hide", "").Trim();
            lblDataEdit.CssClass = lblDataEdit.CssClass.Replace("hide", "").Trim();
            lblEmailEdit.CssClass = lblEmailEdit.CssClass.Replace("hide", "").Trim();
            lblNomeEdit.CssClass = lblNomeEdit.CssClass.Replace("hide", "").Trim();
            lblSenhaEdit.CssClass = lblSenhaEdit.CssClass.Replace("hide", "").Trim();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                dt = new DataTable();
                con = new ClasseConexao();
                string Nome = txtNomeEdit.Text;
                string Email = txtEmailEdit.Text;
                DateTime Nasc = DateTime.ParseExact(txtDataEdit.Text, "dd/mm/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                string CPF = txtCPFEdit.Text;
                string Senha = txtSenhaEdit.Text;
                if (Nome.Length > 0 && Email.Length > 0 && Senha.Length > 0) {
                    SqlCommand cmd = new SqlCommand("UPDATE Usuario set Nome = @nome, Email = @email, DataNasc = @nasc, CPF = @cpf, Senha = @senha where idCarteira = " + Session["idUsuario"]);
                    cmd.Parameters.Add("@nome", SqlDbType.NVarChar, 30).Value = Nome;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 30).Value = Email;
                    cmd.Parameters.Add("@nasc", SqlDbType.Date, 3).Value = Nasc;
                    cmd.Parameters.Add("@cpf", SqlDbType.NVarChar, 15).Value = CPF;
                    cmd.Parameters.Add("@senha", SqlDbType.NVarChar, 24).Value = Senha;
                    int x = con.manutencaoDB_Parametros(cmd);
                    if (x > 0)
                    {
                        Response.Redirect("homeperfil.aspx");
                        Response.Write("<script> alert('Dados alterados com Sucesso') </script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Algo deu errado tente novamente mais tarde')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Algo deu errado tente novamente mais tarde')</script>");
                }

            }
            catch (Exception)
            {
                Response.Write("<script>alert('Algo deu errado tente novamente mais tarde')</script>");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["login"] = null;
            Response.Redirect("index.aspx");
        }
    }
}