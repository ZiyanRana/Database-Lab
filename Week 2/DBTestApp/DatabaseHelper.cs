using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBTestApp 
{
    public class DatabaseHelper
    {
        private String serverName = "127.0.0.1";
        private String port = "3306";
        private String databaseName = "lab2_task";
        private String databaseUser = "root";
        private String databasePassword = "123";

        private DatabaseHelper() { }
        private static DatabaseHelper _instance;
        public static DatabaseHelper Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new DatabaseHelper();
                return _instance;
            }
        }

        public MySqlConnection getConnection()
        {
            string connectionString = $"server={serverName};port={port};user={databaseUser};database={databaseName};password={databasePassword};";

            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();

            return connection;
        }

        public MySqlDataReader getData(string query)
        {
            var connection = getConnection(); 
            var command = new MySqlCommand(query, connection);
            return command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        public int Update(string query)
        {
            using (var connection = getConnection())
            {
                using (var command = new MySqlCommand(query, connection))
                {
                    return command.ExecuteNonQuery();
                }
            }
        }
    }
}