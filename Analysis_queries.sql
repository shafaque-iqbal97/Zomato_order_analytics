SELECT * FROM zomato_analysis;

--1. Total Sessions

SELECT COUNT(*) AS total_sessions
FROM zomato_analysis;

--The dataset consists of 100K completed order-level records.

--2.Total Orders & Revenue

SELECT COUNT(*) AS total_orders,
SUM(final_order_value) AS total_revenue,
ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis;

--The platform generated approximately ₹4.65 crore in revenue from 100K orders, with an average order value of ₹465, indicating a high-volume, mid-value transaction model.

--3. Meal Time Analysis
	
SELECT meal_time,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY meal_time
ORDER BY revenue DESC;

--Lunch is the primary revenue driver due to high order volume.
--Dinner orders have higher average value, suggesting opportunities for premium offerings.

--4. Add-On Impact

SELECT any_addon_added,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY any_addon_added;

--Add-ons contribute disproportionately to revenue (~30%) despite lower adoption (~24%), highlighting a strong upselling opportunity.

--5. Offer Impact

SELECT has_offer,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY has_offer;

--Offers slightly increase average order value (₹474 vs ₹460) without negatively impacting revenue, while the majority of orders occur without offers, indicating strong organic demand and reduced dependency on discounts.

--6. Top 5 Cuisines

SELECT restaurant_cuisine,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY restaurant_cuisine
ORDER BY revenue DESC
LIMIT 5;

--North Indian cuisine drives the highest order volume and revenue.
--Italian cuisine has the highest average order value, indicating premium customer preference.

--7. Top Restaurants

SELECT restaurant_name,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY restaurant_name
ORDER BY revenue DESC
LIMIT 5;

--Top-performing restaurants exhibit significantly higher average order values (₹600–₹720), indicating premium pricing and higher customer spend.

--8. Weekend vs Weekday Performance

SELECT is_weekend,
	COUNT(*) AS total_orders,
	SUM(final_order_value) AS revenue,
	ROUND(AVG(final_order_value), 2) AS avg_order_value
FROM zomato_analysis
GROUP BY is_weekend;

--Weekdays drive the majority of orders and revenue (~72%), while average order value remains consistent across weekdays and weekends.



