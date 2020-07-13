using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class EmpleadoTurno_DAO
    {
        Modelo1Container BD = new Modelo1Container();

        public void Ingresar(EmpleadoTurno u)
        {
            BD.EmpleadoTurnoSet.Add(u);
            BD.SaveChanges();
        }
        public List<EmpleadoTurno> Listar()
        {
            List<Empleado> empleados = (from c in BD.EmpleadoSet select c).ToList();
            List<Turno> turnos = (from c in BD.TurnoSet select c).ToList();
            List<EmpleadoTurno> empleadoTurno = (from c in BD.EmpleadoTurnoSet select c).ToList();

            List<EmpleadoTurno> relacionEmpleadoTurno = (from r in empleadoTurno
                                        join e in empleados on r.EmpleadoId_empleado equals e.Id_empleado
                                        //into table1 from e in table1.ToList()
                                        join t in turnos on r.TurnoId_turno equals t.Id_turno
                                        //into table2 from t in table2.ToList()
                                        select new EmpleadoTurno
                                        {
                                            Id_EmpleadoTurno = r.Id_EmpleadoTurno,
                                            Empleado = e,
                                            Turno = t
                                        }).ToList();
            return relacionEmpleadoTurno;
        }
        public EmpleadoTurno Buscar(int u)
        {
            var relacion = BD.EmpleadoTurnoSet.Find(u);
            return relacion;
        }
        public void Modificar(EmpleadoTurno u)
        {
            EmpleadoTurno EmpleadoTurnoOld = BD.EmpleadoTurnoSet.Where(c => c.Id_EmpleadoTurno == u.Id_EmpleadoTurno).SingleOrDefault();
            EmpleadoTurnoOld.EmpleadoId_empleado = u.EmpleadoId_empleado;
            EmpleadoTurnoOld.TurnoId_turno = u.TurnoId_turno;
            BD.SaveChanges();
        }
        public void Eliminar(int id)
        {
            EmpleadoTurno relacion = BD.EmpleadoTurnoSet.Find(id);
            BD.EmpleadoTurnoSet.Remove(relacion);
            BD.SaveChanges();
        }
    }
}
