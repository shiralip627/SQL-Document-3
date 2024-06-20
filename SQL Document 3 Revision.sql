-- 1. List all cutomers who live in Texas.
select customer.first_name, customer.last_name, city, country, postal_code
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'United States' and postal_code like '7____%';
-- Clinton Buford, Kim Cruz, Ian Still, & Cassandra Walters.

-- 2. Get all payments above $6.99 with the customer's full name.
SELECT first_name, last_name, amount
FROM customer
right join payment
ON customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers' names who have made payments over $175.
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount)desc
)
group by customer_id, first_name, last_name;

-- 4. List all customers that live in Nepal.
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select staff_id, COUNT(staff_id)
from payment
group by staff_id;
-- Jon Stephens had the most transactions.

-- 6. How many movies of each rating are there?
select rating, count(rating)
from film
group by rating;
-- There are 194 PG rated films, 178 G rated films, 223 PG-13 rated films, 195 R rated films, and 210 NC-17 rated films.

-- 7.Show all customers who have made a single payment above $6.99.
select *
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

-- 8. How many free rentals did our stores give away?
select amount, COUNT(amount)
from payment
group by amount
order by amount;
-- The stores gave away a total of 12 rentals for free.