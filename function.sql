ALTER TABLE rating
DROP CONSTRAINT rating_cereal_id_fkey,
ADD CONSTRAINT rating_cereal_id_fkey
FOREIGN KEY (cereal_id) REFERENCES cereal(cereal_id)
ON DELETE CASCADE; 
--Видалення cereal з рейтингом менше 30
DROP FUNCTION IF EXISTS clean_cust();
CREATE OR REPLACE FUNCTION delete_cereals() RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM cereal 
    WHERE cereal.cereal_id IN
        (SELECT cereal.cereal_id
         FROM cereal
         LEFT JOIN rating USING (cereal_id)
         WHERE rating.rating_score < 30);
END;
$$;

-- Виклик функції для видалення cereal з рейтингом менше 30
SELECT delete_cereals();

-- Перевірка результату
SELECT * FROM cereal left join rating using(cereal_id)

--Повернення видалених значень
insert into cereal(cereal_id, name, type, calories, protein, fat, sugar,manufacturer_id)
Values
	(3, 'Cocoa Puffs','C',110, 1, 1, 13,'G'),
	(7, 'Lucky Charms','C',110, 2, 1, 12,'G');
	
INSERT INTO rating (rating_id, rating_score,date,cereal_id)
VALUES 
  (3, 22.7,'2024-01-15',3),
  (7, 26.7,'2024-01-15',7);