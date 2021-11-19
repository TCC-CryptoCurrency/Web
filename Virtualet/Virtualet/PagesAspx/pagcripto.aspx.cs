using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class pagcripto : System.Web.UI.Page
    {
        public string lineData;
        public string DataRegi;
        public int idMoeda;
        ClasseConexao con;
        DataTable dt;
        DataTable dtbl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idMoeda"] == null)
            {
                Response.Redirect("homeusuario.aspx");
            }
            dt = new DataTable();
            con = new ClasseConexao();

            dt = con.executarSQL("select * from Moeda where NomeMoeda = '" + (string)Session["idMoeda"] + "'");
            DataRow[] dr = dt.Select();
            idMoeda = int.Parse(dr[0][idMoeda].ToString());

            //Se vc quiser colocar qualquer dado da moeda é só colocar dr[0][nomedocampo], não esquece que isso é um objeto ent é possível que você precise de 
            //alguns .toString() ou de uns int.Parse(), igual o que tem na linha 31

            dtbl = new DataTable();
            dtbl = con.executarSQL("select DataRegistro, ValorData from HistoricoMoeda where NomeMoeda = '" + (string)Session["idMoeda"] + "'");

            gvCripto.DataSource = dtbl;
            gvCripto.DataBind();

            LoadDataLineChart();
            DadosMoeda();
        }

        public void LoadDataLineChart()
        {
            dt = new DataTable();
            con = new ClasseConexao();

            dt = con.executarSQL("SELECT DataRegistro, ValorData FROM HistoricoMoeda WHERE idMoeda = " + idMoeda + " ORDER BY DataRegistro");

            lineData = "[";
            DataRegi = "[";
            foreach(DataRow dr in dt.Rows)
            {
                DataRegi += "'" + dr["DataRegistro"].ToString().Substring(0, 10) + "',";
                lineData += "['" + dr["DataRegistro"].ToString().Substring(0,10) + "'," + Double.Parse(dr["ValorData"].ToString().Replace(",",".")) + "/10000],";
            }
            lineData = lineData.Remove(lineData.Length - 1) + ']';
            DataRegi = DataRegi + ']';
        }
        
        public void DadosMoeda()
        {
            
            dt = new DataTable();
            con = new ClasseConexao();

            dt = con.executarSQL("select * from Moeda where idMoeda = " + idMoeda);

            DataRow[] dr = dt.Select();

            String nome = dr[0]["NomeMoeda"].ToString();
            lblMoeda.Text = nome;

            double valor = double.Parse(dr[0]["ValorMoeda"].ToString());
            lblValor.Text = "R$" + valor;

            string data = dr[0]["DataAtualizacao"].ToString().Substring(0,10);
            lblDataAtt.Text = data;
           

            /*agora só tem que fazer mostrar o resto, tenta usar isso pra fazer a página de perfil
            double valor = (double)dr[0]["ValorMoeda"];
            lblValor.Text = valor.ToString();
            */

        }

        /* Não tá funfando
        protected void btnStar_Click(object sender, EventArgs e)
        {
            con = new ClasseConexao();
            dt = new DataTable();
            //Essa parte checa se o usuario já tem interesse ou n
            dt = con.executarSQL("select * from DetalheCarteira where idCarteira = " Session["idUsuario"] + "and idMoeda = " + idMoeda)
            //O idMoeda deve funcionar normalmente desse jeito, não tenho certeza (se você colocar esse codigo dentro do pagCripto)
            if (dt.Rows.Count > 0)
            {
                //se ele achou pelo menos 1 coluna, quer dizer que a pessoa já marcou interesse (ent precisa desmarcar/impedir)
                DataRow[] dr = dt.Select();
                if (Int.Parse(dr[0][Saldo].toString()) != 0)
                {
                    Response.Write("<script>alert('Você não pode desmarcar interesse quando possuir saldo na moeda')</script>");
                }
                else
                {
                    con = new ClasseConexao();
                    int x = con.manutencaoDB_Parametros("delete from DetalheCarteira where idCarteira = " + Session["idUsuario"] + " and idMoeda = " + idMoeda)
                    Response.Write("<script>alert('Interesse desmarcado com sucesso')</script>");
                }
            }
            else
            {
                con = new ClasseConexao();
                int x = con.manutencaoDB_Parametros("insert into DetalheCarteira(Saldo, idCarteira, idMoeda) Values (0," + Session["idUsuario"] + "," + idMoeda + ")")
                //ou qualquer coisa que faça insert no bd, mas eu acho que é assim que funciona
            }
        }
        */

    }
}