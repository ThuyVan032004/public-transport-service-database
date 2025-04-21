alter table customer_email
rename column id to customer_id;

alter table customer_email
add column is_deleted boolean default false;