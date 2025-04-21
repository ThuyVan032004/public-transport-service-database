create table customer (
	id int auto_increment primary key,
    customer_id varchar(8) unique not null,
    fullname varchar(30),
    address varchar(100),
    date_of_birth date ,
    gender varchar(6)
);

create table customer_email (
	customer_id int,
    email varchar(50),
    primary key (id, email),
    foreign key (customer_id) references customer(id)
    
    on delete cascade
    on update cascade
);
