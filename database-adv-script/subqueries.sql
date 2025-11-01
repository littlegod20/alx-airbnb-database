SELECT * 
FROM property p
WHERE (
  SELECT AVG(rating)
  FROM review r
  WHERE r.property_id = p.property_id
) > 4.0


SELECT *
FROM user u
WHERE (
  SELECT COUNT(*)
  FROM booking b
  WHERE b.user_id = u.user_id
) > 3