using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class homenoticias : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            dt = con.executarSQL("");

        }
    }
}