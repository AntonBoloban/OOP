namespace Kursova_DAV
{
    partial class Dod_bilet
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
            this.dtTiPi_1 = new System.Windows.Forms.DateTimePicker();
            this.txt_1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtmis = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtvar = new System.Windows.Forms.TextBox();
            this.txtpib = new System.Windows.Forms.TextBox();
            this.txtpas = new System.Windows.Forms.TextBox();
            this.btn_Dod = new System.Windows.Forms.Button();
            this.btn_Vyd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // dtTiPi_1
            // 
            this.dtTiPi_1.CustomFormat = "dd.MM.yyyy H:mm:ss";
            this.dtTiPi_1.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtTiPi_1.Location = new System.Drawing.Point(214, 42);
            this.dtTiPi_1.Name = "dtTiPi_1";
            this.dtTiPi_1.Size = new System.Drawing.Size(200, 22);
            this.dtTiPi_1.TabIndex = 0;
            this.dtTiPi_1.ValueChanged += new System.EventHandler(this.dtTiPi_1_ValueChanged);
            // 
            // txt_1
            // 
            this.txt_1.Location = new System.Drawing.Point(214, 103);
            this.txt_1.Name = "txt_1";
            this.txt_1.Size = new System.Drawing.Size(200, 22);
            this.txt_1.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(43, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "Місце";
            // 
            // txtmis
            // 
            this.txtmis.Location = new System.Drawing.Point(24, 42);
            this.txtmis.Name = "txtmis";
            this.txtmis.Size = new System.Drawing.Size(100, 22);
            this.txtmis.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(211, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 16);
            this.label2.TabIndex = 4;
            this.label2.Text = "Час_купівлі";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(22, 84);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 16);
            this.label3.TabIndex = 5;
            this.label3.Text = "Вартість";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(214, 166);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(108, 16);
            this.label4.TabIndex = 6;
            this.label4.Text = "П_І_Б_пасажира";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 166);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(57, 16);
            this.label5.TabIndex = 7;
            this.label5.Text = "Паспорт";
            // 
            // txtvar
            // 
            this.txtvar.Location = new System.Drawing.Point(25, 103);
            this.txtvar.Name = "txtvar";
            this.txtvar.Size = new System.Drawing.Size(100, 22);
            this.txtvar.TabIndex = 8;
            // 
            // txtpib
            // 
            this.txtpib.Location = new System.Drawing.Point(214, 185);
            this.txtpib.Name = "txtpib";
            this.txtpib.Size = new System.Drawing.Size(100, 22);
            this.txtpib.TabIndex = 9;
            // 
            // txtpas
            // 
            this.txtpas.Location = new System.Drawing.Point(24, 185);
            this.txtpas.Name = "txtpas";
            this.txtpas.Size = new System.Drawing.Size(100, 22);
            this.txtpas.TabIndex = 11;
            // 
            // btn_Dod
            // 
            this.btn_Dod.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btn_Dod.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_Dod.Image = global::Kursova_DAV.Properties.Resources.dod5;
            this.btn_Dod.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Dod.Location = new System.Drawing.Point(50, 257);
            this.btn_Dod.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_Dod.Name = "btn_Dod";
            this.btn_Dod.Size = new System.Drawing.Size(131, 34);
            this.btn_Dod.TabIndex = 15;
            this.btn_Dod.Text = "Додати";
            this.btn_Dod.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_Dod.UseVisualStyleBackColor = true;
            this.btn_Dod.Click += new System.EventHandler(this.btn_Dod_Click);
            // 
            // btn_Vyd
            // 
            this.btn_Vyd.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_Vyd.Image = global::Kursova_DAV.Properties.Resources.minus;
            this.btn_Vyd.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Vyd.Location = new System.Drawing.Point(237, 257);
            this.btn_Vyd.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_Vyd.Name = "btn_Vyd";
            this.btn_Vyd.Size = new System.Drawing.Size(131, 34);
            this.btn_Vyd.TabIndex = 14;
            this.btn_Vyd.Text = "Відмінити";
            this.btn_Vyd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_Vyd.UseVisualStyleBackColor = true;
            this.btn_Vyd.Click += new System.EventHandler(this.btn_Vyd_Click);
            // 
            // Dod_bilet
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(426, 328);
            this.ControlBox = false;
            this.Controls.Add(this.btn_Dod);
            this.Controls.Add(this.btn_Vyd);
            this.Controls.Add(this.txtpas);
            this.Controls.Add(this.txtpib);
            this.Controls.Add(this.txtvar);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtmis);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_1);
            this.Controls.Add(this.dtTiPi_1);
            this.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Dod_bilet";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Додавання нового білету";
            this.Load += new System.EventHandler(this.Dod_bilet_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtTiPi_1;
        public System.Windows.Forms.TextBox txt_1;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox txtmis;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        public System.Windows.Forms.TextBox txtvar;
        public System.Windows.Forms.TextBox txtpib;
        public System.Windows.Forms.TextBox txtpas;
        private System.Windows.Forms.Button btn_Dod;
        private System.Windows.Forms.Button btn_Vyd;
    }
}