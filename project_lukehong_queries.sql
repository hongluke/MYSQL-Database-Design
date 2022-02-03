use project;

show tables;

select * from customer;
select * from inventory;
select * from location;
select * from location_customer;
select * from order_list;
select * from employee;

-- Who is the most frequent customer by num_orders?
select full_name, count(*) as num_orders
from order_list o join customer c using (customer_id)
group by customer_id
limit 1;

-- Who is the customer that spends the most?
select full_name, sum(order_quantity * price) as total_spent
from order_list o join customer c using (customer_id)
join product p using (product_id)
group by customer_id;

-- Average $ per order?
select round(sum(order_quantity * price) /count(*),2) as dollars_per_order
from order_list o join customer c using (customer_id)
join product p using (product_id);

-- What percentage of customers order as a gift to someone else's home?
select sum(o.location_id != lc.location_id) / count(o.location_id != lc.location_id) * 100 as gift_percentage
from order_list o join customer c using (customer_id)
join location_customer lc using (customer_id);

-- Who makes the most deliveries?
select employee_name, count(*) as deliveries
from order_list o join employee e using (employee_id)
group by employee_id
order by deliveries desc;

-- checks the inventory of a product and fills the order for an existing customer
drop procedure if exists inventory_check;

delimiter //
create procedure inventory_check
(
	in product_name_param varchar(255),
    in order_quantity_param varchar(255),
    in customer_name_param varchar(255)
)
begin
	-- variable declarations
	declare inventory_id_var int;
    declare inventory_quantity_var int;
	declare product_id_var int;
    declare customer_id_var int;
    declare location_id_var int;
    declare employee_id_var int;
    declare order_date_var date default now();
    declare order_status_var varchar(50);

	declare message varchar(255);

    -- selecting relevant values into variables
	select inventory_id, inventory_quantity, product_id
    into inventory_id_var, inventory_quantity_var, product_id_var
    from inventory i join product p using (product_id)
    where product_name = product_name_param;
	
    select customer_id
    into customer_id_var
    from customer
    where full_name = customer_name_param;
    
    select location_id
    into location_id_var
    from location loc join location_customer lc using (location_id)
    where lc.customer_id = customer_id_var;
	
    select employee_id
    into employee_id_var
    from employee
    where title = 'Intern';
    
	set order_status_var = 'Ordered';
    
    -- Set an error message for lack of inventory
    if (inventory_quantity_var < order_quantity_param) then
		select concat(product_name_param, ' only has a quantity of ', inventory_quantity_var, ' in inventory.') into message;
		signal sqlstate 'HY000' set message_text = message;
	end if;
	
    -- Insert
    insert into order_list (order_date, order_quantity, product_id, customer_id, location_id, employee_id, order_status)
    values (order_date_var, order_quantity_param, product_id_var, customer_id_var, location_id_var, employee_id_var, order_status_var);
end //
delimiter ;

-- check procedure
call inventory_check('Courtesan au Chocolat', 1, 'Monsieur Gustave H.');
select * from order_list;

-- checks the status of the order
DROP TRIGGER IF EXISTS order_update;

DELIMITER //

CREATE TRIGGER order_update
	BEFORE UPDATE ON order_list
	FOR EACH ROW
BEGIN
	if(old.order_status = null or old.order_date < now()) then 
        set new.order_status = 'Delivered';
	else
		set new.order_status = 'Ordered';
	end if;
END; //

DELIMITER ;

-- check trigger
update order_list 
set order_date = '2020/06/17'
where order_id = 101;

select * from order_list;