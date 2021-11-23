using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace llamadaTrasladoProdBodegas
{
    public partial class frmMantenimientoBodegas : Form
    {
        public frmMantenimientoBodegas()
        {
            InitializeComponent();

            TextBox[] alias = navegador1.funAsignandoTexts(this);
            navegador1.funAsignarAliasVista(alias, "bodega", "TrasladoProd");
            navegador1.funAsignarSalidadVista(this);

            navegador1.pideGrid(this.dvgConsulta);
            navegador1.llenaTabla();
            navegador1.pedirRef(this);

        }

        private void radioButton1_MouseClick(object sender, MouseEventArgs e)
        {
            navegador1.funCambioEstatusRBVista(txtEstatus, radioButton1, "A");
        }

        private void radioButton2_MouseClick(object sender, MouseEventArgs e)
        {
            navegador1.funCambioEstatusRBVista(txtEstatus, radioButton2, "I");
        }

        private void txtEstatus_TextChanged(object sender, EventArgs e)
        {
            navegador1.funSetearRBVista(radioButton1, radioButton2, txtEstatus);
        }
    }
}
