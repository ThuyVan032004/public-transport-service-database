create table buy_at (
	ticket_id int,
    station_id int,
    primary key (ticket_id, station_id),
    
    foreign key (ticket_id) references ticket(id),
    foreign key (station_id) references station(id)
    on update cascade
    on delete cascade
);