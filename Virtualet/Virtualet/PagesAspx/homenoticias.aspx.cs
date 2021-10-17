using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Virtualet.PagesAspx
{
    public partial class homenoticias : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dlFeed.DataSource = BindData();
                dlFeed.DataBind();
            }

        }
        protected DataView BindData()
        {
            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("Select * FROM Noticia");

            DataView dv = new DataView(dt);
            return dv;
        }
    }
}