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
        
        private DataView Gerardados()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            Random rnd = new Random();

            dt.Columns.Add(new DataColumn("idMoeda", typeof(Int32)));
            dt.Columns.Add(new DataColumn("NomeMoeda", typeof(String)));
            dt.Columns.Add(new DataColumn("ValorMoeda", typeof(double)));
            dt.Columns.Add(new DataColumn("VariacaoMoeda", typeof(double)));

            for (int i = 0; i < 10; i++)
            {
                dr = dt.NewRow();

                dr[0] = i;
                dr[1] = "MoedaTeste";
                dr[2] = 2.16 * i + 2.25;
                dr[3] = 1.14 * i * rnd.Next(-2,3);

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
                    label.ForeColor = System.Drawing.Color.FromArgb(194, 62, 52);
                }
                else
                {
                    label.Text = "+" + label.Text.ToString();
                }
            }
        }

        protected void btnFazerLogin_Click(object sender, EventArgs e)
        {

        }
    }
}