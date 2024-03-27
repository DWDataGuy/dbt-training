select
-- from raw orders
o.orderid, 
o.orderdate,
o.shipdate, 
o.shipmode,
o.ordersellingprice-o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,

--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,

-- from raw product
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup 

from {{ ref('RAW_ORDERS')}} as o
left join {{ ref('RAW_CUSTOMER') }} as c
on o.customerid = c.customerid
left join {{ ref('RAW_PRODUCT') }} as p
on o.productid = p.productid

{{limit_data_in_dev('orderdate')}} 
