using System;
using System.Windows.Forms;

namespace Kursova_DAV
{
    public partial class Dod_Marsh : Form
    {
        public Dod_Marsh()
        {
            InitializeComponent();
        }
        private void btn_Dod_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }
        private void btn_Vyd_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.No;
        }
        private void Dod_Marsh_Load(object sender, EventArgs e)
        {
        }
    }
}
