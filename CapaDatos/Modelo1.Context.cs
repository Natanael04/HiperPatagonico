﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Modelo1Container : DbContext
    {
        public Modelo1Container()
            : base("name=Modelo1Container")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Usuario> UsuarioSet { get; set; }
        public virtual DbSet<Empleado> EmpleadoSet { get; set; }
        public virtual DbSet<Turno> TurnoSet { get; set; }
        public virtual DbSet<EmpleadoTurno> EmpleadoTurnoSet { get; set; }
    }
}
