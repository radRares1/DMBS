namespace lab1
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridStudents = new System.Windows.Forms.DataGridView();
            this.dataGridCars = new System.Windows.Forms.DataGridView();
            this.updateButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridStudents)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridCars)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridStudents
            // 
            this.dataGridStudents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridStudents.Location = new System.Drawing.Point(12, 12);
            this.dataGridStudents.Name = "dataGridStudents";
            this.dataGridStudents.Size = new System.Drawing.Size(343, 150);
            this.dataGridStudents.TabIndex = 0;
            // 
            // dataGridCars
            // 
            this.dataGridCars.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridCars.Location = new System.Drawing.Point(361, 12);
            this.dataGridCars.Name = "dataGridCars";
            this.dataGridCars.Size = new System.Drawing.Size(240, 150);
            this.dataGridCars.TabIndex = 1;
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(229, 202);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(75, 23);
            this.updateButton.TabIndex = 2;
            this.updateButton.Text = "Update DB";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(613, 261);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.dataGridCars);
            this.Controls.Add(this.dataGridStudents);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridStudents)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridCars)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridStudents;
        private System.Windows.Forms.DataGridView dataGridCars;
        private System.Windows.Forms.Button updateButton;
    }
}

