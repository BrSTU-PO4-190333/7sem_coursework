
-- Начало транзакции создания приказа
START TRANSACTION;

INSERT INTO ДОК_ПриказСоздИнвентКомис (
    id, Дата, Номер,
    МоиОрганизацииId, МестаХраненияId,
    СотрудникиId_ПредседательКомиссии, СотрудникиId_СоздательПриказа
) VALUES
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '2022-05-10 10:28:00', '1', '1', '1', '2', '1');

INSERT INTO ТАБ_СписокИнвентКомис (ПриказСоздИнвентКомисId, СотрудникиId) VALUES
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '3'),
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '4');

-- ROLLBACK;

COMMIT;
-- Конец транзакции создания приказа
