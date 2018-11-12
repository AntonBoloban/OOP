using System;
using System.Windows.Forms;

namespace Kursova_DAV
{
    public partial class Dod_vodij : Form
    {
        public Dod_vodij()
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
    }
}
