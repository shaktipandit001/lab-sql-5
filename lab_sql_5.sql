use sakila;

#Drop column picture from staff.
select * from staff;

alter table staff
drop column picture;


# new person is hired to help Jon.
#Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff;
	insert into staff 
		values (3, 'Tammy', 'Sanders', 3,'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy', '8cb2237d0679ca88d');
			update staff
				set staff_id = 3
					where staff_id = 4;

select * from staff;

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. Hint:
# Check the columns in the table rental and 
#see what information you would need to add there. 
#You can query those pieces of information. For eg.,
# you would notice that you need customer_id information as well.
# To get that you can use the following query:
 #what I need--
 
 
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.

select *from rental;
select max(rental_id) from sakila.rental;
#16049
select current_date();
#2024-03-11
select * from inventory;
select inventory_id from inventory where film_id = 1 and store_id= 1;
select * from film;
select * from film where title="Academy Dinosaur" ;
select * from sakila.customer
where  first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#customer_id = 130

insert into rental (rental_id, rental_date, inventory_id, customer_id, staff_id)
values (16050, '2024-03-11', 1, 130, 1);
select * from rental where rental_id= 16050;

#Delete non-active users, but first, create a backup table deleted_users to
 #store customer_id, email, and the date for the users that would be deleted.
 #Follow these steps:

#Check if there are any non-active users
#create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer

create table deleted_users(
customer_id int default null, 
email varchar(10) default null,
date varchar(10) default null
);

 alter table deleted_users
  modify email varchar(10);
        
insert into deleted_users(customer_id, email, date)
select customer_id, email, create_date
from customer where active=0;

select * from deleted_users;

# to solve Error 1451: bypass foreign key check.
set foreign_key_checks = 0;
delete from customer where active=0;
set foreign_key_checks = 1;
select * from customer where active=0;
	