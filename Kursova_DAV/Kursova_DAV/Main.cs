using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Kursova_DAV
{
    public partial class Main : Form
    {
        public string ConnectionString = @"Data Source=TOHA-PC;Initial Catalog=KursovaDB;" +
            "Integrated Security=True";
        // активна таблиця: 1-білети, 2-маршрути, 3-автобуси, 4-водії, 5 - диспетчери
        private int act_table = 1; 
        public Main()
        {
            InitializeComponent();
        }

      
        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox1.SelectedIndex = 0;
            btnZast_Click(sender, e);
            Get_Bilets();
              
        }                    

        private void проПрограмуToolStripMenuItem_Click(object sender, EventArgs e)
        {
            About_program b = new About_program();
            b.ShowDialog();
        }

        private void вихідToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void змінитиКористувачаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Registation objFrmMain = new Form_Registation();
            this.Hide();
            objFrmMain.Show();
        }

        private void btnZast_Click(object sender, EventArgs e)
        {
            string CommandText = "SELECT " +
         "[Перевезення].[Номер], " +
         "[Маршрут].[Номер_маршруту], " +
         "[Маршрут].[Пункт_призначення], " +
         "[Маршрут].[Час_відправлення], " +
         "[Маршрут].[Час_прибуття], " +
         "[Білет].[Місце], " +
         "[Білет].[П_І_Б_пасажира], " +
         "[Білет].[Вартість], " +
         "[Водій].[П_І_Б_водія] " +
       "FROM " +
         "[Перевезення], " +
         "[Маршрут], " +
         "[Білет], " +
         "[Водій] " +
       "WHERE " +
         "([Перевезення].[ID_Marshrut]=[Маршрут].[ID_Marshrut]) AND " +
         "([Перевезення].[ID_Bilet] = [Білет].[ID_Bilet]) AND " +
         "([Перевезення].[ID_Vodij] = [Водій].[ID_Vodij]) ";

            if (textBox1.Text != "")  // якщо набрано текст у полі фільтру
            {
                if (comboBox1.SelectedIndex == 0) // № перевезення
                    CommandText = CommandText + " AND ([Перевезення].[Номер] = '" + textBox1.Text + "')";
                if (comboBox1.SelectedIndex == 1) // № маршруту
                    CommandText = CommandText + " AND ([Маршрут].[Номер_маршруту] = '" + textBox1.Text + "') ";
                if (comboBox1.SelectedIndex == 2) // Пункт призначення
                    CommandText = CommandText + " AND ([Маршрут].[Пункт_призначення] "+
                        "LIKE '" + textBox1.Text + "%') ";
                if (comboBox1.SelectedIndex == 3) //Місце
                    CommandText = CommandText + " AND ([Білет].[Місце] LIKE '" + textBox1.Text + "%')";
                if (comboBox1.SelectedIndex == 4) //Вартість
                    CommandText = CommandText + " AND ([Білет].[Вартість] LIKE '" + textBox1.Text + "%')";
                if (comboBox1.SelectedIndex == 5) // Пасажир
                    CommandText = CommandText + " AND ([Білет].[П_І_Б_пасажира] LIKE '" + textBox1.Text + "%') ";
                if (comboBox1.SelectedIndex == 6) // Водій
                    CommandText = CommandText + " AND ([Водій].[П_І_Б_водія] LIKE '" + textBox1.Text + "%') ";
            }
            SqlDataAdapter dataAdapter = new SqlDataAdapter(CommandText, ConnectionString);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "[Перевезення]");
            dtGrVi_1.DataSource = ds.Tables["[Перевезення]"].DefaultView;
        }

        private void btnDod_Click(object sender, EventArgs e)
        {
            string CommandText;
            string num_per, ID_M, ID_B, ID_D, ID_A, ID_V;
            int row;

            Pereglad f = new Pereglad(); // створили нову форму
            if (f.ShowDialog() == DialogResult.OK)
            {
                // додаємо дані
                // Номер перевезення
                if (f.textBox1.Text == "") num_per = "0";
                else num_per = f.textBox1.Text;

                // Додаємо ID_Marshrut
                row = f.dtGr_Marsh.CurrentCell.RowIndex; // взяли рядок з dtGr_Marsh
                ID_M = Convert.ToString(f.dtGr_Marsh[0, row].Value);
                // Додаємо ID_Bilet
                row = f.dtGr_bilet.CurrentCell.RowIndex; // взяли рядок з dtGr_bilet
                ID_B = Convert.ToString(f.dtGr_bilet[0, row].Value);
                // Додаємо ID_Dispetcher
                row = f.dtGr_Vod.CurrentCell.RowIndex; // взяли рядок з dtGr_Vod
                ID_D = Convert.ToString(f.dtGr_Vod[0, row].Value);

                // Додаємо ID_Avtobus
                row = f.dtGr_Bus.CurrentCell.RowIndex; // взяли рядок з dtGr_Bus
                ID_A = Convert.ToString(f.dtGr_Bus[0, row].Value);
                // Додаємо ID_Vodij
                row = f.dtGr_Admin.CurrentCell.RowIndex; // взяли рядок з dtGr_Admin
                ID_V = Convert.ToString(f.dtGr_Admin[0, row].Value);
                // формуємо CommandText
                CommandText = "INSERT INTO [Перевезення] (Номер, ID_Marshrut, "+
                    "ID_Bilet, ID_Dispetcher, ID_Avtobus, ID_Vodij) " + " "+
                   " VALUES (" + num_per + ", " + ID_M + ", " + ID_B + ","+ 
                  " " + ID_D + ", " + ID_A + ", " + ID_V + ")";

                // виконуємо SQL-команду
                My_Execute_Non_Query(CommandText);
                // перемалювати dataGridView1
                btnZast_Click(sender, e);
            }
        }
        // виконання SQL-запиту для команд INSERT, UPDATE, DELETE

        public void My_Execute_Non_Query(string CommandText)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand myCommand = conn.CreateCommand();
            myCommand.CommandText = CommandText;
            myCommand.ExecuteNonQuery();
            conn.Close();
        }

        private void btnVyd_Click(object sender, EventArgs e)
        {
            {
                Vydalyt f = new Vydalyt();
                if (f.ShowDialog() == DialogResult.OK)
                {
                    int index, index_old;
                    string ID;
                    string CommandText = "DELETE FROM ";
                    index = dtGrVi_1.CurrentRow.Index; // № по порядку в таблиці представлення
                    index_old = index;
                    ID = Convert.ToString(dtGrVi_1[0, index].Value); // ID подаємо в запит як рядок

                    // Формуємо рядок CommandText
                    CommandText = "DELETE FROM [Перевезення] WHERE [Перевезення].[Номер] = '" + ID + "'";

                    // виконуємо SQL-запит
                    My_Execute_Non_Query(CommandText);

                    // перемальовування dbGridView1
                    btnZast_Click(sender, e);
                    if (index_old >= 0)
                    {
                        dtGrVi_1.ClearSelection();
                    }
                }

            }
        }
        private void Get_Bilets()  // читає усі поля з таблиці "Білет"
        {
            string CommandText = "SELECT ID_Bilet, Місце, Вартість,"+ 
                "[Час_купівлі], [П_І_Б_пасажира], Паспорт FROM [Білет]";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(CommandText, ConnectionString);

            // створюємо об'єкт DataSet
            DataSet ds = new DataSet();
            // заповнюємо dataGridView1 даними із таблиці "Білет" бази даних
            dataAdapter.Fill(ds, "[Білет]");
            dtGrVi_2.DataSource = ds.Tables[0].DefaultView;
            dtGrVi_2.Columns[0].Visible = false; // Ховаємо поле ID_Bilets
        }

        // Клік на кнопці "Білети" з групи "Перегляд"
        private void btnBilet_Click(object sender, EventArgs e)
        {
            Get_Bilets();
            act_table = 1;
        }
        private void Get_Marshruts()  // читає усі поля з таблиці "Маршрут"
        {
            string CommandText = "SELECT * FROM [Маршрут]";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(CommandText, ConnectionString);
            DataSet ds = new DataSet();  // створюємо об'єкт DataSet
            dataAdapter.Fill(ds, "[Маршрут]");
            dtGrVi_2.DataSource = ds.Tables[0].DefaultView;
            dtGrVi_2.Columns[0].Visible = false;
                   
       }
        private void btnMarsh_Click(object sender, EventArgs e)
        {
            Get_Marshruts();
            act_table = 2;
        }
        private void Get_Avtobus()  // читає усі поля з таблиці "Автобус"
        {
            string CommandText = "SELECT * FROM Автобус";
            SqlDataAdapter da = new SqlDataAdapter(CommandText, ConnectionString);
            DataSet ds = new DataSet();  // створюємо об'єкт DataSet
            da.Fill(ds, "Автобус"); // заповнюємо набір даних даними з таблиці "Автобус"
            dtGrVi_2.DataSource = ds.Tables[0].DefaultView;
            dtGrVi_2.Columns[0].Visible = false; // сховати нульовий стовпець (поле ID_Avtobus)

        }

        private void btnAuto_Click(object sender, EventArgs e)
        {
            Get_Avtobus();
            act_table = 3;
        }
        private void Get_Vodij()  // читає усі поля з таблиці "Водій"
        {
            string CommandText = "SELECT * FROM Водій";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(CommandText, ConnectionString);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "Водій");
            dtGrVi_2.DataSource = ds.Tables[0].DefaultView;
            dtGrVi_2.Columns[0].Visible = false;
        }
        private void btnVodiji_Click(object sender, EventArgs e)
        {
            Get_Vodij();
            act_table = 4;
        }

        // заповнює dataGridView2 даними з таблиці "Диспетчер"
        private void Get_Dispetcher()
        {
            string CommandText = "SELECT * FROM [Диспетчер]";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(CommandText, ConnectionString);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "Диспетчер");
            dtGrVi_2.DataSource = ds.Tables[0].DefaultView;
            dtGrVi_2.Columns[0].Visible = false;
        }
        private void btnDispet_Click(object sender, EventArgs e)
        {
            Get_Dispetcher();
            act_table = 5;
        }
        
        private void btnRMarsh_Click(object sender, EventArgs e)
        {
            Red_Marsh objFrmMain = new Red_Marsh();
            this.Hide();
            objFrmMain.Show();
        }

        private void btnRBil_Click(object sender, EventArgs e)
        {
            Red_Bilet objFrmMain = new Red_Bilet();
            this.Hide();
            objFrmMain.Show();
        }

        private void btnRBus_Click(object sender, EventArgs e)
        {
            Red_Bus objFrmMain = new Red_Bus();
            this.Hide();
            objFrmMain.Show();
        }

        private void btnRVod_Click(object sender, EventArgs e)
        {
         
            Red_Vod objFrmMain = new Red_Vod();
            this.Hide();
            objFrmMain.Show();
        }

        private void btnRDisp_Click(object sender, EventArgs e)
        {
            Red_Disp objFrmMain = new Red_Disp();
            this.Hide();
            objFrmMain.Show();
        }

        // додавання Білету через Connection і запит ExecuteNonQuery()
        private void Add_Bilet(string misce, string vartist, 
            DateTime chas, string name, string passport)
        {
            string CommandText;
            string s_chas;
            string s_v;

            s_chas = Convert.ToString(chas);
            s_v = vartist.Replace(',', '.');

            CommandText = "INSERT INTO [Білет] (Місце, Вартість, [Час_купівлі],"+ 
                "[П_І_Б_пасажира], Паспорт) " + " "+
            "VALUES ('" + misce + "', " + s_v + ", '" + s_chas + "',"+ 
            "'"+ name + "', '" + passport + "')";

            My_Execute_Non_Query(CommandText);
        }

        private void Add_Marshrut(string num_marsh, string punkt, 
            string rajon, string oblast, double vidstan, double vaha, 
            DateTime chas_vidpr, DateTime chas_prub)
        {
            string CommandText;
            string s_vidpr, s_prub;
            string s_vaha, s_vidst;

            s_vidpr = Convert.ToString(chas_vidpr);
            s_prub = Convert.ToString(chas_prub);
            s_vaha = Convert.ToString(vaha);
            s_vaha = s_vaha.Replace(',', '.');
            s_vidst = Convert.ToString(vidstan);
            s_vidst = s_vidst.Replace(',', '.');

            CommandText = "INSERT INTO [Маршрут] ([Номер_маршруту], [Пункт_призначення],"+ 
               " Район, Область, Відстань, Вага, [Час_відправлення], [Час_прибуття])"
             + " VALUES ('" + num_marsh + "', '" + punkt + "', '" + rajon + "', '" + oblast + "', "
             + s_vidst + ", " + s_vaha + ", '" + s_vidpr + "', '" + s_prub + "')";

            My_Execute_Non_Query(CommandText);
        }

        void Add_Avtobus(string num, string model, string znak, string k_misc)
        {
            string CommandText;
            CommandText = "INSERT INTO [Автобус] ([Номер], [Модель],"+ 
                "[Номерний_знак], [Кількість_місць])"
                + " VALUES ('" + num + "', '" + model + "', '" + znak + "', " + k_misc + ")";
            My_Execute_Non_Query(CommandText);
        }

        void Add_Vodij(string p_i_b, string d_nar, string passport) // додати водія
        {
            string CommandText;
            CommandText = "INSERT INTO [Водій] ([П_І_Б_водія], [Дата_народження], [Паспорт])"
                        + " VALUES ('" + p_i_b + "', '" + d_nar + "', '" + passport + "')";
            My_Execute_Non_Query(CommandText);
        }

        void Add_Dispetcher(string p_i_b, string d_nar, string adresa) // додати водія
        {
            string CommandText;
            CommandText = "INSERT INTO [Диспетчер] ([П_І_Б_диспетчера], [Дата_народження], [Адреса])"
                        + " VALUES ('" + p_i_b + "', '" + d_nar + "', '" + adresa + "')";
            My_Execute_Non_Query(CommandText);
        }

        private void btn_Dod_Click(object sender, EventArgs e)
        {
            if (act_table == 1) // обробляємо таблицю білети
            {
                Dod_bilet f = new Dod_bilet();

                if (f.ShowDialog() == DialogResult.OK)
                {
                    // додаємо дані в таблицю "Білети"
                    Add_Bilet(f.txtmis.Text, f.txtvar.Text, Convert.ToDateTime(f.txt_1.Text),
                              f.txtpib.Text, f.txtpas.Text);
                    Get_Bilets();
                }
            }
            else
  if (act_table == 2) // обробляємо таблицю "Маршрут"
            {
                Dod_Marsh f = new Dod_Marsh();
                if (f.ShowDialog() == DialogResult.OK)
                {
                    // додаємо дані в таблицю "Маршрут"
                    Add_Marshrut(f.txt_num.Text, f.txt_punkt.Text, f.txt_raj.Text, f.txt_obl.Text,
                                 Convert.ToDouble(f.txt_vids.Text), Convert.ToDouble(f.txt_vaga.Text),
                                 f.dtTiPi_1.Value, f.dtTiPi_2.Value);
                    Get_Marshruts();
                }
            }
            else
  if (act_table == 3) // обробляємо таблицю "Автобус"
            {
                Dod_Bus f = new Dod_Bus();
                if (f.ShowDialog() == DialogResult.OK)
                {
                    // додаємо дані в таблицю "Автобус"
                    Add_Avtobus(f.txt_numer.Text, f.txt_model.Text, 
                        f.txt_numznak.Text, f.txt_kilmis.Text);
                    Get_Avtobus();
                }
            }
            else
  if (act_table == 4) // обробляємо таблицю "Водій"
            {
                Dod_vodij f = new Dod_vodij();
                if (f.ShowDialog() == DialogResult.OK)
                {
                    // додаємо дані в таблицю "Водій"
                    Add_Vodij(f.txt_pib.Text, Convert.ToString(f.dtTiPi_1.Value), f.txt_pas.Text);
                    Get_Vodij();
                }
            }
            else
  if (act_table == 5) // обробляємо таблицю "Диспетчер"
            {
                Dod_Disp f = new Dod_Disp();
                if (f.ShowDialog() == DialogResult.OK)
                {
                    // додаємо дані в таблицю "Водій"
                    Add_Dispetcher(f.txt_pib.Text, Convert.ToString(f.dtTiPi_1.Value), f.txt_adres.Text);
                    Get_Dispetcher();
                }
            }
        }

        private void btn_Vyd_Click(object sender, EventArgs e)
        {
            Vydalyt f = new Vydalyt();

            if (f.ShowDialog() == DialogResult.OK)
            {
                int index, index_old;
                string ID;
                string CommandText = "DELETE FROM ";

                index = dtGrVi_2.CurrentRow.Index; // № по порядку в таблиці представлення
                index_old = index;
                ID = Convert.ToString(dtGrVi_2[0, index].Value); // ID подаємо в запит як рядок

                // Формуємо рядок CommandText
                if (act_table == 1) // обробляємо таблицю "Білет"
                    CommandText = "DELETE FROM Білет WHERE Білет.ID_Bilet = " + ID;
                if (act_table == 2) // обробляємо таблицю "Маршрут"
                    CommandText = "DELETE FROM Маршрут WHERE Маршрут.ID_Marshrut = " + ID;
                if (act_table == 3) // обробляємо таблицю "Автобус"
                    CommandText = "DELETE FROM Автобус WHERE Автобус.ID_Avtobus = " + ID;
                if (act_table == 4) // обробляємо таблицю "Водій"
                    CommandText = "DELETE FROM Водій WHERE Водій.ID_Vodij = " + ID;
                if (act_table == 5) // обробляємо таблицю "Диспетчер"
                    CommandText = "DELETE FROM Диспетчер WHERE Диспетчер.ID_Dispetcher = " + ID;

                // виконуємо SQL-запит
                My_Execute_Non_Query(CommandText);

                // перемальовування dbGridView2
                if (act_table == 1) Get_Bilets();
                else
                if (act_table == 2) Get_Marshruts();
                else
                if (act_table == 3) Get_Avtobus();
                else
                if (act_table == 4) Get_Vodij();
                else
                if (act_table == 5) Get_Dispetcher();

                if (index_old >= 0)
                {
                    dtGrVi_2.ClearSelection();
                    dtGrVi_2[0, index_old].Selected = true;
                }
            }
        }

        private void toolStripMenuItem13_Click(object sender, EventArgs e)
        {
            About_program b = new About_program();
            b.ShowDialog();
        }

        private void toolStripMenuItem4_Click(object sender, EventArgs e)
        {
            Form_Registation objFrmMain = new Form_Registation();
            this.Hide();
            objFrmMain.Show();
        }

        private void toolStripMenuItem5_Click(object sender, EventArgs e)
        {
            Close();
        }

    }
 }
     
       
      
    
    
     


