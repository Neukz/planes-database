-- Initiate maintenance after a failed inspection
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
    -- 1. Update inspection result to failed
    UPDATE inspection
    SET result = 'failed'
    WHERE id = 51;

    -- 2. Select the workshop responsible for the maintenance and mark it as occupied
    UPDATE workshop
    SET is_occupied = 1
    WHERE airport_iata_code = 'WAW' AND number = 1 AND is_occupied = 0;

    IF @@ROWCOUNT = 1
    BEGIN
        PRINT 'Workshop booked successfully.';

        -- 3. Insert a new maintenance record linked to the inspection
        INSERT INTO maintenance (
            initiating_inspection_id,
            coordinated_by_employee_id,
            workshop_airport_iata_code,
            workshop_number, 
            start_date
        )
        VALUES (
            51,
            10,
            'WAW',
            1,
            GETDATE()
        );

        -- 4. Update the airplane status to maintenance
        UPDATE airplane
        SET status = 'maintenance'
        WHERE registration_code = (
            SELECT airplane_registration_code
            FROM inspection
            WHERE id = 51
        );

        PRINT 'Transaction committed.';
        COMMIT;
    END
    ELSE
    BEGIN
        PRINT 'ERROR: Workshop is already occupied or does not exist. Transaction aborted.';
        ROLLBACK;
    END