--Функція
SELECT * FROM cereal left join rating using(cereal_id);
SELECT delete_cereals();
insert into cereal(cereal_id, name, type, calories, protein, fat, sugar,manufacturer_id)
Values
	(3, 'Cocoa Puffs','C',110, 1, 1, 13,'G'),
	(7, 'Lucky Charms','C',110, 2, 1, 12,'G');
	
INSERT INTO rating (rating_id, rating_score,date,cereal_id)
VALUES 
  (3, 22.7,'2024-01-15',3),
  (7, 26.7,'2024-01-15',7);
  
--Процедура
CALL cereal_nut('Maypo')


--Тригер
insert into cereal(cereal_id, name, type, calories, protein, fat, sugar,manufacturer_id)
Values
	(8, 'Cinnamon Toast Crunch','C',110, 1, 1, 13,'G');
select * from cereal;

delete from cereal where cereal_id='8';

