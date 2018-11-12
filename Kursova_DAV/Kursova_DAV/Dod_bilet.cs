using System;
using System.Windows.Forms;

namespace Kursova_DAV
{
    public partial class Dod_bilet : Form
    {
        public Dod_bilet()
        {
            InitializeComponent();
            dtTiPi_1.Format = DateTimePickerFormat.Custom;
            dtTiPi_1.ValueChanged += dtTiPi_1_ValueChanged;
           
        }
   
        private void Dod_bilet_Load(object sender, EventArgs e)
        {
            
        }
        private void dtTiPi_1_ValueChanged(object sender, EventArgs e)
        {
            txt_1.Text = dtTiPi_1.Value.ToString("dd.MM.yyyy H:mm:ss");
        }
        private void btn_Dod_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
        private void btn_Vyd_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.No;
        }
    }
}
