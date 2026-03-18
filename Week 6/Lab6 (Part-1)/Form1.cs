using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab6
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.employeeDataBindingSource.DataSource = new
            List<EmployeeData>()
            {
                new EmployeeData(){ EmployeeID = 1, FirstName = "John",
                LastName="Doe", Department = "HR", Salary = 50000.00 },
                new EmployeeData(){ EmployeeID = 2, FirstName = "Jane",
                LastName="Smith", Department = "IT", Salary = 70000.00 },
                new EmployeeData(){ EmployeeID = 3, FirstName = "Robert",
                LastName="Brown", Department = "Finance", Salary = 60000.00 },
            };
            this.reportViewer1.RefreshReport();
            this.reportViewer2.RefreshReport();
            this.reportViewer3.RefreshReport();
        }
    }
}
