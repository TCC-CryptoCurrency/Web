using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;

        protected DataView GerarDados()
        {
            dt = new DataTable();
            con = new ClasseConexao();
            DataTable datat = new DataTable();
            DataRow row;

            datat.Columns.Add(new DataColumn("idMoeda", typeof(Int32)));
            datat.Columns.Add(new DataColumn("NomeMoeda", typeof(String)));
            datat.Columns.Add(new DataColumn("ValorMoeda", typeof(double)));
            datat.Columns.Add(new DataColumn("Valor24h", typeof(double)));
            datat.Columns.Add(new DataColumn("UltimaAtualizacao", typeof(String)));
            datat.Columns.Add(new DataColumn("VariacaoMoeda", typeof(double)));
            datat.Columns.Add(new DataColumn("SaldoMoeda", typeof(double)));

            dt = con.executarSQL("exec usp_selecionar_moedaUsuario " + Session["IdUsuario"]);
            DataRow[] dr = dt.Select();

            for (int i = 0; i < dr.Length; i++)
            {
                row = datat.NewRow();

                row[0] = dr[i]["idMoeda"];
                row[1] = dr[i]["NomeMoeda"];
                row[2] = dr[i]["ValorMoeda"];
                row[3] = dr[i]["ValorData"];
                row[4] = dr[i]["DataRegistro"];
                row[5] = Math.Round(((Double.Parse(row[2].ToString()) - Double.Parse(row[3].ToString())) / Double.Parse(row[3].ToString())) * 100, 2);
                row[6] = dr[i]["Saldo"];

                datat.Rows.Add(row);
            }

            DataView dv = new DataView(datat);
            return dv;
        }

        protected void Item_Bound(Object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login"] == null || (int)Session["login"] != 1)
            {
                Response.Redirect("login.aspx");
            }

            DtCripto.DataSource = GerarDados();
            DtCripto.DataBind();
        }
    }
}