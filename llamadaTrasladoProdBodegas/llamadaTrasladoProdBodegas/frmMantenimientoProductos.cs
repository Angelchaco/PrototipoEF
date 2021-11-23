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
    public partial class frmMantenimientoProductos : Form
    {
        public frmMantenimientoProductos()
        {
            InitializeComponent();

            TextBox[] alias = navegador1.funAsignandoTexts(this);
            navegador1.funAsignarAliasVista(alias, "producto", "TrasladoProd");
            navegador1.funAsignarSalidadVista(this);
            
            navegador1.pideGrid(this.dvgConsulta);
            navegador1.llenaTabla();
            navegador1.pedirRef(this);

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            String dt = "";
            dt = dtProducto.Value.ToString("yyyy-MM-dd");//lo pasa al formato necesitado por mysql
            txtFecha.Text = dt;
            // MessageBox.Show(txtFecha.Text);
        }

        private void txtFecha_TextChanged(object sender, EventArgs e)
        {
            navegador1.funTextBoxDPTVista(dtProducto, txtFecha);
            navegador1.funDPTextBoxVista(dtProducto, txtFecha);
        }

        private void dtProducto_ValueChanged(object sender, EventArgs e)
        {
            navegador1.funDPTextBoxVista(dtProducto, txtFecha);
        }

        private void txtEstatus_TextChanged(object sender, EventArgs e)
        {
            navegador1.funSetearRBVista(radioButton1, radioButton2, txtEstatus);
        }

        private void radioButton1_MouseClick(object sender, MouseEventArgs e)
        {
            navegador1.funCambioEstatusRBVista(txtEstatus, radioButton1, "A");
        }

        private void radioButton2_MouseClick(object sender, MouseEventArgs e)
        {
            navegador1.funCambioEstatusRBVista(txtEstatus, radioButton2, "I");
        }
    }
}
