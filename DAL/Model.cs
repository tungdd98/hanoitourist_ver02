using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Model
    {
        //DESKTOP-8SQIKLE\SQLEXPRESS
        Config config = new Config();
        public SqlConnection GetConnect()
        {
            return new SqlConnection(config.sqlConnect);
        }
        public DataTable GetTable(string sql)
        {
            SqlConnection con = GetConnect();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            DataTable table = new DataTable();
            adapter.Fill(table);
            con.Close();
            con.Close();

            return table;
        }
        public void Execute(string sql)
        {
            SqlConnection con = GetConnect();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Clone();
            con.Close();
        }
        public bool CheckExits(string sql)
        {
            SqlConnection con = GetConnect();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int count = (int)cmd.ExecuteScalar();

            return count > 0;
        }
    }
}
