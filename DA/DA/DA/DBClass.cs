using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace ClientMLT
{
    public class DBClass
    {
        static string sConstr = ConfigurationManager.ConnectionStrings["myConn"].ConnectionString;
        public DBClass()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static DataSet ExecSPds(string procName, string[] paramName, Object[] paramValue)
        {

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandText = procName;

            for (int i = 0; i < paramName.Length; i++)
                sqlCmd.Parameters.AddWithValue(paramName[i], paramValue[i]);

            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();

            sqlCmd.Connection = Conn;
            sqlCmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            //DataTable dt = new DataTable("tbl");
            //da.Fill(dt);

            sqlCmd.Dispose();
            Conn.Close();
            return ds;
        }
        public static DataSet ExecSPdsnp(string procName)
        {

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandText = procName;



            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();

            sqlCmd.Connection = Conn;
            sqlCmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            //DataTable dt = new DataTable("tbl");
            //da.Fill(dt);

            sqlCmd.Dispose();
            Conn.Close();
            return ds;
        }
        public static string ExecSPstr(string procName, string[] paramName, Object[] paramValue)
        {

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandText = procName;

            for (int i = 0; i < paramName.Length; i++)
                sqlCmd.Parameters.AddWithValue(paramName[i], paramValue[i]);

            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();

            sqlCmd.Connection = Conn;
            sqlCmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);

            DataTable dt = new DataTable("tbl");
            da.Fill(dt);

            sqlCmd.Dispose();
            Conn.Close();
            return "Successful";
        }

        public static string ExecQry(string Query)
        {

            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();
            SqlCommand sqlCmd = new SqlCommand(Query, Conn);
            sqlCmd.ExecuteNonQuery();
            sqlCmd.Dispose();
            Conn.Close();
            return "Successful";


        }
        public static string ExecTwoQry(string Query1, string Query2)
        {

            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();
            SqlCommand sqlCmd1 = new SqlCommand(Query1, Conn);
            sqlCmd1.ExecuteNonQuery();
            sqlCmd1.Dispose();

            SqlCommand sqlCmd2 = new SqlCommand(Query2, Conn);
            sqlCmd2.ExecuteNonQuery();
            sqlCmd2.Dispose();
            Conn.Close();
            return "Successful";


        }

        public static DataSet ExecQryds(string Query)
        {

            SqlConnection Conn = new SqlConnection(sConstr);
            Conn.Open();
            SqlCommand sqlCmd = new SqlCommand(Query, Conn);

            sqlCmd.Connection = Conn;
            sqlCmd.CommandType = CommandType.Text;

            SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            //DataTable dt = new DataTable("tbl");
            //da.Fill(dt);

            sqlCmd.Dispose();
            Conn.Close();
            return ds;


        }
        public static List<string> SearchCustomers(string query, string text)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", text);
                SqlConnection Conn = new SqlConnection(sConstr);
                Conn.Open();
                List<string> customers = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["ContactName"].ToString());
                    }
                }
                Conn.Close();
                return customers;
            }
        }

    }
}
