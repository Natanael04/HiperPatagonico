using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class Usuario_DAO
    {
        Modelo1Container BD = new Modelo1Container();

        public void Ingresar(Usuario u)
        {
            BD.UsuarioSet.Add(u);
            BD.SaveChanges();
        }
        public List<Usuario> Listar()
        {
            List<Usuario> lista = (from c in BD.UsuarioSet select c).ToList();
            return lista;
        }
        public void Modificar(Usuario u)
        {
            Usuario userOld = BD.UsuarioSet.Single(c => c.Id_usuario == u.Id_usuario);
            userOld.rut = u.rut;
            userOld.nombre = u.nombre;
            userOld.apellido = u.apellido;
            userOld.contraseña = u.contraseña;
            userOld.rol = u.rol;
            BD.SaveChanges();
        }
    }
}
