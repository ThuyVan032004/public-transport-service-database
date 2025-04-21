CREATE TRIGGER check_train_station_type
BEFORE INSERT ON train_station
FOR EACH ROW
BEGIN
    DECLARE station_type_id INT;
    
    SELECT station_type INTO station_type_id 
    FROM station 
    WHERE id = NEW.station_id;
    
    IF station_type_id != 1 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'station_id must reference a station with station_type = 1 (train station)';
    END IF;
END//
delimiter ;
