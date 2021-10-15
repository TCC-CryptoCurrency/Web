using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


    public class ClasseConexao
    {
        SqlConnection conexao = new SqlConnection();

        private SqlConnection conectar(){
            try{
                String strConexao = "Password=12345; Persist Security Info=True; User ID=sa; Initial Catalog=BancoTCC; Data Source=" + Environment.MachineName;
                conexao.ConnectionString = strConexao;
                conexao.Open();
                return conexao;
            }catch (Exception){
                desconectar();
                return null;
            }
        }

        public void desconectar(){
            try{
                if ((conexao.State == ConnectionState.Open)){
                    conexao.Close();
                    conexao.Dispose();
                    conexao = null;
                }
            }catch (Exception) { }
        }

        public DataTable executarSQL(String comando_sql){
            try{
                conectar();
                SqlDataAdapter adaptador = new SqlDataAdapter(comando_sql, conexao);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                return ds.Tables[0];
            }catch (Exception){
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add(new DataColumn("idMoeda", typeof(Int32)));
            dt.Columns.Add(new DataColumn("NomeMoeda", typeof(String)));
            dt.Columns.Add(new DataColumn("ValorMoeda", typeof(double)));
            dt.Columns.Add(new DataColumn("ValorData", typeof(double)));
            dt.Columns.Add(new DataColumn("DataRegistro", typeof(double)));

            for(int i = 0; i<10; i++)
            {
                dr = dt.NewRow();

                dr[0] = 0;
                dr[1] = 0;
                dr[2] = 0;
                dr[3] = 0;
                dr[4] = 0;

                dt.Rows.Add(dr);
            }

            return dt;
            }finally{
                desconectar();
            }
        }

    public DataSet executa_sql(String comando_sql)
    {
        try
        {
            conectar();
            SqlDataAdapter adapter = new SqlDataAdapter(comando_sql, conexao);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds;
        }
        catch (Exception)
        {
            return null;
        }
        finally
        {
            desconectar();
        }
    }

    public bool manutencaoDB(String comando_sql) //incluir, alterar, excluir
        {
            try
            {
                conectar();
                SqlCommand comando = new SqlCommand();
                comando.CommandText = comando_sql;
                comando.Connection = conexao;
                comando.ExecuteScalar();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                desconectar();
            }
        }//fim do método manutençãoDB
    }

