using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Sandwicheria3
{
    public partial class DetallePedido : System.Web.UI.Page
    {
        public SqlConnection cn = new SqlConnection("Data Source=LAPTOP-264MMD4M;Initial Catalog=sandwicheria;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Agregamos nuestra consulta con data adapter donde rellenaremos datos
            SqlDataAdapter da = new SqlDataAdapter("select nombre_tipo_ped as 'Sandwich',nombre_agregado_ped as 'Agregado', cantidad_ped as 'Cantidad', total_ped as 'Total' from pedidos pe, productos pr, agregados ag where pe.nombre_tipo_ped=pr.nombre_ti and pe.nombre_agregado_ped=ag.nombre_ag and pe.rut_user_ped='" + Request.QueryString["Rut"] + "'", cn);
            
            //Contenedor de consultas almacenamos en datatable
            DataTable dt = new DataTable();
            
            //llenamos la data a nuestro datatable
            da.Fill(dt);
            
            //agregamos a nuestro gridview origen de datos
            this.GridView1.DataSource = (dt);
            GridView1.DataBind();

            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select nombre_entre,direccion_entre,telefono_entre from entrega en where en.rut_us_entre='" + Request.QueryString["Rut"] + "'", conexion);
            SqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                //Labels: 4-6-8
                Label4.Text = "" + registro["nombre_entre"];
                Label6.Text = "" + registro["direccion_entre"];
                Label8.Text = "" + registro["telefono_entre"];
                Label2.Text = "$" + Request.QueryString["total"];
            }
            conexion.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int numero;
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("delete from pedidos where rut_user_ped='" + Request.QueryString["Rut"] + "'", conexion);
            numero = comando.ExecuteNonQuery();
            if (numero >= 1)
            {
                Response.Redirect("Login.aspx");
            }
            conexion.Close();
        }
    }
}