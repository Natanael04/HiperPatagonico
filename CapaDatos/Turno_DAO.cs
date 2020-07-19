using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Turno_DAO
    {
        Modelo1Container BD = new Modelo1Container();

        public void Ingresar(Turno u)
        {
            BD.TurnoSet.Add(u);
            BD.SaveChanges();
        }
        public List<Turno> Listar()
        {
            List<Turno> lista = (from c in BD.TurnoSet select c).ToList();
            return lista;
        }
        public List<Turno> ListaFiltrada()
        {
            Turno turno = new Turno();
            List<Turno> lista = new List<Turno>();

            SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-7FO13N5P\SQLEXPRESS;Initial Catalog=control_horarios;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.TurnoSet AS t1 WHERE NOT EXISTS(SELECT NULL FROM dbo.EmpleadoTurnoSet AS t2 WHERE t2.TurnoId_turno = t1.Id_turno)", con);

            con.Open();
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                lista.Add(
                        new Turno
                        {
                            Id_turno = Convert.ToInt32(dr["Id_turno"].ToString()),
                            codigo = dr["codigo"].ToString(),
                            horaInicio = dr["horaInicio"].ToString(),
                            horaTermino = dr["horaTermino"].ToString(),
                        }
                    );
            }
            dr.Close();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return lista;
        }
        public Turno Buscar(int u)
        {
            var turno = BD.TurnoSet.Find(u);
            return turno;
        }
        public void Modificar(Turno u)
        {
            Turno turnoOld = BD.TurnoSet.Where(c => c.Id_turno == u.Id_turno).SingleOrDefault();
            turnoOld.codigo = u.codigo;
            turnoOld.horaInicio = u.horaInicio;
            turnoOld.horaTermino = u.horaTermino;
            BD.SaveChanges();
        }
        public void Eliminar(int id)
        {
            Turno turno = BD.TurnoSet.Find(id);
            BD.TurnoSet.Remove(turno);
            BD.SaveChanges();
        }
    }
}
