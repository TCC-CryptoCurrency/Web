using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebGrease.Css.Ast.Selectors;

namespace Virtualet.PagesAspx
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable datat;
        
        private DataView Gerardados()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            con = new ClasseConexao();

            dt.Columns.Add(new DataColumn("idMoeda", typeof(Int32)));
            dt.Columns.Add(new DataColumn("NomeMoeda", typeof(String)));
            dt.Columns.Add(new DataColumn("ValorMoeda", typeof(double)));
            dt.Columns.Add(new DataColumn("Valor24h", typeof(double)));
            dt.Columns.Add(new DataColumn("UltimaAtualizacao", typeof(String)));
            dt.Columns.Add(new DataColumn("VariacaoMoeda", typeof(double)));

            datat = con.executarSQL("exec usp_selecionar_tabelaIndex");
            DataRow[] row = datat.Select();

            for (int i = 0; i < 10; i++)
            {
                dr = dt.NewRow();

                dr[0] = row[i]["idMoeda"];
                dr[1] = row[i]["NomeMoeda"];
                dr[2] = row[i]["ValorMoeda"];
                dr[3] = row[i]["ValorData"];
                dr[4] = row[i]["DataRegistro"];
                dr[5] = Math.Round(((Double.Parse(dr[2].ToString()) - Double.Parse(dr[3].ToString())) / Double.Parse(dr[3].ToString())) * 100 , 2);

                dt.Rows.Add(dr);
            }




            DataView dv = new DataView(dt);
            return dv;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DtCripto.DataSource = Gerardados();
                DtCripto.DataBind();
            }
        }

        protected void DtCripto_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label label = e.Item.FindControl("varia") as Label;
                if (label.Text.Contains("-"))
                {
                    label.CssClass = "neg";
                }
                else
                {
                    label.Text = "+" + label.Text.ToString();
                }
            }
        }

        protected void btnFazerLogin_Click(object sender, EventArgs e)
        {
                Response.Redirect("login.aspx");
        }
    }
}