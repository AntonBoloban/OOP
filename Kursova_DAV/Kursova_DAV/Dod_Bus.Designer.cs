namespace Kursova_DAV
{
    partial class Dod_Bus
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txt_numer = new System.Windows.Forms.TextBox();
            this.txt_model = new System.Windows.Forms.TextBox();
            this.txt_numznak = new System.Windows.Forms.TextBox();
            this.txt_kilmis = new System.Windows.Forms.TextBox();
            this.btn_Dod = new System.Windows.Forms.Button();
            this.btn_Vyd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Номер";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 81);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Модель";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 129);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 16);
            this.label3.TabIndex = 2;
            this.label3.Text = "Номерний_знак";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 177);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(101, 16);
            this.label4.TabIndex = 3;
            this.label4.Text = "Кількість_місць";
            // 
            // txt_numer
            // 
            this.txt_numer.Location = new System.Drawing.Point(167, 33);
            this.txt_numer.Name = "txt_numer";
            this.txt_numer.Size = new System.Drawing.Size(199, 22);
            this.txt_numer.TabIndex = 4;
            // 
            // txt_model
            // 
            this.txt_model.Location = new System.Drawing.Point(167, 76);
            this.txt_model.Name = "txt_model";
            this.txt_model.Size = new System.Drawing.Size(199, 22);
            this.txt_model.TabIndex = 5;
            // 
            // txt_numznak
            // 
            this.txt_numznak.Location = new System.Drawing.Point(167, 124);
            this.txt_numznak.Name = "txt_numznak";
            this.txt_numznak.Size = new System.Drawing.Size(199, 22);
            this.txt_numznak.TabIndex = 6;
            // 
            // txt_kilmis
            // 
            this.txt_kilmis.Location = new System.Drawing.Point(167, 174);
            this.txt_kilmis.Name = "txt_kilmis";
            this.txt_kilmis.Size = new System.Drawing.Size(199, 22);
            this.txt_kilmis.TabIndex = 7;
            // 
            // btn_Dod
            // 
            this.btn_Dod.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btn_Dod.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_Dod.Image = global::Kursova_DAV.Properties.Resources.dod5;
            this.btn_Dod.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Dod.Location = new System.Drawing.Point(27, 231);
            this.btn_Dod.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_Dod.Name = "btn_Dod";
            this.btn_Dod.Size = new System.Drawing.Size(131, 34);
            this.btn_Dod.TabIndex = 19;
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
            this.btn_Vyd.Location = new System.Drawing.Point(235, 231);
            this.btn_Vyd.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_Vyd.Name = "btn_Vyd";
            this.btn_Vyd.Size = new System.Drawing.Size(131, 34);
            this.btn_Vyd.TabIndex = 18;
            this.btn_Vyd.Text = "Відмінити";
            this.btn_Vyd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_Vyd.UseVisualStyleBackColor = true;
            this.btn_Vyd.Click += new System.EventHandler(this.btn_Vyd_Click);
            // 
            // Dod_Bus
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(393, 286);
            this.ControlBox = false;
            this.Controls.Add(this.btn_Dod);
            this.Controls.Add(this.btn_Vyd);
            this.Controls.Add(this.txt_kilmis);
            this.Controls.Add(this.txt_numznak);
            this.Controls.Add(this.txt_model);
            this.Controls.Add(this.txt_numer);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Dod_Bus";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Додавання нового автобуса";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        public System.Windows.Forms.TextBox txt_numer;
        public System.Windows.Forms.TextBox txt_model;
        public System.Windows.Forms.TextBox txt_numznak;
        public System.Windows.Forms.TextBox txt_kilmis;
        private System.Windows.Forms.Button btn_Dod;
        private System.Windows.Forms.Button btn_Vyd;
    }
}