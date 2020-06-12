
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/11/2020 23:47:52
-- Generated from EDMX file: C:\Users\henri\source\repos\HiperPatagonico\CapaDatos\Modelo1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [control_horarios];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsuarioRol]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioSet] DROP CONSTRAINT [FK_UsuarioRol];
GO
IF OBJECT_ID(N'[dbo].[FK_HorarioTurno]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TurnoSet] DROP CONSTRAINT [FK_HorarioTurno];
GO
IF OBJECT_ID(N'[dbo].[FK_HorarioEmpleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmpleadoSet] DROP CONSTRAINT [FK_HorarioEmpleado];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_HorarioUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioSet] DROP CONSTRAINT [FK_Usuario_HorarioUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_HorarioHorario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HorarioSet] DROP CONSTRAINT [FK_Usuario_HorarioHorario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO
IF OBJECT_ID(N'[dbo].[EmpleadoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmpleadoSet];
GO
IF OBJECT_ID(N'[dbo].[TurnoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TurnoSet];
GO
IF OBJECT_ID(N'[dbo].[HorarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HorarioSet];
GO
IF OBJECT_ID(N'[dbo].[RolSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RolSet];
GO
IF OBJECT_ID(N'[dbo].[Usuario_HorarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario_HorarioSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [Id_usuario] int IDENTITY(1,1) NOT NULL,
    [rut] nvarchar(max)  NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [apellido] nvarchar(max)  NOT NULL,
    [contraseña] nvarchar(max)  NOT NULL,
    [Id_rol] nvarchar(max)  NOT NULL,
    [Rol_Id_rol] int  NOT NULL,
    [Usuario_Horario_Id_usuarioHorario] int  NOT NULL
);
GO

-- Creating table 'EmpleadoSet'
CREATE TABLE [dbo].[EmpleadoSet] (
    [Id_empleado] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [apellido] nvarchar(max)  NOT NULL,
    [Horario_Id_horario] int  NOT NULL
);
GO

-- Creating table 'TurnoSet'
CREATE TABLE [dbo].[TurnoSet] (
    [Id_turno] int IDENTITY(1,1) NOT NULL,
    [codigo] nvarchar(max)  NOT NULL,
    [horaInicio] nvarchar(max)  NOT NULL,
    [horaTermino] nvarchar(max)  NOT NULL,
    [Horario_Id_horario] int  NOT NULL
);
GO

-- Creating table 'HorarioSet'
CREATE TABLE [dbo].[HorarioSet] (
    [Id_horario] int IDENTITY(1,1) NOT NULL,
    [Id_empleado] nvarchar(max)  NOT NULL,
    [Id_turno] nvarchar(max)  NOT NULL,
    [Usuario_Horario_Id_usuarioHorario] int  NOT NULL
);
GO

-- Creating table 'RolSet'
CREATE TABLE [dbo].[RolSet] (
    [Id_rol] int IDENTITY(1,1) NOT NULL,
    [nombreRol] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Usuario_HorarioSet'
CREATE TABLE [dbo].[Usuario_HorarioSet] (
    [Id_usuarioHorario] int IDENTITY(1,1) NOT NULL,
    [Id_usuario] nvarchar(max)  NOT NULL,
    [Id_horario] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id_usuario] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([Id_usuario] ASC);
GO

-- Creating primary key on [Id_empleado] in table 'EmpleadoSet'
ALTER TABLE [dbo].[EmpleadoSet]
ADD CONSTRAINT [PK_EmpleadoSet]
    PRIMARY KEY CLUSTERED ([Id_empleado] ASC);
GO

-- Creating primary key on [Id_turno] in table 'TurnoSet'
ALTER TABLE [dbo].[TurnoSet]
ADD CONSTRAINT [PK_TurnoSet]
    PRIMARY KEY CLUSTERED ([Id_turno] ASC);
GO

-- Creating primary key on [Id_horario] in table 'HorarioSet'
ALTER TABLE [dbo].[HorarioSet]
ADD CONSTRAINT [PK_HorarioSet]
    PRIMARY KEY CLUSTERED ([Id_horario] ASC);
GO

-- Creating primary key on [Id_rol] in table 'RolSet'
ALTER TABLE [dbo].[RolSet]
ADD CONSTRAINT [PK_RolSet]
    PRIMARY KEY CLUSTERED ([Id_rol] ASC);
GO

-- Creating primary key on [Id_usuarioHorario] in table 'Usuario_HorarioSet'
ALTER TABLE [dbo].[Usuario_HorarioSet]
ADD CONSTRAINT [PK_Usuario_HorarioSet]
    PRIMARY KEY CLUSTERED ([Id_usuarioHorario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Rol_Id_rol] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [FK_UsuarioRol]
    FOREIGN KEY ([Rol_Id_rol])
    REFERENCES [dbo].[RolSet]
        ([Id_rol])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioRol'
CREATE INDEX [IX_FK_UsuarioRol]
ON [dbo].[UsuarioSet]
    ([Rol_Id_rol]);
GO

-- Creating foreign key on [Horario_Id_horario] in table 'TurnoSet'
ALTER TABLE [dbo].[TurnoSet]
ADD CONSTRAINT [FK_HorarioTurno]
    FOREIGN KEY ([Horario_Id_horario])
    REFERENCES [dbo].[HorarioSet]
        ([Id_horario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HorarioTurno'
CREATE INDEX [IX_FK_HorarioTurno]
ON [dbo].[TurnoSet]
    ([Horario_Id_horario]);
GO

-- Creating foreign key on [Horario_Id_horario] in table 'EmpleadoSet'
ALTER TABLE [dbo].[EmpleadoSet]
ADD CONSTRAINT [FK_HorarioEmpleado]
    FOREIGN KEY ([Horario_Id_horario])
    REFERENCES [dbo].[HorarioSet]
        ([Id_horario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HorarioEmpleado'
CREATE INDEX [IX_FK_HorarioEmpleado]
ON [dbo].[EmpleadoSet]
    ([Horario_Id_horario]);
GO

-- Creating foreign key on [Usuario_Horario_Id_usuarioHorario] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [FK_Usuario_HorarioUsuario]
    FOREIGN KEY ([Usuario_Horario_Id_usuarioHorario])
    REFERENCES [dbo].[Usuario_HorarioSet]
        ([Id_usuarioHorario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_HorarioUsuario'
CREATE INDEX [IX_FK_Usuario_HorarioUsuario]
ON [dbo].[UsuarioSet]
    ([Usuario_Horario_Id_usuarioHorario]);
GO

-- Creating foreign key on [Usuario_Horario_Id_usuarioHorario] in table 'HorarioSet'
ALTER TABLE [dbo].[HorarioSet]
ADD CONSTRAINT [FK_Usuario_HorarioHorario]
    FOREIGN KEY ([Usuario_Horario_Id_usuarioHorario])
    REFERENCES [dbo].[Usuario_HorarioSet]
        ([Id_usuarioHorario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_HorarioHorario'
CREATE INDEX [IX_FK_Usuario_HorarioHorario]
ON [dbo].[HorarioSet]
    ([Usuario_Horario_Id_usuarioHorario]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------