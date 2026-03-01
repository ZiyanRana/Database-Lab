using DBTestApp;
using System;

namespace DBTestApp
{
    public class Enrollment
    {
        public string StudentRegNo { get; set; }
        public string CourseID { get; set; }

        public Enrollment(string regNo, string courseId)
        {
            StudentRegNo = regNo;
            CourseID = courseId;
        }

        public void Register()
        {
            string query = $"INSERT INTO Enrollments (StudentRegNo, Course_ID) VALUES ('{StudentRegNo}', '{CourseID}')";
            DatabaseHelper.Instance.Update(query);
            Console.WriteLine("Student registered in course successfully!");
        }

        public void Unregister()
        {
            string query = $"DELETE FROM Enrollments WHERE StudentRegNo = '{StudentRegNo}' AND Course_ID = '{CourseID}'";
            int rows = DatabaseHelper.Instance.Update(query);
            if (rows > 0)
                Console.WriteLine("Student unregistered successfully.");
            else
                Console.WriteLine("Registration record not found.");
        }
    }
}