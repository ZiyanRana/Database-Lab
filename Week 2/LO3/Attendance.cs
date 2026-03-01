using DBTestApp;
using MySql.Data.MySqlClient;
using System;

namespace DBTestApp
{
    public class Attendance
    {
        public string StudentRegNo { get; set; }
        public string CourseID { get; set; }
        public DateTime TimeStamp { get; set; }
        public bool Status { get; set; }

        public Attendance(string regNo, string courseId, bool status = false)
        {
            StudentRegNo = regNo;
            CourseID = courseId;
            TimeStamp = DateTime.Now;
            Status = status;
        }

        public void MarkAttendance()
        {
            int statusValue = Status ? 1 : 0;
            string formattedDate = TimeStamp.ToString("yyyy-MM-dd HH:mm:ss");

            string query = $"INSERT INTO Attendance (StudentRegNo, Course_ID, TimeStamp, Status) " +
                           $"VALUES ('{StudentRegNo}', '{CourseID}', '{formattedDate}', {statusValue})";

            DatabaseHelper.Instance.Update(query);
            Console.WriteLine("Attendance marked successfully!");
        }

        public static void ListByDate(string courseId, string date)
        {
            string query = $"SELECT * FROM Attendance WHERE Course_ID = '{courseId}' AND DATE(TimeStamp) = '{date}'";
            MySqlDataReader reader = DatabaseHelper.Instance.getData(query);

            Console.WriteLine($"\n--- Attendance for {courseId} on {date} ---");
            while (reader.Read())
            {
                string status = Convert.ToBoolean(reader["Status"]) ? "Present" : "Absent";
                Console.WriteLine($"{reader["StudentRegNo"]} - {status}");
            }
            reader.Close();
        }
    }
}