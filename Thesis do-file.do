import excel "C:\Users\Bruno\Desktop\School\BA3\Thesis\Data\Data survey numerical - EDITED.xlsx", sheet("Conjoint sheet numerical") firstrow

*editing variables*
rename gender male
replace male = 0 if male == 2

*logit regression*
logit ResponseIndicator Delivery_time_minutes Price Freshness_days e_bike_delivery, robust

logit ResponseIndicator Delivery_time_minutes Price Freshness_days e_bike_delivery age male i.education i.employment_status i.gross_income environmental_awareness k_value, robust

logit ResponseIndicator Delivery_time_minutes Price Freshness_days e_bike_delivery age male i.education i.employment_status i.gross_income environmental_awareness k_value e_bike#c.environmental_awareness c.Price#employment_status c.Delivery_time_minutes#c.k_value e_bike#education c.Price#c.age c.Freshness#gross_income, robust

xtmelogit ResponseIndicator Delivery_time_minutes Price Freshness_days e_bike_delivery   || age male i.education i.employment_status i.gross_income environmental_awareness k_value e_bike#c.environmental_awareness c.Price#employment_status c.Delivery_time_minutes#c.k_value e_bike#education c.Price#c.age c.Freshness#gross_income: , intpoints(10)