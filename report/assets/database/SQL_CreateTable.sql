
CREATE TABLE IF NOT EXISTS СПР_ДолжностиСотрудника (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_МоиОрганизации (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_МестаХранения (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_Сотрудники (
                id INT AUTO_INCREMENT NOT NULL,
                Фамилия VARCHAR(32) NOT NULL,
                Имя VARCHAR(32) NOT NULL,
                Отчество VARCHAR(32) NOT NULL,
                ДолжностиСотрудникаId INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_Производители (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_ЕдиницыХранения (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS СПР_Номенклатура (
                id INT AUTO_INCREMENT NOT NULL,
                Наименование VARCHAR(64) NOT NULL,
                ЕдиницыХраненияId INT NOT NULL,
                ПроизводителиId INT NOT NULL,
                Описание VARCHAR(1024) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ДОК_ПриказСоздИнвентКомис (
                id VARCHAR(128) NOT NULL,
                Дата TIME NOT NULL,
                Номер INT NOT NULL,
                МоиОрганизацииId INT NOT NULL,
                МестаХраненияId INT NOT NULL,
                СотрудникиId_ПредседательКомиссии INT NOT NULL,
                СотрудникиId_СоздательПриказа INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ДОК_ИнвентОпись (
                id VARCHAR(128) NOT NULL,
                Дата TIME NOT NULL,
                Номер INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ТАБ_СписокНоменклИнвентОписи (
                id INT AUTO_INCREMENT NOT NULL,
                ИнвентОписьId VARCHAR(128) NOT NULL,
                НоменклатураId INT NOT NULL,
                Цена DECIMAL(6,2) NOT NULL,
                КоличПоДаннымБухУчёта INT NOT NULL,
                КоличФактич INT NOT NULL,
                КоличНедостачи INT NOT NULL,
                КоличИзлишек INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ТАБ_СписокИнвентКомис (
                id INT AUTO_INCREMENT NOT NULL,
                ПриказСоздИнвентКомисId VARCHAR(128) NOT NULL,
                СотрудникиId INT NOT NULL,
                PRIMARY KEY (id)
);


ALTER TABLE СПР_Сотрудники ADD CONSTRAINT спд_должностисотрудника_спд_сотрудники_fk
FOREIGN KEY (ДолжностиСотрудникаId)
REFERENCES СПР_ДолжностиСотрудника (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ДОК_ПриказСоздИнвентКомис ADD CONSTRAINT спд_моиорганизации_опд_приказсоздинвенткомис_fk
FOREIGN KEY (МоиОрганизацииId)
REFERENCES СПР_МоиОрганизации (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ДОК_ПриказСоздИнвентКомис ADD CONSTRAINT спд_местахранения_опд_приказсоздинвенткомис_fk
FOREIGN KEY (МестаХраненияId)
REFERENCES СПР_МестаХранения (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ДОК_ПриказСоздИнвентКомис ADD CONSTRAINT спд_сотрудники_опд_приказсоздинвенткомис_fk
FOREIGN KEY (СотрудникиId_ПредседательКомиссии)
REFERENCES СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ДОК_ПриказСоздИнвентКомис ADD CONSTRAINT спд_сотрудники_опд_приказсоздинвенткомис_fk1
FOREIGN KEY (СотрудникиId_СоздательПриказа)
REFERENCES СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ТАБ_СписокИнвентКомис ADD CONSTRAINT спд_сотрудники_тач_списокинвенткомис_fk
FOREIGN KEY (СотрудникиId)
REFERENCES СПР_Сотрудники (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE СПР_Номенклатура ADD CONSTRAINT спд_производители_спд_номенклатура_fk
FOREIGN KEY (ПроизводителиId)
REFERENCES СПР_Производители (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE СПР_Номенклатура ADD CONSTRAINT спд_едхранения_спд_номенклатура_fk
FOREIGN KEY (ЕдиницыХраненияId)
REFERENCES СПР_ЕдиницыХранения (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ТАБ_СписокНоменклИнвентОписи ADD CONSTRAINT спд_номенклатура_тач_списокноменклатурыинвентописи_fk
FOREIGN KEY (НоменклатураId)
REFERENCES СПР_Номенклатура (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ТАБ_СписокИнвентКомис ADD CONSTRAINT док_приказсоздинвенткомис_таб_списокинвенткомис_fk
FOREIGN KEY (ПриказСоздИнвентКомисId)
REFERENCES ДОК_ПриказСоздИнвентКомис (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ДОК_ИнвентОпись ADD CONSTRAINT док_приказсоздинвенткомис_док_инвентопись_fk
FOREIGN KEY (id)
REFERENCES ДОК_ПриказСоздИнвентКомис (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ТАБ_СписокНоменклИнвентОписи ADD CONSTRAINT опд_инвентопись_тач_списокноменклатурыинвентописи_fk
FOREIGN KEY (ИнвентОписьId)
REFERENCES ДОК_ИнвентОпись (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
