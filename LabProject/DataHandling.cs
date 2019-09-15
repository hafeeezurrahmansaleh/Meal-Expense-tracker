using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LabProject
{
    public class DataHandling
    {
        string connctstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlCommand cmd;
        public DataTable GetDatatable(string query)
        {
            SqlConnection conn = new SqlConnection(connctstring);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlDataAdapter adap = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            conn.Close();
            return dt;
        }

        public bool executequery(string query)
        {
            SqlConnection conn = new SqlConnection(connctstring);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand(query, conn);
            try
            {
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (SqlException ex)
            {
                return false;
                conn.Close();
            }
        }
        public int check(string query)
        {
            executequery(query);
            return Convert.ToInt32(cmd.ExecuteScalar().ToString());
        }


    }
}