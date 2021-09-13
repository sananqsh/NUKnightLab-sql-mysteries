SELECT description FROM crime_scene_report WHERE type='murder' AND date=20180115;
SELECT address_number FROM person WHERE address_street_name='Northwestern Dr' ORDER BY address_number;
SELECT * FROM person WHERE address_number=4919;
SELECT transcript FROM interview WHERE person_id=14887;
SELECT * FROM person WHERE name LIKE 'Annabel%' AND address_street_name='Franklin Ave';
SELECT transcript FROM interview WHERE person_id=16371;
SELECT id FROM get_fit_now_member WHERE person_id=16371;
SELECT membership_id, check_in_time, check_out_time FROM get_fit_now_check_in WHERE
SELECT * FROM person WHERE id IN (SELECT person_id FROM get_fit_now_member WHERE id IN ('48Z7A','48Z55');
SELECT * FROM drivers_license WHERE id IN (173289, 423327);

SELECT * FROM facebook_event_checkin WHERE person_id in (28819, 67318);
SELECT * FROM income WHERE ssn IN (138909730,871539279);
SELECT * FROM interview WHERE person_id IN (28819, 67318);
SELECT * FROM facebook_event_checkin WHERE event_name='SQL Symphony Concert' AND date LIKE '201712%' ORDER BY person_id
SELECT * FROM person WHERE id IN (24556,99716);
SELECT * FROM drivers_license WHERE id IN (101191,202298);
SELECT * FROM income WHERE ssn=987756388;

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
INSERT INTO solution VALUES (2, 'Miranda Priestly');
