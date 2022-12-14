-- Удаляем базу данных для повторного запуска скрипта повторно
USE master;
GO

DROP DATABASE IF EXISTS ГП_БД_7семестрБдКурсовая;
GO

-- Создаем базу данных
CREATE DATABASE ГП_БД_7семестрБдКурсовая;
GO

ALTER DATABASE ГП_БД_7семестрБдКурсовая
COLLATE Cyrillic_General_CI_AS ;
GO

USE ГП_БД_7семестрБдКурсовая;
GO

-- Создание типов данных
CREATE TYPE ГП_ТИП_Код
    FROM INT NOT NULL
GO

CREATE TYPE ГП_ТИП_УникальныйКод
    FROM VARCHAR(128) NOT NULL
GO

CREATE TYPE ГП_ТИП_Количество
    FROM INT NOT NULL
GO

CREATE TYPE ГП_ТИП_Цена
    FROM DECIMAL(2) NOT NULL
GO

CREATE TYPE ГП_ТИП_НомерДокумента
    FROM VARCHAR(12) NOT NULL
GO

CREATE TYPE ГП_ТИП_ДатаДокумента
    FROM DATETIME NOT NULL
GO

CREATE TYPE ГП_ТИП_ФамилияИмя
    FROM VARCHAR(32) NOT NULL
GO

CREATE TYPE ГП_ТИП_Отчество
    FROM VARCHAR(32)
GO

-- Создание таблиц
CREATE TABLE ГП_СПР_Должности (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(128) NOT NULL,
    CONSTRAINT PG_SPR_Doljnosti__pk PRIMARY KEY (id)
);
GO


CREATE TABLE ГП_СПР_Производители (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(64) NOT NULL,
    CONSTRAINT PG_SPR_Proizvoditeli__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_СПР_ЕдиницыХранения (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(16) NOT NULL,
    CONSTRAINT PG_SPR_EdiniciXranenia__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_СПР_Номенклатура (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(256) NOT NULL,
    гп_описание VARCHAR(4096) NOT NULL,
    гп_единицаХраненияКод ГП_ТИП_Код CHECK(гп_единицаХраненияКод > 0),
    гп_производительКод ГП_ТИП_Код CHECK(гп_производительКод > 0),
    CONSTRAINT PG_SPR_Nomenclatura__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_СПР_Сотрудники (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_фамилия ГП_ТИП_ФамилияИмя,
    гп_имя ГП_ТИП_ФамилияИмя,
    гп_отчество ГП_ТИП_Отчество,
    гп_должностьКод ГП_ТИП_Код CHECK(гп_должностьКод > 0),
    CONSTRAINT PG_SPR_Sotrudniki__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_СПР_МестаХранения (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(128) NOT NULL,
    CONSTRAINT PG_SPR_MestaXranenia__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_СПР_МоиОрганизации (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_наименование VARCHAR(128) NOT NULL,
    CONSTRAINT PG_SPR_MoiOrganizatii__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_ДОК_ПрикСоздИнвКомиссии (
    id ГП_ТИП_УникальныйКод,
    гп_номер ГП_ТИП_НомерДокумента,
    гп_дата ГП_ТИП_ДатаДокумента DEFAULT CURRENT_TIMESTAMP,
    гп_мояОрганизацияКод ГП_ТИП_Код,
    гп_местоХраненияКод ГП_ТИП_Код CHECK(гп_местоХраненияКод > 0),
    гп_предКомСотрудникКод ГП_ТИП_Код CHECK(гп_предКомСотрудникКод > 0),
    гп_приказчСотрудникКод ГП_ТИП_Код CHECK(гп_приказчСотрудникКод > 0),
    CONSTRAINT PG_DOC_PrikazSozdInvKomissii__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_ТБЧ_СписЧлИнвКом (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_приказКод ГП_ТИП_УникальныйКод,
    гп_сотрудникКод ГП_ТИП_Код CHECK(гп_сотрудникКод > 0),
    CONSTRAINT PG_TBC_SpisClInvKom__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_ДОК_ИнвентОпись (
    id ГП_ТИП_УникальныйКод,
    гп_номер ГП_ТИП_НомерДокумента,
    гп_дата ГП_ТИП_ДатаДокумента DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PG_DOC_InventOpis__pk PRIMARY KEY (id)
);
GO

CREATE TABLE ГП_ТБЧ_СписокНоменклИнвентОписи (
    id ГП_ТИП_Код IDENTITY CHECK(id > 0),
    гп_документКод ГП_ТИП_УникальныйКод,
    гп_номенклатураКод ГП_ТИП_Код CHECK(гп_номенклатураКод > 0),
    гп_цена ГП_ТИП_Цена DEFAULT 0 CHECK(гп_цена >= 0),
    гп_количФактич ГП_ТИП_Количество DEFAULT 0 CHECK(гп_количФактич >= 0),
    гп_количБухУч ГП_ТИП_Количество DEFAULT 0 CHECK(гп_количБухУч >= 0),
    гп_количНедос ГП_ТИП_Количество DEFAULT 0 CHECK(гп_количНедос >= 0),
    гп_количИзлиш ГП_ТИП_Количество DEFAULT 0 CHECK(гп_количИзлиш >= 0),
    CONSTRAINT PG_TBC_SpisokNomenclInventOpisi__pk PRIMARY KEY (id)
);
GO

-- Связываем таблицы
ALTER TABLE ГП_СПР_Сотрудники ADD CONSTRAINT SPR_Sotrudniki__PG_SPR_Doljnosti__fk
FOREIGN KEY (гп_должностьКод)
REFERENCES ГП_СПР_Должности (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION


ALTER TABLE ГП_СПР_Номенклатура ADD CONSTRAINT SPR_Proizvoditeli__SPR_Nomenclatura__fk
FOREIGN KEY (гп_производительКод)
REFERENCES ГП_СПР_Производители (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_СПР_Номенклатура ADD CONSTRAINT SPR_EdiniciXranenia__SPR_Nomenclatura__fk
FOREIGN KEY (гп_единицаХраненияКод)
REFERENCES ГП_СПР_ЕдиницыХранения (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ТБЧ_СписокНоменклИнвентОписи ADD CONSTRAINT SPR_Nomenclatura__TBC_SpisokNomenclInventOpisi__fk
FOREIGN KEY (гп_номенклатураКод)
REFERENCES ГП_СПР_Номенклатура (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ДОК_ПрикСоздИнвКомиссии ADD CONSTRAINT SPR_Sotrudniki__DOC_PrikazSozdInvKomissii__fk
FOREIGN KEY (гп_предКомСотрудникКод)
REFERENCES ГП_СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ДОК_ПрикСоздИнвКомиссии ADD CONSTRAINT SPR_Sotrudniki__DOC_PrikazSozdInvKomissii__fk1
FOREIGN KEY (гп_приказчСотрудникКод)
REFERENCES ГП_СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ТБЧ_СписЧлИнвКом ADD CONSTRAINT SPR_Sotrudniki__TBC_SpisClInvKom__fk
FOREIGN KEY (гп_сотрудникКод)
REFERENCES ГП_СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ДОК_ПрикСоздИнвКомиссии ADD CONSTRAINT SPR_MestaXranenia__DOC_PrikazSozdInvKomissii__fk
FOREIGN KEY (гп_местоХраненияКод)
REFERENCES ГП_СПР_МестаХранения (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ДОК_ПрикСоздИнвКомиссии ADD CONSTRAINT SPR_MoiOrganizatii__DOC_PrikazSozdInvKomissii__fk
FOREIGN KEY (гп_мояОрганизацияКод)
REFERENCES ГП_СПР_МоиОрганизации (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ДОК_ИнвентОпись ADD CONSTRAINT DOC_PrikazSozdInvKomissii__DOC_InventOpis__fk
FOREIGN KEY (id)
REFERENCES ГП_ДОК_ПрикСоздИнвКомиссии (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ТБЧ_СписЧлИнвКом ADD CONSTRAINT DOC_PrikazSozdInvKomissii__TBC_SpisClInvKom__fk
FOREIGN KEY (гп_приказКод)
REFERENCES ГП_ДОК_ПрикСоздИнвКомиссии (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO

ALTER TABLE ГП_ТБЧ_СписокНоменклИнвентОписи ADD CONSTRAINT DOC_InventOpis__TBC_SpisokNomenclInventOpisi__fk
FOREIGN KEY (гп_документКод)
REFERENCES ГП_ДОК_ИнвентОпись (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO
