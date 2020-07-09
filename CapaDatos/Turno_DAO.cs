using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
