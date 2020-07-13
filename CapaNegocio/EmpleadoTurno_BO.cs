using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class EmpleadoTurno_BO
    {
        EmpleadoTurno_DAO empleadoTurno_DAO = new EmpleadoTurno_DAO();
        public string Ingresar(EmpleadoTurno u)
        {
            string sw = " ";
            try
            {
                empleadoTurno_DAO.Ingresar(u);
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            return sw;
        }
        public List<EmpleadoTurno> Listar()
        {
            return empleadoTurno_DAO.Listar();
        }
        public void Modificar(EmpleadoTurno u)
        {
            empleadoTurno_DAO.Modificar(u);
        }
        public EmpleadoTurno Buscar(int u)
        {
            var relacion = empleadoTurno_DAO.Buscar(u);
            return relacion;
        }
        public void Eliminar(int id)
        {
            empleadoTurno_DAO.Eliminar(id);
        }
    }
}
