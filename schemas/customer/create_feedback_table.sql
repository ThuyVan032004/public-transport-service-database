create table customer_feedback (
	id int auto_increment primary key,
    feedback_id varchar(8) unique not null,
    feedback_status varchar(10) not null,
    content varchar(200) null,
	customer_id int,
    foreign key (customer_id) references customer(id)
    
    on delete set null
    on update cascade
);