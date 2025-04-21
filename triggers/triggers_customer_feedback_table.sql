delimiter //
create trigger create_customer_feedback_id
before insert on customer_feedback
for each row
begin
	set new.feedback_id = concat('RES', lpad(new.id, 5, '0'));
end //
delimiter ;