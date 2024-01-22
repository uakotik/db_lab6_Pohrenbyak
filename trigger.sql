select * from cereal;
drop trigger if exists cereal_insert on cereal;

create or replace function upper_name() returns trigger
language 'plpgsql'
as 
$$
begin
	update cereal set name =upper(name)
	where cereal.cereal_id=new.cereal_id;
	return NULL;
end;
$$;

create trigger cereal_insert
after insert on cereal
for each row execute function upper_name()

insert into cereal(cereal_id, name, type, calories, protein, fat, sugar,manufacturer_id)
Values
	(8, 'Cinnamon Toast Crunch','C',110, 1, 1, 13,'G');

delete from cereal where cereal_id='8';

select * from cereal