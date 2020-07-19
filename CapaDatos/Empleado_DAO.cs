using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Empleado_DAO
    {
        Modelo1Container BD = new Modelo1Container();

        public void Ingresar(Empleado u)
        {
            BD.EmpleadoSet.Add(u);
            BD.SaveChanges();
        }
        public List<Empleado> Listar()
        {
            List<Empleado> lista = (from c in BD.EmpleadoSet select c).ToList();
            return lista;
        }

        public List<Empleado> ListaFiltrada()
        {
            Empleado empleado = new Empleado();
            List<Empleado> lista = new List<Empleado>();

            SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-7FO13N5P\SQLEXPRESS;Initial Catalog=control_horarios;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.EmpleadoSet AS t1 WHERE NOT EXISTS(SELECT NULL FROM dbo.EmpleadoTurnoSet AS t2 WHERE t2.EmpleadoId_empleado = t1.Id_empleado)", con);

            con.Open();
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read()){

                lista.Add(
                        new Empleado { 
                            Id_empleado = Convert.ToInt32(dr["Id_empleado"].ToString()), 
                            nombre = dr["nombre"].ToString(),
                            apellido = dr["apellido"].ToString()
                        }
                    );
                }
            dr.Close();
                
            if (con.State == ConnectionState.Open){
                con.Close();
            }
            return lista;
        }

        public Empleado Buscar(int u)
        {
            var user = BD.EmpleadoSet.Find(u);
            return user;
        }
        public void Modificar(Empleado u)
        {
            Empleado empleadoOld = BD.EmpleadoSet.Where(c => c.Id_empleado == u.Id_empleado).SingleOrDefault();
            empleadoOld.nombre = u.nombre;
            empleadoOld.apellido = u.apellido;
            BD.SaveChanges();
        }
        public void Eliminar(int id)
        {
            Empleado empleado = BD.EmpleadoSet.Find(id);
            BD.EmpleadoSet.Remove(empleado);
            BD.SaveChanges();
        }
    }
}
