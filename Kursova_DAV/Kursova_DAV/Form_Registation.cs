using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Kursova_DAV
{
    public partial class Form_Registation : Form
    {
        public Form_Registation()
        {
            InitializeComponent();
        }
        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar <= 47 || e.KeyChar >= 58) && e.KeyChar != 8)
            e.Handled = true;
        }
        private void btn_con_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection
            (@"Data Source=(LocalDB)\MSSQLLocalDB;" +
            "AttachDbFilename=C:\\USERS\\ANTON\\DESKTOP\\КПІ1\\4 СЕМЕСТР\\ООП-2\\КУРСОВА\\" +
            "KURSOVA_DAV\\DB\\LOGIN.MDF;" +
            "Integrated Security=True;Connect Timeout=30");
            string query = "Select * from Login Where Логин = '" 
            + txt_login.Text.Trim() + "' and Пароль = '" + txt_pas.Text.Trim() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, sqlcon);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            if (dtbl.Rows.Count == 1)
            {
                Welcome objFrmMain = new Welcome();
                this.Hide();
                objFrmMain.Show();
            }
            else
            {
                MessageBox.Show("Перевірте ім'я користувача та пароль",
                "Помилка авторизації", 
                MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btn_exit_Click(object sender, EventArgs e)
        {
            Close();
        }
        private void Form_Registation_Load(object sender, EventArgs e)
        {
            txt_pas.UseSystemPasswordChar = true;
        }
        private void chk_zmina_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_zmina.Checked)
            {
                txt_pas.UseSystemPasswordChar = false;
            }
            else
            {
                txt_pas.UseSystemPasswordChar = true;
            }
        }
      }
}
