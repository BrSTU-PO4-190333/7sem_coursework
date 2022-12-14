-- = = = = = = = = Начало транзакции создания приказа
BEGIN TRANSACTION;

    INSERT INTO
        ГП_ДОК_ПрикСоздИнвКомиссии (
            id,
            гп_дата,
            гп_номер,
            гп_мояОрганизацияКод,
            гп_местоХраненияКод,
            гп_предКомСотрудникКод,
            гп_приказчСотрудникКод
        )
    VALUES
        (
            'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1',
            '2022-05-10 10:28:00',
            '1',
            '1',
            '1',
            '2',
            '1'
        );

    INSERT INTO
        ГП_ТБЧ_СписЧлИнвКом (гп_приказКод, гп_сотрудникКод)
    VALUES
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '3'),
        ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '4');

-- ROLLBACK;
COMMIT TRANSACTION;

-- = = = = = = = = Конец транзакции создания приказа

SELECT * FROM ГП_ДОК_ПрикСоздИнвКомиссии;

SELECT * FROM ГП_ТБЧ_СписЧлИнвКом;
