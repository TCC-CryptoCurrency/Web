using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace Virtualet.PagesAspx
{
    public partial class homenoticias : System.Web.UI.Page
    {
        ClasseConexao con;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || (int)Session["login"] != 1)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                dlFeed.DataSource = BindData("Todas");
                dlFeed.DataBind();

                rpTags.DataSource = GerarTags();
                rpTags.DataBind();
            }

        }
        protected DataView BindData(String tag)
        {
            con = new ClasseConexao();
            dt = new DataTable();
            if (tag == "Todas")
            {
                dt = con.executarSQL("exec usp_selecionar_noticiaUsuario " + Session["IdUsuario"]);
            }
            else
            {
                dt = con.executarSQL("exec usp_selecionarnoticiaTag '" + tag + "'");
            }

            DataView dv = new DataView(dt);
            return dv;
        }

        protected ArrayList GerarTags()
        {
            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("exec usp_selecionarTagsIdUsuario 1");

            ArrayList Al = new ArrayList();
            DataRow[] dataRows = dt.Select();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Al.Add(new Tags(dataRows[i]["NomeTag"].ToString(), i));
            }

            return Al;
        }

        protected ArrayList GerarTagsInteresse()
        {
            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("Select idTags, NomeTag from tags where NomeTag like '%" + txtTagSearch.Text + "%' and idTags not in (select idTags from Interesse where idUsuario = " + Session["IdUsuario"] + ")");

            ArrayList Al = new ArrayList();
            DataRow[] dataRows = dt.Select();

            for(int i = 0; i < dt.Rows.Count; i++)
            {
                Al.Add(new Tags(dataRows[i]["NomeTag"].ToString(), i));
            }

            return Al;
        }

        public class Tags
        {
            private string tag;
            private int id;

            public Tags(string tag, int id)
            {
                this.tag = tag;
                this.id = id;
            }

            public String Tag
            {
                get
                {
                    return tag;
                }
            }

            public int ID
            {
                get
                {
                    return id;
                }
            }
        }

        protected void rpTags_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            con = new ClasseConexao();
            dt = new DataTable();

            dlFeed.DataSource = BindData(((Button)e.CommandSource).Text);
            dlFeed.DataBind();
        }

        protected void btnAllTags_Click(object sender, EventArgs e)
        {

        }

        protected void RepeaterInteresse_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            con = new ClasseConexao();
            dt = new DataTable();

            dt = con.executarSQL("select * from Tags where NomeTag = '" + ((Button)e.CommandSource).Text + "'");
            DataRow[] dataRow = dt.Select();

            con = new ClasseConexao();

            SqlCommand cmd = new SqlCommand("INSERT INTO Interesse VALUES(" + Session["IdUsuario"] + "," + dataRow[0]["idTags"] + ")");
            int x = con.manutencaoDB_Parametros(cmd);
            if (x > 0)
            {
                rpTags.DataSource = GerarTags();
                rpTags.DataBind();

                RepeaterInteresse.DataSource = GerarTagsInteresse();
                RepeaterInteresse.DataBind();

                dlFeed.DataSource = BindData(((Button)e.CommandSource).Text);
                dlFeed.DataBind();
            }
            else
            {
                Response.Write("ERRO");
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            RepeaterInteresse.DataSource = GerarTagsInteresse();
            RepeaterInteresse.DataBind();
        }
    }
}