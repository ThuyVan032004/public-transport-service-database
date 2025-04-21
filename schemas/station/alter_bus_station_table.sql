alter table bus_station
modify column bus_station_id varchar(10) default '0';

alter table bus_station
modify column station_id int unique not null;
