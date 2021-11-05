using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Virtualet.PagesAspx
{
    public partial class homecripto : System.Web.UI.Page
    {
        public string lineData;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDataOfLineChart();
        }
        
        public void LoadDataOfLineChart()
        {
            /* Preciso achar um jeito de linkar com a classe conexão*/
            string strConnectionString = ConfigurationManager.ConnectionStrings["MyDBConnectStr"].ConnectionString; 
            SqlConnection myConnect = new SqlConnection(strConnectionString);

            myConnect.Open();
            string strCommandText = "SELECT DataRegistro, ValorData FROM HistoricoMoeda WHERE idMoeda = 1";
            SqlCommand com = new SqlCommand(strCommandText, myConnect);
            DataTable dt = new DataTable();
            dt.Load(com.ExecuteReader());

            gvChart.DataSource = dt;
            gvChart.DataBind();

            lineData = "[";
            foreach (DataRow dr in dt.Rows) {
                lineData += "[" + dr["DataRegistro"] + "," + dr["ValorData"] + "],";
            }
            lineData = lineData.Remove(lineData.Length - 1) + ']';
        }
    }
}