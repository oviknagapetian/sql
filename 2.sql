CREATE TRIGGER CheckCommunityNameLength BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.name) < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Название сообщества должно содержать не менее 5 символов';
    END IF;
END;
