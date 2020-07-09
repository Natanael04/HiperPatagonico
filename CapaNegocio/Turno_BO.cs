using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class Turno_BO
    {
        Turno_DAO turno_DAO = new Turno_DAO();
        public string Ingresar(Turno u)
        {
            string sw = " ";
            try
            {
                turno_DAO.Ingresar(u);
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            return sw;
        }
        public List<Turno> Listar()
        {
            return turno_DAO.Listar();
        }
        public void Modificar(Turno u)
        {
            turno_DAO.Modificar(u);
        }
        public Turno Buscar(int u)
        {
            var turno = turno_DAO.Buscar(u);
            return turno;
        }
        public void Eliminar(int id)
        {
            turno_DAO.Eliminar(id);
        }
    }
}
