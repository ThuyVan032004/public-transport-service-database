delimiter //
create trigger create_bus_station_id
after insert on bus_station_type
for each row
begin
	if new.b_type = 1 then
		update bus_station
        set bus_station_id = concat('N', lpad(id, 3, '0'))
        where id = new.id;
	elseif new.b_type = 2 then
		update bus_station
        set bus_station_id = concat('E', lpad(id, 3, '0'))
        where id = new.id;
	end if;
end //
delimiter ;