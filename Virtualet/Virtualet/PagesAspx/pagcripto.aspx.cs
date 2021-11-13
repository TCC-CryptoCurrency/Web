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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idMoeda"] == null)
            {
                Response.Redirect("homeusuario.aspx");
            }
            dt = new DataTable();
            con = new ClasseConexao();

            dt = con.executarSQL("select * from Moeda where idMoeda = " + (int)Session["idMoeda"]);
            DataRow[] dr = dt.Select();
            idMoeda = int.Parse(dr[0][idMoeda].ToString());

            //Se vc quiser colocar qualquer dado da moeda é só colocar dr[0][nomedocampo], não esquece que isso é um objeto ent é possível que você precise de 
            //alguns .toString() ou de uns int.Parse(), igual o que tem na linha 31


            LoadDataLineChart();
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
        
    }
}