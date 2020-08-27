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
        public SqlConnection GetConnect()
        {
            return new SqlConnection(@"Data Source=DESKTOP-HM5GU92\SQLEXPRESS;Initial Catalog=QuanLyDuLich;Integrated Security=True");
        }
        public DataTable GetTable(string sql)
        {
            SqlConnection con = GetConnect();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            DataTable table = new DataTable();
            adapter.Fill(table);

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
