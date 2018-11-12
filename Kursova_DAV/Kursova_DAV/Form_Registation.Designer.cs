namespace Kursova_DAV
{
    partial class Form_Registation
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form_Registation));
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_login = new System.Windows.Forms.TextBox();
            this.txt_pas = new System.Windows.Forms.TextBox();
            this.chk_zmina = new System.Windows.Forms.CheckBox();
            this.btn_exit = new System.Windows.Forms.Button();
            this.btn_con = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Arial", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.Location = new System.Drawing.Point(226, 34);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(240, 47);
            this.label3.TabIndex = 11;
            this.label3.Text = "Вхід в систему";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(134, 176);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 25);
            this.label2.TabIndex = 10;
            this.label2.Text = "Пароль";
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(134, 101);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 25);
            this.label1.TabIndex = 9;
            this.label1.Text = "Логін";
            // 
            // txt_login
            // 
            this.txt_login.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txt_login.Location = new System.Drawing.Point(260, 98);
            this.txt_login.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.txt_login.Name = "txt_login";
            this.txt_login.Size = new System.Drawing.Size(173, 22);
            this.txt_login.TabIndex = 7;
            // 
            // txt_pas
            // 
            this.txt_pas.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txt_pas.Location = new System.Drawing.Point(261, 176);
            this.txt_pas.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txt_pas.Name = "txt_pas";
            this.txt_pas.Size = new System.Drawing.Size(173, 22);
            this.txt_pas.TabIndex = 0;
            this.txt_pas.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox3_KeyPress);
            // 
            // chk_zmina
            // 
            this.chk_zmina.AutoSize = true;
            this.chk_zmina.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.chk_zmina.Location = new System.Drawing.Point(260, 230);
            this.chk_zmina.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.chk_zmina.Name = "chk_zmina";
            this.chk_zmina.Size = new System.Drawing.Size(127, 20);
            this.chk_zmina.TabIndex = 13;
            this.chk_zmina.Text = "Показати пароль";
            this.chk_zmina.UseVisualStyleBackColor = true;
            this.chk_zmina.CheckedChanged += new System.EventHandler(this.chk_zmina_CheckedChanged);
            // 
            // btn_exit
            // 
            this.btn_exit.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_exit.Image = global::Kursova_DAV.Properties.Resources.close1;
            this.btn_exit.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_exit.Location = new System.Drawing.Point(259, 342);
            this.btn_exit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btn_exit.Name = "btn_exit";
            this.btn_exit.Size = new System.Drawing.Size(174, 47);
            this.btn_exit.TabIndex = 12;
            this.btn_exit.Text = "Вихід";
            this.btn_exit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_exit.UseVisualStyleBackColor = true;
            this.btn_exit.Click += new System.EventHandler(this.btn_exit_Click);
            // 
            // btn_con
            // 
            this.btn_con.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btn_con.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_con.Image = global::Kursova_DAV.Properties.Resources.vodij1;
            this.btn_con.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_con.Location = new System.Drawing.Point(259, 274);
            this.btn_con.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.btn_con.Name = "btn_con";
            this.btn_con.Size = new System.Drawing.Size(174, 46);
            this.btn_con.TabIndex = 6;
            this.btn_con.Text = "Увійти";
            this.btn_con.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btn_con.UseVisualStyleBackColor = false;
            this.btn_con.Click += new System.EventHandler(this.btn_con_Click);
            // 
            // Form_Registation
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(693, 415);
            this.Controls.Add(this.chk_zmina);
            this.Controls.Add(this.btn_exit);
            this.Controls.Add(this.txt_pas);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_login);
            this.Controls.Add(this.btn_con);
            this.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.MaximizeBox = false;
            this.Name = "Form_Registation";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "АСУ \"Диспетчер кас автовокзалів\"";
            this.Load += new System.EventHandler(this.Form_Registation_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_login;
        private System.Windows.Forms.Button btn_con;
        private System.Windows.Forms.TextBox txt_pas;
        private System.Windows.Forms.Button btn_exit;
        private System.Windows.Forms.CheckBox chk_zmina;
    }
}