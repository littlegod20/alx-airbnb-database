-- INNER JOIN
SELECT *
FROM booking as b
INNER JOIN user as u
ON b.user_id = u.user_id;

-- LEFT JOIN
SELECT *
FROM property p
LEFT JOIN review r
ON p.property_id = r.property_id
ORDER BY p.property_name ASC;

--FULL OUTER JOIN
SELECT * 
FROM user u
FULL OUTER JOIN booking b
ON u.user_id = b.user_id