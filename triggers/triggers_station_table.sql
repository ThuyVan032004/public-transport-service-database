delimiter //
create trigger sync_deletion_station
after update on station
for each row
begin
	if new.is_deleted != old.is_deleted and new.station_type = 1 then
		update train_station
		set is_deleted = new.is_deleted
        where station_id = new.id;
        
        update train_station_type
        set is_deleted = new.is_deleted
        where id in (select id from train_station where station_id = new.id);
	elseif new.is_deleted != old.is_deleted and new.station_type = 2 then
		update bus_station
		set is_deleted = new.is_deleted
        where station_id = new.id;
        
        update bus_station_type
        set is_deleted = new.is_deleted
        where id in (select id from bus_station where station_id = new.id);
	end if;
    
end //
delimiter ;