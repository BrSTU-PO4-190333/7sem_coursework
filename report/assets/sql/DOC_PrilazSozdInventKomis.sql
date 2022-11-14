
-- Начало транзакции создания приказа
START TRANSACTION;

INSERT INTO DE_DOC_OrderCreationInventoryCommission (
    id, de_date, de_number,
    de_myOrganizationsId, de_storageLocationsId,
    de_chairmanCommissionId, de_orderCreatorId
) VALUES
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '2022-05-10 10:28:00', '1', '1', '1', '2', '1');

INSERT INTO DE_TAB_ListInventoryCommission
(de_orderCreationId, de_employeesId) VALUES
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '3'),
('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee1', '4');

-- ROLLBACK;

COMMIT;
-- Конец транзакции создания приказа
