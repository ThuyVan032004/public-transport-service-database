delimiter //
create trigger create_customer_id
before insert on Customer
for each row
begin
	set new.customer_id = concat('CUST', lpad(new.id, 4, '0'));
end //
delimiter ;

delimiter //
create trigger sync_delete_customer
after update on customer
for each row
begin 
	if new.is_deleted != old.is_deleted then
		update customer_email
        set is_deleted = new.is_deleted
        where customer_id = new.id;
        
        update customer_feedback
        set customer_id = null
        where customer_id = new.id;
        
        update ticket
        set customer_id = null
        where customer_id = new.id;
	end if;
    
end //
delimiter ;

