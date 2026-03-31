select query_name, 
round(avg((rating*1.0)/position),2) as quality, 
round(100*sum(rating<3)/count(*),2) as poor_query_percentage
from Queries 
group by query_name;
