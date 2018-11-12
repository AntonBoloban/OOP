namespace Kursova_DAV
{
    partial class Dod_vodij
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
            this.btn_Dod = new System.Windows.Forms.Button();
            this.btn_Vyd = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_pib = new System.Windows.Forms.TextBox();
            this.dtTiPi_1 = new System.Windows.Forms.DateTimePicker();
            this.txt_pas = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btn_Dod
            // 
            this.btn_Dod.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btn_Dod.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_Dod.Image = global::Kursova_DAV.Properties.Resources.dod5;
            this.btn_Dod.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Dod.Location = new System.Drawing.Point(53, 209);
            this.btn_Dod.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.btn_Dod.Name = "btn_Dod";
            this.btn_Dod.Size = new System.Drawing.Size(153, 42);
            this.btn_Dod.TabIndex = 21;
            this.btn_Dod.Text = "Додати";
            this.btn_Dod.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_Dod.UseVisualStyleBackColor = true;
            this.btn_Dod.Click += new System.EventHandler(this.btn_Dod_Click);
            // 
            // btn_Vyd
            // 
            this.btn_Vyd.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btn_Vyd.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_Vyd.Image = global::Kursova_DAV.Properties.Resources.minus;
            this.btn_Vyd.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Vyd.Location = new System.Drawing.Point(295, 209);
            this.btn_Vyd.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.btn_Vyd.Name = "btn_Vyd";
            this.btn_Vyd.Size = new System.Drawing.Size(153, 42);
            this.btn_Vyd.TabIndex = 20;
            this.btn_Vyd.Text = "Відмінити";
            this.btn_Vyd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_Vyd.UseVisualStyleBackColor = true;
            this.btn_Vyd.Click += new System.EventHandler(this.btn_Vyd_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 16);
            this.label1.TabIndex = 22;
            this.label1.Text = "П_І_Б_водія";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(35, 85);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(116, 16);
            this.label2.TabIndex = 23;
            this.label2.Text = "Дата_народження";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(35, 141);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 16);
            this.label3.TabIndex = 24;
            this.label3.Text = "Паспорт";
            // 
            // txt_pib
            // 
            this.txt_pib.Location = new System.Drawing.Point(202, 31);
            this.txt_pib.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txt_pib.Name = "txt_pib";
            this.txt_pib.Size = new System.Drawing.Size(271, 22);
            this.txt_pib.TabIndex = 25;
            // 
            // dtTiPi_1
            // 
            this.dtTiPi_1.CustomFormat = "dd.MM.yyyy";
            this.dtTiPi_1.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtTiPi_1.Location = new System.Drawing.Point(202, 82);
            this.dtTiPi_1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dtTiPi_1.Name = "dtTiPi_1";
            this.dtTiPi_1.Size = new System.Drawing.Size(271, 22);
            this.dtTiPi_1.TabIndex = 26;
            this.dtTiPi_1.Value = new System.DateTime(2017, 3, 13, 0, 0, 0, 0);
            // 
            // txt_pas
            // 
            this.txt_pas.Location = new System.Drawing.Point(202, 138);
            this.txt_pas.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txt_pas.Name = "txt_pas";
            this.txt_pas.Size = new System.Drawing.Size(271, 22);
            this.txt_pas.TabIndex = 27;
            // 
            // Dod_vodij
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(501, 279);
            this.ControlBox = false;
            this.Controls.Add(this.txt_pas);
            this.Controls.Add(this.dtTiPi_1);
            this.Controls.Add(this.txt_pib);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_Dod);
            this.Controls.Add(this.btn_Vyd);
            this.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Dod_vodij";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Додавання нового водія";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_Dod;
        private System.Windows.Forms.Button btn_Vyd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox txt_pib;
        public System.Windows.Forms.DateTimePicker dtTiPi_1;
        public System.Windows.Forms.TextBox txt_pas;
    }
}