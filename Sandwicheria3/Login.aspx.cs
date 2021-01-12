using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Sandwicheria3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //cadena de conexion con SQL Server pero tenemos que agregar una biblioteca "using System.Data.SqlClient;"
            //o la cadena de conexion con la base de datos no podemos hacer.
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;

            //Sql creamos la variable conexion para luego almacenar datos en ella y poder crear la comprobacion de datos.
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select rut_user, clave from usuarios where rut_user='" + TextBox1.Text + "'and clave='" + TextBox2.Text + "'", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            //si los datos son correctos nos retorna a una pagina nueva y si no arrojara un texto de datos "incorrectos".
            if (registro.Read())
            {
                Response.Redirect("IngresarPedido.aspx?Rut=" + TextBox1.Text);
            }
            else
            {
                Label4.Visible = true;
                Label4.Text = "Rut o Clave son incorrectos.";
            }
            conexion.Close();
        }
    }
}