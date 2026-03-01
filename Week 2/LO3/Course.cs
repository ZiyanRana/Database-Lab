using DBTestApp;
using MySql.Data.MySqlClient;
using System;

namespace DBTestApp 
{
    public class Course
    {
        public string CourseID { get; set; }
        public string CourseName { get; set; }

        public Course(string id, string name = null)
        {
            CourseID = id;
            CourseName = name;
        }

        public void AddCourse()
        {
            string query = $"INSERT INTO Course (Course_ID, Course_Name) VALUES ('{CourseID}', '{CourseName}')";
            DatabaseHelper.Instance.Update(query);
            Console.WriteLine("Course added successfully!");
        }

        public void EditCourse()
        {
            string query = $"UPDATE Course SET Course_Name = '{CourseName}' WHERE Course_ID = '{CourseID}'";
            int rowsAffected = DatabaseHelper.Instance.Update(query);

            if (rowsAffected > 0)
                Console.WriteLine("Course updated successfully!");
            else
                Console.WriteLine("Course not found.");
        }

        public void DeleteCourse()
        {
            string query = $"DELETE FROM Course WHERE Course_ID = '{CourseID}'";
            int rowsAffected = DatabaseHelper.Instance.Update(query);

            if (rowsAffected > 0)
                Console.WriteLine("Course deleted successfully!");
            else
                Console.WriteLine("Course not found.");
        }

        public void ShowCourses()
        {
            string query = "SELECT * FROM Course";
            MySqlDataReader reader = DatabaseHelper.Instance.getData(query);

            Console.WriteLine("\n--- List of Courses ---");
            Console.WriteLine("ID\t\tName");
            Console.WriteLine("-----------------------");

            while (reader.Read())
            {
                Console.WriteLine($"{reader["Course_ID"]}\t\t{reader["Course_Name"]}");
            }
            reader.Close(); 
        }

        public void SearchCourse()
        {
            string query = $"SELECT * FROM Course WHERE Course_ID = '{CourseID}'";
            MySqlDataReader reader = DatabaseHelper.Instance.getData(query);

            if (reader.Read())
            {
                Console.WriteLine($"Found: {reader["Course_ID"]} - {reader["Course_Name"]}");
            }
            else
            {
                Console.WriteLine("Course not found.");
            }
            reader.Close();
        }
    }
}