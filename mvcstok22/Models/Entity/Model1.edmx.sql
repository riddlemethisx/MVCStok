
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/04/2022 10:54:29
-- Generated from EDMX file: C:\Users\EREN\Documents\Visual Studio 2019\Projects\MVCSTOK\Models\Entity\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [mvcstok];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_satis_musteriler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[satis] DROP CONSTRAINT [FK_satis_musteriler];
GO
IF OBJECT_ID(N'[dbo].[FK_satis_urunler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[satis] DROP CONSTRAINT [FK_satis_urunler];
GO
IF OBJECT_ID(N'[dbo].[FK_urunler_kategoriler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[urunler] DROP CONSTRAINT [FK_urunler_kategoriler];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[kategoriler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[kategoriler];
GO
IF OBJECT_ID(N'[dbo].[musteriler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[musteriler];
GO
IF OBJECT_ID(N'[dbo].[satis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[satis];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[urunler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[urunler];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'kategoriler'
CREATE TABLE [dbo].[kategoriler] (
    [KATEGORIID] int IDENTITY(1,1) NOT NULL,
    [KATEGORIAD] nchar(50)  NULL
);
GO

-- Creating table 'musteriler'
CREATE TABLE [dbo].[musteriler] (
    [MUSTERID] int IDENTITY(1,1) NOT NULL,
    [MUSTERAD] nchar(10)  NULL,
    [MUSTERISOYAD] nchar(10)  NULL
);
GO

-- Creating table 'satis'
CREATE TABLE [dbo].[satis] (
    [SATISID] int IDENTITY(1,1) NOT NULL,
    [URUN] int  NULL,
    [MUSTERI] int  NULL,
    [ADET] int  NULL,
    [FIYAT] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'urunler'
CREATE TABLE [dbo].[urunler] (
    [URUNID] int IDENTITY(1,1) NOT NULL,
    [URUNAD] nchar(50)  NULL,
    [URUNKATEGORI] int  NULL,
    [FIYAT] int  NULL,
    [MARKA] nchar(50)  NULL,
    [STOK] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [KATEGORIID] in table 'kategoriler'
ALTER TABLE [dbo].[kategoriler]
ADD CONSTRAINT [PK_kategoriler]
    PRIMARY KEY CLUSTERED ([KATEGORIID] ASC);
GO

-- Creating primary key on [MUSTERID] in table 'musteriler'
ALTER TABLE [dbo].[musteriler]
ADD CONSTRAINT [PK_musteriler]
    PRIMARY KEY CLUSTERED ([MUSTERID] ASC);
GO

-- Creating primary key on [SATISID] in table 'satis'
ALTER TABLE [dbo].[satis]
ADD CONSTRAINT [PK_satis]
    PRIMARY KEY CLUSTERED ([SATISID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [URUNID] in table 'urunler'
ALTER TABLE [dbo].[urunler]
ADD CONSTRAINT [PK_urunler]
    PRIMARY KEY CLUSTERED ([URUNID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [URUNKATEGORI] in table 'urunler'
ALTER TABLE [dbo].[urunler]
ADD CONSTRAINT [FK_urunler_kategoriler]
    FOREIGN KEY ([URUNKATEGORI])
    REFERENCES [dbo].[kategoriler]
        ([KATEGORIID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_urunler_kategoriler'
CREATE INDEX [IX_FK_urunler_kategoriler]
ON [dbo].[urunler]
    ([URUNKATEGORI]);
GO

-- Creating foreign key on [MUSTERI] in table 'satis'
ALTER TABLE [dbo].[satis]
ADD CONSTRAINT [FK_satis_musteriler]
    FOREIGN KEY ([MUSTERI])
    REFERENCES [dbo].[musteriler]
        ([MUSTERID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_satis_musteriler'
CREATE INDEX [IX_FK_satis_musteriler]
ON [dbo].[satis]
    ([MUSTERI]);
GO

-- Creating foreign key on [URUN] in table 'satis'
ALTER TABLE [dbo].[satis]
ADD CONSTRAINT [FK_satis_urunler]
    FOREIGN KEY ([URUN])
    REFERENCES [dbo].[urunler]
        ([URUNID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_satis_urunler'
CREATE INDEX [IX_FK_satis_urunler]
ON [dbo].[satis]
    ([URUN]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------