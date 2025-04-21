create table station_type (
	id int auto_increment primary key,
    s_type varchar(10) not null
);

create table train_type (
	id int auto_increment primary key,
    t_type varchar(10) not null
);

create table bus_type(
	id int auto_increment primary key,
    b_type varchar(10) not null
);

create table station (
	id int auto_increment primary key,
    station_type int,
    route_num int unsigned check (route_num < 21),
    
    foreign key (station_type) references station_type(id)
);

create table train_station (
	id int auto_increment primary key,
    train_station_id varchar(10) not null,
    address varchar(50) not null,
    name varchar(80) not null,
    capacity int unsigned check (capacity < 51),
	station_id int,
    
    foreign key (station_id) references station(id)
    on update cascade
);

create table train_station_type (
	id int,
    t_type int not null,
    primary key (id, t_type),
    
    foreign key (id) references train_station(id),
    foreign key (t_type) references train_type(id)
    
    on update cascade
);

create table bus_station (
	id int auto_increment primary key,
    bus_station_id varchar(10) not null,
    name varchar(80) not null,
    address varchar(50) not null,
    capacity int unsigned check (capacity < 51),
    station_id int,
    
    foreign key (station_id) references station(id)
    on update cascade
);

create table bus_station_type(
	id int,
    b_type int not null,
    primary key(id, b_type),
    
    foreign key (id) references bus_station(id),
    foreign key (b_type) references bus_type(id)
    on update cascade
);