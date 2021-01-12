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
    public partial class IngresarPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnagregar_Click(object sender, EventArgs e)
        {
            //String para almacenar en columnas
            string nombresandwich = DropDownList1.SelectedValue;
            string nombreagregado = DropDownList2.SelectedValue;

            //respectivos valores de sandwich y agregado, junto con un total equivalente a 0 para la operación suma
            int sandwich = 800;
            int agregado = 200;
            int total = 0;

            //Asignamos cantidad en el TextBox1 que es la cantidad de porcion del pedido + un label donde mostraremos su total
            int cantidad = int.Parse(TextBox1.Text);
            int lbtotal = int.Parse(Label4.Text);

            //Operacion Total Sandwich mas Agregado con la cantidad
            total = (sandwich + agregado) * cantidad;

            //Codigo Tabla GridViewRow (No Manipular)
            GridViewRow renglon = GridView1.SelectedRow;

            /*rellenamos datos de nuestra tabla para  luego solicitarlos
            junto con una "Session" que esto significa que por cada pedido o el rechazo de uno sean Sessiones distintas
            y no la misma y que se sobre escriba*/
            DataTable detalles = null;
            if (Session["dt"] != null)
                detalles = Session["dt"] as DataTable;
            else
            {
                detalles = new DataTable();
                detalles.Columns.Add("Sandwich");//0
                detalles.Columns.Add("Agregado");//1
                detalles.Columns.Add("cantidad");//2
            }

            DataRow registro = detalles.NewRow();
            registro[0] = DropDownList1.SelectedValue;
            registro[1] = DropDownList2.SelectedValue;
            registro[2] = TextBox1.Text;
            detalles.Rows.Add(registro);

            GridView1.DataSource = detalles;
            GridView1.DataBind();

            Session["dt"] = detalles;
            //Fin Codigo Tabla (No Tocar)

            //Mandar Resultado al label
            lbtotal = (total + lbtotal);
            Label4.Text = lbtotal.ToString();

            //Conexion Insercion
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("insert into pedidos(cantidad_ped,total_ped,rut_user_ped,nombre_tipo_ped,nombre_agregado_ped) values (" + cantidad + "," + total + ",'" + Request.QueryString["Rut"] + "','" + nombresandwich + "','" + nombreagregado + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int lbtotal = int.Parse(Label4.Text);
            int numero;
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("insert into entrega(nombre_entre,direccion_entre,telefono_entre,rut_us_entre) values ('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + Request.QueryString["Rut"] + "')", conexion);
            numero = comando.ExecuteNonQuery();
            if (numero == 1)
            {
                Response.Redirect("DetallePedido.aspx?Rut=" + Request.QueryString["Rut"] + "&total=" + lbtotal);
            }
            conexion.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("delete from pedidos where rut_user_ped='" + Request.QueryString["Rut"] + "'", conexion);
            comando.ExecuteNonQuery();
            Response.Redirect("Login.aspx");
            conexion.Close();
        }
    }
}