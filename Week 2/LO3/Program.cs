using DBTestApp;
using System;

namespace DBTestApp
{
    class Program
    {
        static void Main(string[] args)
        {
            MainMenu();
        }

        static void MainMenu()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("=== UNIVERSITY MANAGEMENT SYSTEM ===");
                Console.WriteLine("1. Student Menu");
                Console.WriteLine("2. Course Menu");
                Console.WriteLine("3. Registration Menu (Enrollment)");
                Console.WriteLine("4. Attendance Menu");
                Console.WriteLine("5. Exit");
                Console.Write("Select an option: ");

                string choice = Console.ReadLine();
                switch (choice)
                {
                    case "1": StudentMenu(); break;
                    case "2": CourseMenu(); break;
                    case "3": RegistrationMenu(); break;
                    case "4": AttendanceMenu(); break;
                    case "5": Environment.Exit(0); break;
                    default: Console.WriteLine("Invalid choice. Press Enter to try again."); Console.ReadLine(); break;
                }
            }
        }

        static void StudentMenu()
        {
            Console.Clear();
            Console.WriteLine("--- Student Management ---");
            Console.WriteLine("1. Add Student\n2. View All Students\n3. Delete Student\n4. Back");
            string choice = Console.ReadLine();

            if (choice == "1")
            {
                Console.Write("Enter RegNo: "); string reg = Console.ReadLine();
                Console.Write("Enter Name: "); string name = Console.ReadLine();
                Console.Write("Enter Dept: "); string dept = Console.ReadLine();
                Student s = new Student(reg, name, dept, 2023, 3.5f, "Address");
                s.AddStudent();
            }
            else if (choice == "2")
            {
                new Student("").ShowStudents();
                Console.ReadLine();
            }
        }

        static void CourseMenu()
        {
            Console.Clear();
            Console.WriteLine("--- Course Management ---");
            Console.WriteLine("1. Add Course\n2. Show Courses\n3. Back");
            string choice = Console.ReadLine();

            if (choice == "1")
            {
                Console.Write("Enter Course ID: "); string id = Console.ReadLine();
                Console.Write("Enter Course Name: "); string name = Console.ReadLine();
                new Course(id, name).AddCourse();
            }
            else if (choice == "2")
            {
                new Course("").ShowCourses();
                Console.ReadLine();
            }
        }

        static void RegistrationMenu()
        {
            Console.Clear();
            Console.WriteLine("--- Registration Menu ---");
            Console.Write("Enter Student RegNo: "); string reg = Console.ReadLine();
            Console.Write("Enter Course ID: "); string course = Console.ReadLine();

            Enrollment e = new Enrollment(reg, course);
            e.Register();
            Console.ReadLine();
        }

        static void AttendanceMenu()
        {
            Console.Clear();
            Console.WriteLine("--- Attendance Menu ---");
            Console.WriteLine("1. Mark Attendance\n2. View Attendance by Date\n3. Back");
            string choice = Console.ReadLine();

            if (choice == "1")
            {
                Console.Write("Enter RegNo: "); string reg = Console.ReadLine();
                Console.Write("Enter Course ID: "); string course = Console.ReadLine();
                Console.Write("Is Present? (y/n): "); bool status = Console.ReadLine().ToLower() == "y";

                Attendance a = new Attendance(reg, course, status);
                a.MarkAttendance();
            }
            else if (choice == "2")
            {
                Console.Write("Enter Course ID: "); string course = Console.ReadLine();
                Console.Write("Enter Date (yyyy-mm-dd): "); string date = Console.ReadLine();
                Attendance.ListByDate(course, date);
                Console.ReadLine();
            }
        }
    }
}