
create table drug_series(
	drug_series_id int primary key ,
	drug_id int ,
	constraint foreign key (drug_id) 
		references drug(drug_id) ,
	drug_manufacture_date date not null,
	drug_expiration_date date not null,
	drug_buy_date timestamp,
	drug_buy_quantity int not null
)engine=innodb;

#drug_price double ver moaqvs
create table  drug_sales (
	drug_series_id int ,
	constraint foreign key (drug_series_id)
		references drug_series(drug_series_id),
	drug_quantity int not null,
	drug_sale_date timestamp,
	drug_price decimal(12,4),
	index(drug_price),
	foreign key (drug_price)
		references price(drug_price),
	sale_user int ,
	constraint foreign key (sale_user)
		references users(user_id)
)engine=innodb;


create table users(
    	user_id int primary key, 
    	user_personal_id int not null unique,
	user_first_name varchar(50) not null, 
	user_last_name varchar(50) not null, 
	user_birth_date date , 
	user_address varchar(50) ,
	user_telephone varchar(25) not null, 
	user_registration_date 	timestamp
)engine=innodb;


create table city (
	city_id int primary key not null, 
	city_name varchar(50) not null, 
	country_id int ,
	constraint foreign key(country_id) 
		references country(country_id), 
		is_capital boolean 
	)engine=innodb;

create table country (
	country_id int primary key not null,
	country_name varchar(50) unique not null,
	country_alpha_code varchar(3) unique not null
)engine=innodb;


create table manufacturer (
	manufacturer_id int primary key , 
	manufacturer_name varchar(50) not null unique, 
	manufacturer_license_code int unique, 
	city_id int , 
	constraint foreign key (city_id) 
		references city(city_id), 
	manufacturer_address varchar(50) not null,
	manufacturer_description text, 
	manufacturer_email varchar(50) unique,
	manufacturer_establish_date date not null , 
	manufacturer_closure_date date, 
	mother_company int , 
	constraint foreign key(mother_company) 
		references manufacturer(manufacturer_id) 
)engine=innodb;


create table drug(
	drug_id int primary key , 
	drug_name varchar(100) not null, 
	city_id int, 
	constraint foreign key (city_id) 
		references city(city_id), 
	manufacturer_id int , 		
	constraint foreign key (manufacturer_id) 
		references manufacturer(manufacturer_id), 
	manufacturer_description text , 
	drug_type enum ('ointment','tablet', 'liquid'),  		
	drug_quantity int not null,
	drug_unit enum('pieces', 'grams') ,  
	drug_dosage_unit int , 
	drug_dosage enum ('grams', 'milligrams') 
)engine=innodb;

#version 1
create table price (
	drug_price_id int primary key , 
	drug_id int, 
	constraint foreign key (drug_id)
		references drug(drug_id), 
	drug_price decimal(12, 4) not null,
	price_date timestamp 
	)engine=innodb;


#version 2
create table price (
	drug_price_id int primary key , 
	drug_id int, 
	constraint foreign key (drug_id)
		references drug(drug_id), 
	drug_price decimal(12,4) primary key not null,
	price_date timestamp 
)engine=innodb;
#ALTER TABLE `drug_sales` ADD INDEX(`drug_price`)
