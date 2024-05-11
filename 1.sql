CREATE PROCEDURE DeleteUser(IN userId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT -1 AS user_deleted;
    END;

    START TRANSACTION;
    
    DELETE FROM likes WHERE user_id = userId;
    DELETE FROM messages WHERE user_id = userId;
    DELETE FROM media WHERE user_id = userId;
    DELETE FROM users WHERE id = userId;

    COMMIT;
    
    SELECT userId AS user_deleted;
END;
