
CREATE SEQUENCE public.de_ctl_producers_id_seq_1;

CREATE TABLE public.DE_CTL_Producers (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_producers_id_seq_1'),
                de_name VARCHAR(64) NOT NULL,
                CONSTRAINT de_ctl_producers_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_producers_id_seq_1 OWNED BY public.DE_CTL_Producers.id;

CREATE SEQUENCE public.de_ctl_storageunits_id_seq_1;

CREATE TABLE public.DE_CTL_StorageUnits (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_storageunits_id_seq_1'),
                de_name VARCHAR(16) NOT NULL,
                CONSTRAINT de_ctl_storageunits_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_storageunits_id_seq_1 OWNED BY public.DE_CTL_StorageUnits.id;

CREATE SEQUENCE public.de_ctl_nomenclatures_id_seq;

CREATE TABLE public.DE_CTL_Nomenclatures (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_nomenclatures_id_seq'),
                de_name VARCHAR(256) NOT NULL,
                de_description VARCHAR(4096) NOT NULL,
                de_storageUnitsId INTEGER NOT NULL,
                de_producersId INTEGER NOT NULL,
                CONSTRAINT de_ctl_nomenclatures_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_nomenclatures_id_seq OWNED BY public.DE_CTL_Nomenclatures.id;

CREATE SEQUENCE public.de_ctl_positions_id_seq_1;

CREATE TABLE public.DE_CTL_Positions (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_positions_id_seq_1'),
                de_name VARCHAR(64) NOT NULL,
                CONSTRAINT de_ctl_positions_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_positions_id_seq_1 OWNED BY public.DE_CTL_Positions.id;

CREATE TABLE public.DE_CTL_Employees (
                id INTEGER NOT NULL,
                de_surname VARCHAR(32) NOT NULL,
                de_name VARCHAR(32) NOT NULL,
                de_patronymic VARCHAR(32),
                de_positionsId INTEGER NOT NULL,
                CONSTRAINT de_ctl_employees_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.de_ctl_storagelocations_id_seq_1;

CREATE TABLE public.DE_CTL_StorageLocations (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_storagelocations_id_seq_1'),
                de_name VARCHAR(256) NOT NULL,
                CONSTRAINT de_ctl_storagelocations_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_storagelocations_id_seq_1 OWNED BY public.DE_CTL_StorageLocations.id;

CREATE SEQUENCE public.de_ctl_myorganizations_id_seq_1;

CREATE TABLE public.DE_CTL_MyOrganizations (
                id INTEGER NOT NULL DEFAULT nextval('public.de_ctl_myorganizations_id_seq_1'),
                de_name VARCHAR(256) NOT NULL,
                CONSTRAINT de_ctl_myorganizations_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_ctl_myorganizations_id_seq_1 OWNED BY public.DE_CTL_MyOrganizations.id;

CREATE TABLE public.DE_DOC_OrderCreationInventoryCommission (
                id VARCHAR(128) NOT NULL,
                de_number VARCHAR(12) NOT NULL,
                de_date DATE NOT NULL,
                de_myOrganizationsId INTEGER NOT NULL,
                de_storageLocationsId INTEGER NOT NULL,
                de_chairmanCommissionId INTEGER NOT NULL,
                de_orderCreatorId INTEGER NOT NULL,
                CONSTRAINT de_doc_ordercreationinventorycommission_pk PRIMARY KEY (id)
);


CREATE TABLE public.DE_DOC_InventoryList (
                id VARCHAR(128) NOT NULL,
                de_number VARCHAR(12) NOT NULL,
                de_date DATE NOT NULL,
                CONSTRAINT de_doc_inventorylist_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.de_tab_nomenclatureinventlist_id_seq;

CREATE TABLE public.DE_TAB_NomenclatureInventList (
                id INTEGER NOT NULL DEFAULT nextval('public.de_tab_nomenclatureinventlist_id_seq'),
                de_inventoryListId VARCHAR(128) NOT NULL,
                de_nomenclatureId INTEGER NOT NULL,
                de_cost REAL NOT NULL,
                de_accountingQuantity INTEGER NOT NULL,
                de_actualQuantity INTEGER NOT NULL,
                de_shortage INTEGER NOT NULL,
                de_surplusQuantity INTEGER NOT NULL,
                CONSTRAINT de_tab_nomenclatureinventlist_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.de_tab_nomenclatureinventlist_id_seq OWNED BY public.DE_TAB_NomenclatureInventList.id;

CREATE TABLE public.DE_TAB_ListInventoryCommission (
                id INTEGER NOT NULL,
                de_orderCreationId VARCHAR(128) NOT NULL,
                de_employeesId INTEGER NOT NULL,
                CONSTRAINT de_tab_listinventorycommission_pk PRIMARY KEY (id)
);


ALTER TABLE public.DE_CTL_Nomenclatures ADD CONSTRAINT de_ctl_producers_de_ctl_nomenclatures_fk
FOREIGN KEY (de_producersId)
REFERENCES public.DE_CTL_Producers (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_CTL_Nomenclatures ADD CONSTRAINT de_ctl_storageunits_de_ctl_nomenclatures_fk
FOREIGN KEY (de_storageUnitsId)
REFERENCES public.DE_CTL_StorageUnits (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_TAB_NomenclatureInventList ADD CONSTRAINT de_ctl_nomenclatures_de_tab_nomenclatureinventlist_fk
FOREIGN KEY (de_nomenclatureId)
REFERENCES public.DE_CTL_Nomenclatures (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_CTL_Employees ADD CONSTRAINT de_ctl_positions_de_ctl_employees_fk
FOREIGN KEY (de_positionsId)
REFERENCES public.DE_CTL_Positions (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_DOC_OrderCreationInventoryCommission ADD CONSTRAINT de_ctl_employees_de_doc_ordercreation_fk
FOREIGN KEY (de_chairmanCommissionId)
REFERENCES public.DE_CTL_Employees (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_DOC_OrderCreationInventoryCommission ADD CONSTRAINT de_ctl_employees_de_doc_ordercreation_fk1
FOREIGN KEY (de_orderCreatorId)
REFERENCES public.DE_CTL_Employees (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_TAB_ListInventoryCommission ADD CONSTRAINT de_ctl_employees_de_tab_listinventorycommission_fk
FOREIGN KEY (de_employeesId)
REFERENCES public.DE_CTL_Employees (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_DOC_OrderCreationInventoryCommission ADD CONSTRAINT de_ctl_storagelocations_de_doc_ordercreation_fk
FOREIGN KEY (de_storageLocationsId)
REFERENCES public.DE_CTL_StorageLocations (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_DOC_OrderCreationInventoryCommission ADD CONSTRAINT de_ctl_myorganizations_de_doc_ordercreation_fk
FOREIGN KEY (de_myOrganizationsId)
REFERENCES public.DE_CTL_MyOrganizations (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_TAB_ListInventoryCommission ADD CONSTRAINT de_doc_ordercreation_de_tab_listinventorycommission_fk
FOREIGN KEY (de_orderCreationId)
REFERENCES public.DE_DOC_OrderCreationInventoryCommission (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_DOC_InventoryList ADD CONSTRAINT de_doc_ordercreationinventorycommission_de_doc_inventorylist_fk
FOREIGN KEY (id)
REFERENCES public.DE_DOC_OrderCreationInventoryCommission (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DE_TAB_NomenclatureInventList ADD CONSTRAINT de_doc_inventorylist_de_tab_nomenclatureinventlist_fk
FOREIGN KEY (de_inventoryListId)
REFERENCES public.DE_DOC_InventoryList (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
