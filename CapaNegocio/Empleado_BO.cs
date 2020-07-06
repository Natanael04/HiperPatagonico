using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class Empleado_BO
    {
        Empleado_DAO empleado_DAO = new Empleado_DAO();
        public string Ingresar(Empleado u)
        {
            string sw = " ";
            try
            {
                empleado_DAO.Ingresar(u);
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            return sw;
        }
        public List<Empleado> Listar()
        {
            return empleado_DAO.Listar();
        }
        public void Modificar(Empleado u)
        {
            empleado_DAO.Modificar(u);
        }
        public Empleado Buscar(int u)
        {
            var empelado = empleado_DAO.Buscar(u);
            return empelado;
        }
        public void Eliminar(int id)
        {
            empleado_DAO.Eliminar(id);
        }
    }
}
