﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Virtualet.PagesAspx
{
    public partial class homecriptos : System.Web.UI.Page
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

            dt = con.executarSQL("exec usp_selecionar_tabelaIndex");
            DataRow[] dr = dt.Select();

            for (int i = 0; i < dr.Length; i++)
            {
                row = datat.NewRow();

                row[0] = dr[i]["idMoeda"];
                row[1] = dr[i]["NomeMoeda"];
                row[2] = dr[i]["ValorMoeda"];
                row[3] = dr[i]["ValorData"];
                row[4] = dr[i]["DataRegistro"].ToString().Substring(0, 10);
                row[5] = Math.Round(((Double.Parse(row[2].ToString()) - Double.Parse(row[3].ToString())) / Double.Parse(row[3].ToString())) * 100, 2);

                datat.Rows.Add(row);
            }

            DataView dv = new DataView(datat);
            return dv;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login"] == null || (int)Session["login"] != 1)
            {
                //Response.Redirect("login.aspx");
            }

            DtCripto.DataSource = GerarDados();
            DtCripto.DataBind();
        }

        protected void DtCripto_ItemDataBound(object sender, DataListItemEventArgs e)
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

        protected void DtCripto_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).CommandName == "sort")
            {
                string cmdArg = "";
                DataView view = new DataView();
                view = GerarDados();
                if (Session[((LinkButton)e.CommandSource).Text] != null)
                {
                    ((LinkButton)e.CommandSource).CommandArgument = (string)Session[((LinkButton)e.CommandSource).Text];
                }
                view.Sort = ((LinkButton)e.CommandSource).CommandArgument;

                if (((LinkButton)e.CommandSource).CommandArgument.Contains("ASC"))
                {
                    cmdArg = ((LinkButton)e.CommandSource).CommandArgument.Replace("ASC", "DESC");
                    ((LinkButton)e.CommandSource).CommandArgument = cmdArg;
                }
                else if (((LinkButton)e.CommandSource).CommandArgument.Contains("DESC"))
                {
                    cmdArg = ((LinkButton)e.CommandSource).CommandArgument.Replace("DESC", "ASC");
                    ((LinkButton)e.CommandSource).CommandArgument = cmdArg;
                }
                DtCripto.DataSource = view;

                Session[((LinkButton)e.CommandSource).Text] = cmdArg;
                DtCripto.DataBind();
            }

            if (((LinkButton)e.CommandSource).CommandName == "redirect")
            {
                Session["idMoeda"] = ((LinkButton)e.CommandSource).CommandArgument;
                Response.Redirect("pagcripto.aspx");
            }
        }
    }
}