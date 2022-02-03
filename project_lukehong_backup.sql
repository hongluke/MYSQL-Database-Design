DROP DATABASE IF EXISTS project;
CREATE DATABASE  IF NOT EXISTS project;
USE project;

drop table if exists customer;
create table customer (
	customer_id int primary key,
    full_name varchar(100),
    gender char(1) default null,
    dob date,
    username varchar(100),
    pass varchar(100),
    email varchar(100)
    );

drop table if exists product;
create table product (
	product_id int primary key,
    product_name varchar(100),
    product_description varchar(200) default null,
    price float
    );

drop table if exists location;
create table location (
	location_id int primary key,
    address varchar(100),
    city varchar(50),
    state char(2),
    zipcode int(5)
    );


drop table if exists inventory;
create table inventory (
	inventory_id int primary key,
    inventory_quantity int,
    product_id int,
    
    CONSTRAINT fk_inventory_prod FOREIGN KEY (product_id) REFERENCES product (product_id)
    );

    
drop table if exists location_customer;
create table location_customer (
	location_id int not null,
	customer_id int not null,
    
    CONSTRAINT fk_loc_cus_loc FOREIGN KEY (location_id) REFERENCES location (location_id),
    CONSTRAINT fk_loc_cus_cus FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
    );

drop table if exists employee;
create table employee (
	employee_id int primary key auto_increment,
    employee_name varchar(100),
    title varchar(100),
    employee_dob date,
    hire_date date
    );

drop table if exists order_list;
create table order_list (
	order_id int primary key auto_increment,
    order_date date,
    order_quantity int,
    order_status varchar(50) default null,
    product_id int not null,
    customer_id int not null,
    location_id int not null,
    employee_id int not null,
    
    CONSTRAINT fk_order_loc FOREIGN KEY (location_id) REFERENCES location (location_id),
	CONSTRAINT fk_order_prod FOREIGN KEY (product_id) REFERENCES product (product_id),
    CONSTRAINT fk_order_cus FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_emp FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
    );

insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (1, 'Monsieur Gustave H.', 'M', '1988/09/11', 'hmowen0', 'ol3JjQJGbc', 'hmowen0@grandbudapesthotel.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (2, 'Wes Anderson', 'M', '1956/08/23', 'lbecerro1', 'LcE0VEdDly', 'lbecerro1@behance.net');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (3, 'Zero Moustafa', 'M', '2018/04/26', 'dde2', 'hP583N', 'dde2@paginegialle.it');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (4, 'Huntlee De Mitri', 'M', '2001/08/30', 'hde3', 'giDSe0bEw', 'hde3@netscape.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (5, 'Sarita Shakle', 'F', '1956/10/06', 'sshakle4', 'yz8NpQ', 'sshakle4@ox.ac.uk');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (6, 'Jaimie O''Dyvoie', 'F', '1961/11/20', 'jodyvoie5', '2VClSu3be', 'jodyvoie5@joomla.org');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (7, 'Hillel Parsell', 'M', '1949/10/04', 'hparsell6', 'uhhfOdN', 'hparsell6@joomla.org');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (8, 'Demetris Cheeke', 'F', '2001/03/02', 'dcheeke7', 'IxbKbQyz', 'dcheeke7@slate.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (9, 'Adolf Skures', 'M', '2019/02/13', 'askures8', 'HGZDGW9HEr', 'askures8@tripod.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (10, 'Grete Willicott', 'F', '1996/11/11', 'gwillicott9', 't1jrC75YNW3', 'gwillicott9@miitbeian.gov.cn');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (11, 'Elonore Carmen', 'F', '1975/01/30', 'ecarmena', 'cndvinPwftbX', 'ecarmena@4shared.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (12, 'Elene Furmonger', 'F', '1964/01/01', 'efurmongerb', 'lZ3WlAm', 'efurmongerb@census.gov');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (13, 'Mercedes Perrottet', 'F', '1951/08/20', 'mperrottetc', 'SDlHcf', 'mperrottetc@netscape.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (14, 'Emmi Yuryatin', 'F', '2016/07/16', 'eyuryatind', 'uAzzV5s8J', 'eyuryatind@soup.io');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (15, 'Aeriel Keller', 'F', '1954/04/05', 'akellere', 'JNbsGCcgfdd', 'akellere@phoca.cz');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (16, 'Robbert Colnett', 'M', '1943/10/25', 'rcolnettf', '0jwGQ6uR8L', 'rcolnettf@techcrunch.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (17, 'Bogey Rosin', 'M', '1992/07/14', 'brosing', 'CAVidfTFKgY', 'brosing@ed.gov');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (18, 'Gonzales Clerk', 'M', '1974/10/26', 'gclerkh', 'JS1XQL6Gs344', 'gclerkh@cocolog-nifty.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (19, 'Avril Linacre', 'F', '2014/03/18', 'alinacrei', 'dBq6C670EYx', 'alinacrei@wikispaces.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (20, 'Zane Zylberdik', 'M', '1982/05/16', 'zzylberdikj', 'OmjmNU33', 'zzylberdikj@studiopress.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (21, 'Gracie Lebond', 'F', '2004/04/30', 'glebondk', 'bsvzuiAsWq', 'glebondk@ox.ac.uk');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (22, 'Brok Haffner', 'M', '1962/07/18', 'bhaffnerl', 'k3sIQlTkyfH', 'bhaffnerl@1688.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (23, 'Ricky Staniland', 'M', '1964/06/26', 'rstanilandm', 'C0fXrZN0rJB', 'rstanilandm@naver.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (24, 'Finley Gwin', 'M', '2009/03/17', 'fgwinn', 'bON0vfOaNWEd', 'fgwinn@opera.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (25, 'Derby Lovitt', 'M', '1971/05/19', 'dlovitto', 'tkV0XPqu', 'dlovitto@dyndns.org');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (26, 'Ode Dommett', 'M', '1966/04/09', 'odommettp', 'H4udbvTdara', 'odommettp@weibo.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (27, 'Fredia Winder', 'F', '1953/03/22', 'fwinderq', 'rIcjHZlt', 'fwinderq@mail.ru');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (28, 'Bo Ivatt', 'M', '2012/04/10', 'bivattr', 'b3JOyIPZjyN', 'bivattr@simplemachines.org');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (29, 'Augusta Sole', 'F', '1981/09/17', 'asoles', 'YcOGfrHj38kl', 'asoles@flavors.me');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (30, 'Jeane Elles', 'F', '1966/10/17', 'jellest', 'aLhVPJOU', 'jellest@hubpages.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (31, 'Greggory Linguard', 'M', '1975/07/08', 'glinguardu', 'sXHGoFldN', 'glinguardu@odnoklassniki.ru');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (32, 'Gertrude Durgan', 'F', '2007/05/01', 'gdurganv', 'rbTI25c', 'gdurganv@google.ru');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (33, 'Guntar Fishly', 'M', '1985/11/19', 'gfishlyw', 'kJavMiBxM', 'gfishlyw@blinklist.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (34, 'Tabitha Darrach', 'F', '1979/08/30', 'tdarrachx', 'qAgrlSYaMf', 'tdarrachx@digg.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (35, 'Teodor Lepard', 'M', '2003/06/26', 'tlepardy', '0r9pJfABNr', 'tlepardy@odnoklassniki.ru');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (36, 'Flori Ramble', 'F', '1952/02/18', 'framblez', 'sKp3OL', 'framblez@epa.gov');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (37, 'Jacky Dunn', 'M', '2017/01/20', 'jdunn10', '2fnZIDy8', 'jdunn10@squidoo.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (38, 'Kelley Maddox', 'F', '2010/06/12', 'kmaddox11', 'YnopcX', 'kmaddox11@youtube.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (39, 'Alvie Ingraham', 'M', '1989/06/26', 'aingraham12', 'hF1uUEO', 'aingraham12@vk.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (40, 'Ashleigh Beviss', 'F', '1991/12/05', 'abeviss13', 'UpXJGyfN', 'abeviss13@zimbio.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (41, 'Jillane Jeroch', 'F', '1982/12/13', 'jjeroch14', 'mtND67eDD', 'jjeroch14@vimeo.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (42, 'Antonia Batt', 'F', '1990/12/30', 'abatt15', '9ub1Y4', 'abatt15@themeforest.net');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (43, 'Giselle Alenshev', 'F', '1960/01/26', 'galenshev16', 'Yam8yqRCj4Cq', 'galenshev16@ucoz.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (44, 'Andria Deinert', 'F', '1957/11/08', 'adeinert17', 'GL8CoFl4kC1y', 'adeinert17@google.co.uk');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (45, 'Debee Trillow', 'F', '1989/05/18', 'dtrillow18', 'FKsdvdZFDknQ', 'dtrillow18@cargocollective.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (46, 'Ansell Penreth', 'M', '2010/10/26', 'apenreth19', 'Vwbi5X5', 'apenreth19@oaic.gov.au');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (47, 'Winn Capin', 'M', '1949/02/04', 'wcapin1a', 'gcJkxaSS3jZ', 'wcapin1a@hubpages.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (48, 'Raquel Litterick', 'F', '1971/01/19', 'rlitterick1b', 'hUQsnv9', 'rlitterick1b@buzzfeed.com');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (49, 'Odell Bertelmot', 'M', '1972/05/06', 'obertelmot1c', '7Z7M3v4', 'obertelmot1c@usa.gov');
insert into customer (customer_id, full_name, gender, dob, username, pass, email) values (50, 'Christean Valde', 'F', '1988/01/01', 'cvalde1d', '0GfIMkfJrZJk', 'cvalde1d@answers.com');

insert into product (product_id, product_name, price) values (1, 'Courtesan au Chocolat', 10);
insert into product (product_id, product_name, price) values (2, 'Cake', 10);
insert into product (product_id, product_name, price) values (3, 'Pain au chocolat', 4);
insert into product (product_id, product_name, price) values (4, 'Gelato', 8);
insert into product (product_id, product_name, price) values (5, 'Macaron', 7);
insert into product (product_id, product_name, price) values (6, 'Waffle', 5);
insert into product (product_id, product_name, price) values (7, 'Cookie', 3);
insert into product (product_id, product_name, price) values (8, 'Madeleine', 3);
insert into product (product_id, product_name, price) values (9, 'Croissant', 4);
insert into product (product_id, product_name, price) values (10, 'Creme brulee', 10);

insert into location (location_id, address, city, state, zipcode) values (1, 'Grand Budapest Hotel', 'Zubrowka', 'CA', '95108');
insert into location (location_id, address, city, state, zipcode) values (2, '1911 Harper Terrace', 'New York City', 'NY', '10292');
insert into location (location_id, address, city, state, zipcode) values (3, '964 Delaware Lane', 'Silver Spring', 'MD', '20904');
insert into location (location_id, address, city, state, zipcode) values (4, '2962 Almo Terrace', 'Oklahoma City', 'OK', '73124');
insert into location (location_id, address, city, state, zipcode) values (5, '11 Debs Crossing', 'Cambridge', 'MA', '02142');
insert into location (location_id, address, city, state, zipcode) values (6, '9 Sheridan Crossing', 'Honolulu', 'HI', '96820');
insert into location (location_id, address, city, state, zipcode) values (7, '69 Banding Hill', 'Lafayette', 'IN', '47905');
insert into location (location_id, address, city, state, zipcode) values (8, '796 Garrison Plaza', 'West Palm Beach', 'FL', '33416');
insert into location (location_id, address, city, state, zipcode) values (9, '2 Stuart Court', 'Bonita Springs', 'FL', '34135');
insert into location (location_id, address, city, state, zipcode) values (10, '2 Florence Junction', 'Sioux Falls', 'SD', '57105');
insert into location (location_id, address, city, state, zipcode) values (11, '8 Ilene Alley', 'Salt Lake City', 'UT', '84199');
insert into location (location_id, address, city, state, zipcode) values (12, '0 Melby Terrace', 'Sacramento', 'CA', '94291');
insert into location (location_id, address, city, state, zipcode) values (13, '10842 Clarendon Crossing', 'El Paso', 'TX', '88525');
insert into location (location_id, address, city, state, zipcode) values (14, '8021 Marquette Drive', 'Anaheim', 'CA', '92805');
insert into location (location_id, address, city, state, zipcode) values (15, '83153 Acker Park', 'Las Vegas', 'NV', '89166');
insert into location (location_id, address, city, state, zipcode) values (16, '5118 Sugar Trail', 'Brooklyn', 'NY', '11210');
insert into location (location_id, address, city, state, zipcode) values (17, '74089 Chive Way', 'Saginaw', 'MI', '48604');
insert into location (location_id, address, city, state, zipcode) values (18, '7951 Forster Pass', 'Littleton', 'CO', '80161');
insert into location (location_id, address, city, state, zipcode) values (19, '1 Spaight Avenue', 'Alexandria', 'VA', '22301');
insert into location (location_id, address, city, state, zipcode) values (20, '89 Waubesa Alley', 'Boston', 'MA', '02298');
insert into location (location_id, address, city, state, zipcode) values (21, '1 Mariners Cove Terrace', 'Syracuse', 'NY', '13251');
insert into location (location_id, address, city, state, zipcode) values (22, '27 Veith Point', 'Houston', 'TX', '77260');
insert into location (location_id, address, city, state, zipcode) values (23, '9810 Lunder Court', 'Richmond', 'VA', '23208');
insert into location (location_id, address, city, state, zipcode) values (24, '7392 Forest Dale Pass', 'Harrisburg', 'PA', '17140');
insert into location (location_id, address, city, state, zipcode) values (25, '6525 Twin Pines Plaza', 'Sacramento', 'CA', '94250');
insert into location (location_id, address, city, state, zipcode) values (26, '4 Gulseth Point', 'Houston', 'TX', '77299');
insert into location (location_id, address, city, state, zipcode) values (27, '4672 Prairieview Way', 'Charlotte', 'NC', '28247');
insert into location (location_id, address, city, state, zipcode) values (28, '25353 Mcguire Terrace', 'Great Neck', 'NY', '11024');
insert into location (location_id, address, city, state, zipcode) values (29, '514 Pierstorff Place', 'Sacramento', 'CA', '94257');
insert into location (location_id, address, city, state, zipcode) values (30, '0134 Eagle Crest Point', 'Detroit', 'MI', '48232');
insert into location (location_id, address, city, state, zipcode) values (31, '35 Jackson Circle', 'Cleveland', 'OH', '44185');
insert into location (location_id, address, city, state, zipcode) values (32, '59 Birchwood Hill', 'North Las Vegas', 'NV', '89036');
insert into location (location_id, address, city, state, zipcode) values (33, '9496 Lotheville Pass', 'Wilkes Barre', 'PA', '18763');
insert into location (location_id, address, city, state, zipcode) values (34, '68589 Dahle Drive', 'Washington', 'DC', '20310');
insert into location (location_id, address, city, state, zipcode) values (35, '35337 Kim Pass', 'Springfield', 'IL', '62711');
insert into location (location_id, address, city, state, zipcode) values (36, '01 Sachs Parkway', 'Baton Rouge', 'LA', '70805');
insert into location (location_id, address, city, state, zipcode) values (37, '2058 Nobel Center', 'Salt Lake City', 'UT', '84135');
insert into location (location_id, address, city, state, zipcode) values (38, '77294 North Hill', 'Chicago', 'IL', '60646');
insert into location (location_id, address, city, state, zipcode) values (39, '0 Algoma Parkway', 'Fargo', 'ND', '58122');
insert into location (location_id, address, city, state, zipcode) values (40, '03 Susan Place', 'Billings', 'MT', '59112');
insert into location (location_id, address, city, state, zipcode) values (41, '40 Arapahoe Trail', 'Washington', 'DC', '20319');
insert into location (location_id, address, city, state, zipcode) values (42, '50576 Banding Alley', 'Columbia', 'SC', '29225');
insert into location (location_id, address, city, state, zipcode) values (43, '6398 Fair Oaks Alley', 'Corpus Christi', 'TX', '78405');
insert into location (location_id, address, city, state, zipcode) values (44, '1995 Clarendon Hill', 'Fresno', 'CA', '93794');
insert into location (location_id, address, city, state, zipcode) values (45, '3 Hallows Point', 'Van Nuys', 'CA', '91411');
insert into location (location_id, address, city, state, zipcode) values (46, '130 Sloan Alley', 'Dallas', 'TX', '75310');
insert into location (location_id, address, city, state, zipcode) values (47, '8 Almo Way', 'Huntington', 'WV', '25711');
insert into location (location_id, address, city, state, zipcode) values (48, '5 Susan Way', 'Fort Wayne', 'IN', '46896');
insert into location (location_id, address, city, state, zipcode) values (49, '996 Cascade Drive', 'Tacoma', 'WA', '98442');
insert into location (location_id, address, city, state, zipcode) values (50, '83872 East Park', 'Tucson', 'AZ', '85705');
insert into location (location_id, address, city, state, zipcode) values (51, '43 Oak Valley Trail', 'Boston', 'MA', '02124');
insert into location (location_id, address, city, state, zipcode) values (52, '71 Maple Wood Lane', 'Oklahoma City', 'OK', '73114');
insert into location (location_id, address, city, state, zipcode) values (53, '8332 Duke Alley', 'Silver Spring', 'MD', '20910');
insert into location (location_id, address, city, state, zipcode) values (54, '4578 Manufacturers Lane', 'Tulsa', 'OK', '74116');
insert into location (location_id, address, city, state, zipcode) values (55, '6 Drewry Drive', 'Miami', 'FL', '33169');
insert into location (location_id, address, city, state, zipcode) values (56, '89317 Washington Lane', 'Tallahassee', 'FL', '32304');
insert into location (location_id, address, city, state, zipcode) values (57, '4243 Jackson Crossing', 'San Francisco', 'CA', '94126');
insert into location (location_id, address, city, state, zipcode) values (58, '6559 Summit Trail', 'Dallas', 'TX', '75251');
insert into location (location_id, address, city, state, zipcode) values (59, '8346 Butterfield Way', 'Midland', 'MI', '48670');
insert into location (location_id, address, city, state, zipcode) values (60, '315 Pankratz Junction', 'Irving', 'TX', '75062');

insert into inventory (inventory_id, inventory_quantity, product_id) values (1, 87, 1);
insert into inventory (inventory_id, inventory_quantity, product_id) values (2, 82, 2);
insert into inventory (inventory_id, inventory_quantity, product_id) values (3, 37, 3);
insert into inventory (inventory_id, inventory_quantity, product_id) values (4, 26, 4);
insert into inventory (inventory_id, inventory_quantity, product_id) values (5, 35, 5);
insert into inventory (inventory_id, inventory_quantity, product_id) values (6, 49, 6);
insert into inventory (inventory_id, inventory_quantity, product_id) values (7, 57, 7);
insert into inventory (inventory_id, inventory_quantity, product_id) values (8, 45, 8);
insert into inventory (inventory_id, inventory_quantity, product_id) values (9, 64, 9);
insert into inventory (inventory_id, inventory_quantity, product_id) values (10, 41, 10);

insert into employee (employee_id, employee_name, title, employee_dob, hire_date) values (1, 'Agatha', 'Baker', '1985/09/01', '2018/02/14');
insert into employee (employee_id, employee_name, title, employee_dob, hire_date) values (2, 'Herr Mendl', 'Owner', '1962/06/04', '2014/07/04');
insert into employee (employee_id, employee_name, title, employee_dob, hire_date) values (3, 'Ardeen Grimm', 'Janitor', '1986/11/13', '2014/12/26');
insert into employee (employee_id, employee_name, title, employee_dob, hire_date) values (4, 'Renelle Brevetor', 'Assitant Baker', '1975/03/12', '2018/06/18');
insert into employee (employee_id, employee_name, title, employee_dob, hire_date) values (5, 'Lammond Vautier', 'Intern', '1999/09/13', '2018/06/16');

insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (1, 1, 1, 1, '2014/10/28', 2, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (2, 2, 2, 2, '2014/01/07', 10, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (3, 3, 3, 3, '2014/01/17', 10, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (4, 4, 4, 4, '2014/08/12', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (5, 5, 5, 5, '2014/02/28', 6, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (6, 6, 6, 6, '2014/03/09', 9, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (7, 7, 7, 7, '2014/09/04', 7, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (8, 8, 8, 8, '2014/08/17', 8, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (9, 9, 9, 9, '2015/10/21', 9, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (10, 10, 10, 10, '2015/07/15', 2, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (11, 1, 11, 11, '2015/05/19', 6, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (12, 1, 12, 12, '2015/12/03', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (13, 1, 13, 13, '2015/04/05', 6, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (14, 1, 14, 14, '2015/03/02', 6, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (15, 1, 15, 15, '2015/04/16', 9, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (16, 1, 16, 16, '2015/07/20', 9, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (17, 1, 17, 17, '2015/05/03', 8, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (18, 1, 18, 18, '2016/02/04', 4, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (19, 1, 19, 19, '2016/11/28', 1, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (20, 10, 20, 20, '2016/07/21', 7, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (21, 2, 21, 21, '2016/09/02', 10, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (22, 2, 22, 22, '2016/03/09', 3, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (23, 2, 23, 23, '2016/04/04', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (24, 2, 24, 24, '2016/10/21', 2, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (25, 2, 25, 25, '2016/03/31', 10, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (26, 6, 26, 26, '2016/03/13', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (27, 7, 27, 27, '2016/10/20', 6, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (28, 8, 28, 28, '2016/07/31', 4, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (29, 9, 29, 29, '2016/01/04', 6, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (30, 3, 30, 30, '2017/03/29', 8, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (31, 1, 31, 31, '2017/01/10', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (32, 2, 32, 32, '2017/11/22', 6, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (33, 3, 33, 33, '2017/06/11', 7, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (34, 4, 34, 34, '2017/12/16', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (35, 5, 35, 35, '2017/05/23', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (36, 6, 36, 36, '2017/03/28', 9, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (37, 3, 37, 37, '2017/02/23', 7, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (38, 3, 38, 38, '2018/10/23', 9, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (39, 3, 39, 39, '2018/01/21', 1, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (40, 10, 40, 40, '2018/09/07', 4, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (41, 1, 41, 41, '2018/02/06', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (42, 2, 42, 42, '2018/01/09', 7, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (43, 3, 43, 43, '2018/01/03', 2, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (44, 4, 44, 44, '2018/12/11', 6, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (45, 5, 45, 45, '2018/11/16', 6, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (46, 6, 46, 46, '2019/12/10', 2, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (47, 7, 47, 47, '2019/01/11', 5, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (48, 8, 48, 48, '2019/02/16', 5, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (49, 9, 49, 49, '2019/11/24', 6, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (50, 10, 50, 50, '2019/07/29', 2, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (51, 1, 1, 1, '2019/01/10', 7, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (52, 2, 2, 52, '2019/08/22', 8, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (53, 3, 3, 53, '2019/11/06', 1, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (54, 4, 4, 54, '2019/09/20', 9, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (55, 1, 5, 55, '2019/05/21', 6, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (56, 6, 6, 56, '2019/08/23', 9, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (57, 7, 7, 57, '2019/03/26', 10, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (58, 8, 8, 58, '2019/07/22', 6, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (59, 9, 9, 59, '2019/06/03', 9, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (60, 1, 10, 60, '2019/01/17', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (61, 1, 11, 1, '2019/07/08', 4, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (62, 2, 12, 1, '2019/02/05', 5, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (63, 3, 13, 1, '2019/08/19', 9, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (64, 4, 14, 1, '2019/04/25', 2, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (65, 5, 15, 1, '2019/07/14', 10, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (66, 6, 16, 1, '2019/01/26', 10, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (67, 7, 17, 1, '2019/11/29', 3, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (68, 8, 18, 1, '2019/05/08', 2, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (69, 9, 19, 1, '2019/08/14', 7, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (70, 1, 20, 1, '2019/08/06', 1, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (71, 1, 21, 1, '2019/02/17', 8, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (72, 2, 22, 1, '2019/04/29', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (73, 3, 23, 1, '2019/09/27', 2, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (74, 4, 24, 1, '2019/01/07', 5, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (75, 5, 25, 1, '2019/11/18', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (76, 7, 26, 1, '2019/01/12', 2, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (77, 7, 27, 17, '2019/03/25', 1, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (78, 7, 28, 18, '2019/03/06', 6, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (79, 7, 29, 29, '2019/05/24', 4, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (80, 8, 30, 30, '2019/05/07', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (81, 1, 1, 1, '2019/05/13', 3, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (82, 2, 2, 52, '2019/05/16', 2, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (83, 3, 3, 23, '2016/05/07', 4, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (84, 4, 4, 14, '2019/06/19', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (85, 5, 5, 25, '2019/07/17', 8, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (86, 6, 1, 36, '2019/07/30', 10, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (87, 7, 1, 47, '2019/08/02', 10, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (88, 8, 1, 18, '2019/08/28', 8, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (89, 9, 1, 9, '2019/11/03', 2, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (90, 1, 1, 1, '2019/11/23', 3, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (91, 1, 1, 1, '2020/01/13', 5, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (92, 2, 2, 2, '2020/01/03', 3, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (93, 3, 3, 3, '2020/02/08', 9, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (94, 4, 4, 4, '2020/03/10', 3, 5,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (95, 2, 5, 5, '2020/03/02', 5, 4,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (96, 1, 6, 1, '2020/04/23', 6, 3,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (97, 1, 1, 1, '2020/04/20', 3, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (98, 1, 1, 1, '2020/05/23', 7, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (99, 1, 1, 1, '2020/05/11', 3, 1,'Delivered');
insert into order_list (order_id, product_id, customer_id, location_id, order_date, order_quantity, employee_id, order_status) values (100, 1, 1, 1, '2020/06/02', 10, 1,'Delivered');

insert into location_customer (location_id, customer_id) values (1, 1);
insert into location_customer (location_id, customer_id) values (2, 2);
insert into location_customer (location_id, customer_id) values (3, 3);
insert into location_customer (location_id, customer_id) values (4, 4);
insert into location_customer (location_id, customer_id) values (5, 5);
insert into location_customer (location_id, customer_id) values (6, 6);
insert into location_customer (location_id, customer_id) values (7, 7);
insert into location_customer (location_id, customer_id) values (8, 8);
insert into location_customer (location_id, customer_id) values (9, 9);
insert into location_customer (location_id, customer_id) values (10, 10);
insert into location_customer (location_id, customer_id) values (11, 11);
insert into location_customer (location_id, customer_id) values (12, 12);
insert into location_customer (location_id, customer_id) values (13, 13);
insert into location_customer (location_id, customer_id) values (14, 14);
insert into location_customer (location_id, customer_id) values (15, 15);
insert into location_customer (location_id, customer_id) values (16, 16);
insert into location_customer (location_id, customer_id) values (17, 17);
insert into location_customer (location_id, customer_id) values (18, 18);
insert into location_customer (location_id, customer_id) values (19, 19);
insert into location_customer (location_id, customer_id) values (20, 20);
insert into location_customer (location_id, customer_id) values (21, 21);
insert into location_customer (location_id, customer_id) values (22, 22);
insert into location_customer (location_id, customer_id) values (23, 23);
insert into location_customer (location_id, customer_id) values (24, 24);
insert into location_customer (location_id, customer_id) values (25, 25);
insert into location_customer (location_id, customer_id) values (26, 26);
insert into location_customer (location_id, customer_id) values (27, 27);
insert into location_customer (location_id, customer_id) values (28, 28);
insert into location_customer (location_id, customer_id) values (29, 29);
insert into location_customer (location_id, customer_id) values (30, 30);
insert into location_customer (location_id, customer_id) values (31, 31);
insert into location_customer (location_id, customer_id) values (32, 32);
insert into location_customer (location_id, customer_id) values (33, 33);
insert into location_customer (location_id, customer_id) values (34, 34);
insert into location_customer (location_id, customer_id) values (35, 35);
insert into location_customer (location_id, customer_id) values (36, 36);
insert into location_customer (location_id, customer_id) values (37, 37);
insert into location_customer (location_id, customer_id) values (38, 38);
insert into location_customer (location_id, customer_id) values (39, 39);
insert into location_customer (location_id, customer_id) values (40, 40);
insert into location_customer (location_id, customer_id) values (41, 41);
insert into location_customer (location_id, customer_id) values (42, 42);
insert into location_customer (location_id, customer_id) values (43, 43);
insert into location_customer (location_id, customer_id) values (44, 44);
insert into location_customer (location_id, customer_id) values (45, 45);
insert into location_customer (location_id, customer_id) values (46, 46);
insert into location_customer (location_id, customer_id) values (47, 47);
insert into location_customer (location_id, customer_id) values (48, 48);
insert into location_customer (location_id, customer_id) values (49, 49);
insert into location_customer (location_id, customer_id) values (50, 50);
insert into location_customer (location_id, customer_id) values (51, 11);
insert into location_customer (location_id, customer_id) values (52, 2);
insert into location_customer (location_id, customer_id) values (53, 3);
insert into location_customer (location_id, customer_id) values (54, 4);
insert into location_customer (location_id, customer_id) values (55, 5);
insert into location_customer (location_id, customer_id) values (56, 6);
insert into location_customer (location_id, customer_id) values (57, 7);
insert into location_customer (location_id, customer_id) values (58, 8);
insert into location_customer (location_id, customer_id) values (59, 9);
insert into location_customer (location_id, customer_id) values (60, 10);
