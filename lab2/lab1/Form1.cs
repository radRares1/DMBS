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
using System.Configuration;

namespace lab1
{
    public partial class Form1 : Form
    {

        private string childTableName = ConfigurationManager.AppSettings["ChildTableName"];
        private string parentTableName = ConfigurationManager.AppSettings["ParentTableName"];
        private string selectChild = ConfigurationManager.AppSettings["selectChild"];
        private string selectParent = ConfigurationManager.AppSettings["selectParent"];
        private string fkName = ConfigurationManager.AppSettings["fkName"];
        private string fkColumn = ConfigurationManager.AppSettings["fkColumn"];
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);
        private SqlDataAdapter childAdapter, parentAdapter;
        private DataSet dataSet;
        private SqlCommandBuilder builder;
        private BindingSource childSource, parentSource;

        private void updateButton_Click(object sender, EventArgs e)
        {
            this.childAdapter.Update(dataSet.Tables[childTableName]);
            this.childAdapter.Update(dataSet.Tables[parentTableName]);
            dataGridCars.Refresh();
            dataGridStudents.Refresh();
            MessageBox.Show("Records Updated");
        }



        public void initData()
        {
            
            this.dataSet = new DataSet();
            this.childAdapter = new SqlDataAdapter(selectChild, this.conn);
            this.parentAdapter = new SqlDataAdapter(selectParent, this.conn);
            this.builder = new SqlCommandBuilder(childAdapter);

            childAdapter.Fill(dataSet, childTableName);
            parentAdapter.Fill(dataSet, parentTableName);

            DataRelation fk = new DataRelation(fkName, dataSet.Tables[parentTableName].Columns[fkColumn], dataSet.Tables[childTableName].Columns[fkColumn]);

            dataSet.Relations.Add(fk);

            parentSource = new BindingSource();
            parentSource.DataSource = dataSet;
            parentSource.DataMember = parentTableName;

            childSource = new BindingSource();
            childSource.DataSource = parentSource;
            childSource.DataMember = fkName;

            dataGridStudents.DataSource = parentSource;
            dataGridCars.DataSource = childSource;

        }

        public Form1()
        {
            InitializeComponent();
            initData();
        }

       

    }
}
