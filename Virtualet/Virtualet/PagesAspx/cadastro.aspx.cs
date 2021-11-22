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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastra_Click(object sender, EventArgs e)
        {
            try
            {

                ClasseConexao con = new ClasseConexao();
                String Nome = txtNome.Text;
                String Email = txtEmail.Text;
                DateTime Nasc = DateTime.ParseExact(txtNascimento.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                String CPF = txtCPF.Text;
                String Senha = txtSenha.Text;
                String Confirma = txtConfirma.Text;


                if (ckbTermos.Checked && txtConfirma.Text == txtSenha.Text)
                {
                    if (txtCPF.Text.Length >= 11) {
                        SqlCommand cmd = new SqlCommand("INSERT INTO Usuario VALUES (@nome, @email, @nasc, @cpf, @senha)");
                        cmd.Parameters.Add("@nome", SqlDbType.NVarChar, 30).Value = Nome;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 30).Value = Email;
                        cmd.Parameters.Add("@nasc", SqlDbType.Date, 3).Value = Nasc;
                        cmd.Parameters.Add("@cpf", SqlDbType.NVarChar, 15).Value = CPF;
                        cmd.Parameters.Add("@senha", SqlDbType.NVarChar, 24).Value = Senha;
                        int x = con.manutencaoDB_Parametros(cmd);
                        if (x > 0)
                        {
                            Response.Write("<script>alert('Cadastro feito com sucesso')</script>");
                            Server.Transfer("login.aspx");
                        }
                        else
                        {
                            lblErro.Text = "Falha no cadastro, por favor verifique novamente seus dados";
                        }
                    }
                    else
                    {
                        lblErro.Text = "falha no cadastro, por favor verifique novamente seus dados";
                    }
                }
                else
                {
                    lblErro.Text = "Por favor, aceite os termos de uso";
                }
            }
            catch (Exception) {
                lblErro.Text = "Falha no cadastro, por favor verifique novamente seus dados";
            }
        }
    }
}