--Написати функцію яка видає калорійність, білки,жири та цукор сніданку за назвою
DROP PROCEDURE IF EXISTS cereal_nut(varchar(50));

CREATE OR REPLACE PROCEDURE cereal_nut(cereal_arg varchar(50))
LANGUAGE plpgsql
AS $$
DECLARE cereal_calories cereal.calories%TYPE;
DECLARE cereal_protein cereal.protein%TYPE;
DECLARE cereal_fat cereal.fat%TYPE;
DECLARE cereal_sugar cereal.sugar%TYPE;

BEGIN
 SELECT calories, protein, fat, sugar into cereal_calories, cereal_protein, cereal_fat, cereal_sugar
 FROM cereal WHERE cereal.name = cereal_arg;
 RAISE INFO 'Cerelal: % - calories: %, protein: %, fat: %, sugar: %', cereal_arg, cereal_calories, cereal_protein, cereal_fat, cereal_sugar;
END;
$$;

CALL cereal_nut('Maypo')

