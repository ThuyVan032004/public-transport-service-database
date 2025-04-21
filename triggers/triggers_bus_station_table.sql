delimiter //
create trigger check_bus_station_type
before insert on bus_station
for each row
begin
	declare station_type_value int;
    
    select station_type into station_type_value
    from station
    where id = new.station_id;
    
    if station_type_value != 2 then
		signal sqlstate '45001'
        set message_text = 'station_id must reference a station with station_type = 2 (bus station)';
	end if;
end //
delimiter ;

