
-- = = = = = = = = Начало транзакции инвентаризационной описи
BEGIN TRANSACTION;

    INSERT INTO ГП_ДОК_ИнвентОпись
    (id, гп_дата, гп_номер) VALUES
    ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '2022-05-10 12:56:00', '1');

    INSERT INTO ГП_ТБЧ_СписокНоменклИнвентОписи (
        гп_документКод, гп_номенклатураКод, гп_цена,
        гп_количФактич, гп_количБухУч, гп_количНедос, гп_количИзлиш
    ) VALUES
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '1', '17.5', '2',  '2',  '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '2', '11.5', '10', '10', '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '3', '23.5', '3',  '3',  '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '4', '22',   '10', '10', '2', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '5', '38',   '10', '10', '1', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '6', '1.5',  '30', '30', '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '7', '12',   '5',  '5',  '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '8', '4.36', '30', '30', '0', '0'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '9', '3.7',  '10', '10', '0', '0');

-- ROLLBACK;
COMMIT TRANSACTION;
-- = = = = = = = = Конец транзакции инвентаризационной описи

SELECT * FROM ГП_ДОК_ИнвентОпись;

SELECT * FROM ГП_ТБЧ_СписокНоменклИнвентОписи;
