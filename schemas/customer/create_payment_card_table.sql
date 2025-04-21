create table customer_payment_card (
	card_id int auto_increment primary key,
    expired_date date not null,
    balance int unsigned not null,
    customer_id int,
    
    foreign key (customer_id) references customer(id)
    on delete cascade 
    on update cascade
);