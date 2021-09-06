using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class tutorbasic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnProx.Attributes.Add("onclick", "javascript: ProxTutor()");
            btnVolta.Attributes.Add("occlick", "javascript: VoltaTutor()");
            btnGloss.Attributes.Add("occlick", "javascript: GlossTutor()");
        }
    }
}