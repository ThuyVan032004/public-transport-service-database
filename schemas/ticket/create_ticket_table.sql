create table ticket (
	id int auto_increment primary key,
    publish_date datetime not null,
    customer_id int,
    
    foreign key (customer_id) references customer(id) 
    on delete set null
    on update cascade
);

create table one_day_ticket (
	id int,
    expired_date datetime not null,
    price int unsigned not null,
    
    foreign key (id) references ticket(id)
    on update cascade
);

create table monthly_ticket (
	id int,
    expired_date datetime not null,
    price int unsigned not null,
    
    foreign key (id) references ticket(id)
    on update cascade
);
