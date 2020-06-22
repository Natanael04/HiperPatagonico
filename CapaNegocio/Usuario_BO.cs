using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class Usuario_BO
    {
        Usuario_DAO user_DAO = new Usuario_DAO();
        public string Ingresar(Usuario u)
        {
            string sw = " ";
            try
            {
                user_DAO.Ingresar(u);
            }
            catch (Exception ex)
            {
                sw = ex.Message;
            }
            return sw;
        }
        public List<Usuario> Listar()
        {
            return user_DAO.Listar();
        }
        public void Modificar(Usuario u)
        {
            user_DAO.Modificar(u);
        }
    }
}
