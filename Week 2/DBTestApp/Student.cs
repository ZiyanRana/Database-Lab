using DBTestApp;
using MySql.Data.MySqlClient;
using System;

namespace DBTestApp
{
    public class Student
    {
        public string RegNo { get; set; }
        public string Name { get; set; }
        public string Department { get; set; }
        public int Session { get; set; }
        public float Cgpa { get; set; }
        public string Address { get; set; }

        public Student(string regNo, string name = null, string department = null, int session = 0, float cgpa = 0.0f, string address = null)
        {
            RegNo = regNo;
            Name = name;
            Department = department;
            Session = session;
            Address = address;
        }

        public void AddStudent()
        {
            string query = $"INSERT INTO Student (RegistrationNumber, Name, Department, Session, Address) " +
                           $"VALUES ('{RegNo}', '{Name}', '{Department}', {Session}, '{Address}')";
            DatabaseHelper.Instance.Update(query);
        }

        public void EditStudent()
        {
            string query = $"UPDATE Student SET Name = '{Name}', CGPA = {Cgpa} WHERE RegNo = '{RegNo}'";
            DatabaseHelper.Instance.Update(query); 
        }

        public void DeleteStudent()
        {
            string query = $"DELETE FROM Student WHERE RegNo = '{RegNo}'";
            DatabaseHelper.Instance.Update(query); 
        }

        public void SearchStudent()
        {
            string query = $"SELECT * FROM Student WHERE RegNo = '{RegNo}'";
            var reader = DatabaseHelper.Instance.getData(query);
            if (reader.Read())
            {
                Console.WriteLine($"{reader["RegNo"]} - {reader["Name"]} - {reader["Department"]} - {reader["Session"]} - {reader["Cgpa"]} - {reader["Address"]}");
            }
            else
            {
                Console.WriteLine("Student not found.");
            }
        }

        public void ShowStudents()
        {
            string query = "SELECT * FROM Student";
            var reader = DatabaseHelper.Instance.getData(query);
            while (reader.Read())
            {
                Console.WriteLine($"{reader["RegNo"]} - {reader["Name"]} - {reader["Department"]} - {reader["Session"]} - {reader["Cgpa"]} - {reader["Address"]}");
            }
        }
    }
}