alter table train_station
modify column train_station_id varchar(10) default '0';

alter table train_station
modify column station_id int unique not null;