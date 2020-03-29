using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace lab1
{
    public partial class Form1 : Form
    {

        private SqlConnection conn;
        private SqlDataAdapter carAdapter, studentAdapter;
        private DataSet dataSet;
        private SqlCommandBuilder builder;
        private BindingSource carSource, studentSource;

        private void updateButton_Click(object sender, EventArgs e)
        {
            this.carAdapter.Update(dataSet.Tables["Car"]);
            this.carAdapter.Update(dataSet.Tables["Student"]);
            dataGridCars.Refresh();
            dataGridStudents.Refresh();
            MessageBox.Show("Records Updated");
        }

        public Form1()
        {
            InitializeComponent();
            initData();
            
        }

        public void initData()
        {
            
            this.conn = new SqlConnection("Data Source = RARES\\SQLEXPRESS ; Initial Catalog=drivingSchool; Integrated Security = true");
            this.dataSet = new DataSet();
            this.carAdapter = new SqlDataAdapter("SELECT * FROM Car", this.conn);
            this.studentAdapter = new SqlDataAdapter("Select * FROM Student", this.conn);
            this.builder = new SqlCommandBuilder(carAdapter);

            carAdapter.Fill(dataSet, "Car");
            studentAdapter.Fill(dataSet, "Student");

            DataRelation fk = new DataRelation("carFk", dataSet.Tables["Student"].Columns["carID"], dataSet.Tables["Car"].Columns["carID"]);

            dataSet.Relations.Add(fk);

            studentSource = new BindingSource();
            studentSource.DataSource = dataSet;
            studentSource.DataMember = "Student";

            carSource = new BindingSource();
            carSource.DataSource = studentSource;
            carSource.DataMember = "carFk";

            dataGridStudents.DataSource = studentSource;
            dataGridCars.DataSource = carSource;

        }

    }
}
