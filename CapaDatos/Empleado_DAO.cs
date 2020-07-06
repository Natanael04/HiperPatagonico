using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
