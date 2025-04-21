delimiter //
CREATE TRIGGER create_train_station_id
AFTER INSERT ON train_station_type
FOR EACH ROW
BEGIN 
    -- For speed train stations
    IF NEW.t_type = 1 THEN
        UPDATE train_station 
        SET train_station_id = CONCAT('SPD', LPAD(id, 3, '0'))
        WHERE id = NEW.id;
    -- For metro train stations
    ELSEIF NEW.t_type = 2 THEN
        UPDATE train_station 
        SET train_station_id = CONCAT('MET', LPAD(id, 3, '0'))
        WHERE id = NEW.id;
    END IF;
END //
delimiter ;

DELIMITER //
	