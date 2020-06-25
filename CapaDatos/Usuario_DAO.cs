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
        public Usuario Buscar(int u)
        {
            var user = BD.UsuarioSet.Find(u);
            return user;
        }
        public void Modificar(Usuario u)
        {
            Usuario userOld = BD.UsuarioSet.Where(c => c.Id_usuario == u.Id_usuario).SingleOrDefault();
            userOld.rut = u.rut;
            userOld.nombre = u.nombre;
            userOld.apellido = u.apellido;
            userOld.contraseña = u.contraseña;
            userOld.rol = u.rol;
            BD.SaveChanges();
        }
        public void Eliminar(int id)
        {
            Usuario user = BD.UsuarioSet.Find(id);
            BD.UsuarioSet.Remove(user);
            BD.SaveChanges();
        }
    }
}
