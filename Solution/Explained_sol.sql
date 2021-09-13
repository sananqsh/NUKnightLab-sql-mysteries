-- ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City

SELECT description FROM crime_scene_report WHERE type='murder' AND date=20180115;
	-- description
	-- ...
	-- The first witness lives at the last house on "Northwestern Dr".
	-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Witnesses:
	-- Northwestern Dr witness:
		SELECT address_number FROM person WHERE address_street_name='Northwestern Dr' ORDER BY address_number;
			-- address_number
			-- 309
			-- ...
			-- 4919

		SELECT * FROM person WHERE address_number=4919;
			-- id 	  | name 			| license_id | address_number | address_street_name | ssn
			-- 14887 | Morty Schapiro  | 118009 	 | 4919 		  | Northwestern Dr 	| 111564949

		SELECT transcript FROM interview WHERE person_id=14887;
			-- transcript
			-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
			-- The membership number on the bag started with "48Z".
			-- Only gold members have those bags. 	-- Membership_status of both suspects is gold
			-- The man got into a car with a plate that included "H42W".

	-- Info by Annable:
		SELECT * FROM person WHERE name LIKE 'Annabel%' AND address_street_name='Franklin Ave';
			-- id    | name 		   | license_id | address_number | address_street_name  | ssn
			-- 16371 | Annabel Miller  | 490173 	| 103			 | Franklin Ave 		| 318771143

		SELECT transcript FROM interview WHERE person_id=16371;
			-- transcript
			-- I saw the murder happen, and I recognized the killer
			-- from my gym when I was working out last week on January the 9th.

		SELECT id FROM get_fit_now_member WHERE person_id=16371;
			-- 90081 = Annable`s membership ID

		SELECT membership_id, check_in_time, check_out_time FROM get_fit_now_check_in WHERE
		     ...> check_in_date=20180109;
			--		!!I deleted unrelative ones!!		--
			-- membership_id  | check_in_time | check_out_time
			-- 48Z7A 		  | 1600 		  | 1730     		-- suspect
			-- 48Z55 		  | 1530 		  | 1700     		-- suspect
			-- 90081 		  | 1600 		  | 1700     		-- Annable

		SELECT * FROM person WHERE id IN (SELECT person_id FROM get_fit_now_member WHERE id IN ('48Z7A','48Z55');
			-- Info of main suspects:
			-- id 	 | name          | license_id | address_number  | address_street_name   | ssn
			-- 28819 | Joe Germuska  | 173289     | 111 			| Fisk Rd 			    | 138909730
			-- 67318 | Jeremy Bowers | 423327     | 530 			| Washington Pl, Apt 3A | 871539279
			
			--license_IDs: 173289, 423327

		SELECT * FROM drivers_license WHERE id IN (173289, 423327);
			-- id 	   | age | height | eye_color | hair_color | gender | plate_number | car_make  | car_model
			-- 173289  | 20	 | 186	  | brown	  | black	   | male	| 0F22A3	   | Impala	   | Chevy 1967
			-- 423327  | 30  | 70 	  | brown     | brown 	   | male   | 0H42W2 	   | Chevrolet | Spark LS

-- Facebook:
SELECT * FROM facebook_event_checkin WHERE person_id in (28819, 67318);
	-- person_id | event_id | event_name 				| date
	-- 67318 	  | 4719 	 | The Funky Grooves Tour   | 20180115		//day of the crime
	-- 67318 	  | 1143 	 | SQL Symphony Concert 	| 20171206

-- 67318: matches plate number and was on the crime scene
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT * FROM interview WHERE person_id IN (28819, 67318);
	-- person_id | transcript
	-- 67318 | I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
	-- She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT * FROM facebook_event_checkin WHERE event_name='SQL Symphony Concert' AND date LIKE '201712%' ORDER BY person_id
-- ! I deleted those who attended the meeting less than 3 times !
	-- person_id | event_id | event_name | date
	-- 24556 | 1143 | SQL Symphony Concert | 20171207
	-- 24556 | 1143 | SQL Symphony Concert | 20171221
	-- 24556 | 1143 | SQL Symphony Concert | 20171224
	-- 99716 | 1143 | SQL Symphony Concert | 20171206
	-- 99716 | 1143 | SQL Symphony Concert | 20171212
	-- 99716 | 1143 | SQL Symphony Concert | 20171229

SELECT * FROM person WHERE id IN (24556,99716);
	-- id | name | license_id | address_number | address_street_name | ssn
	-- 24556 | Bryan Pardo | 101191 | 703 | Machine Ln | 816663882
	-- 99716 | Miranda Priestly | 202298 | 1883 | Golden Ave | 987756388

SELECT * FROM drivers_license WHERE id IN (101191,202298);
	-- id | age | height | eye_color | hair_color | gender | plate_number | car_make | car_model
	-- 202298 | 68 | 66 | green | red | female | 500123 | Tesla | Model S

SELECT * FROM income WHERE ssn IN (987756388, 816663882);
	-- ssn | annual_income
	-- 987756388 | 310000

INSERT INTO solution VALUES (2, 'Miranda Priestly');
