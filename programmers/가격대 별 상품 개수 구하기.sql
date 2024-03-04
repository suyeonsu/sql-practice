SELECT PRICE_GROUP, COUNT(PRODUCT_ID) PRODUCTS
FROM (
    SELECT PRODUCT_ID, TRUNCATE(PRICE, -4) PRICE_GROUP
    FROM PRODUCT
    ) P
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP
