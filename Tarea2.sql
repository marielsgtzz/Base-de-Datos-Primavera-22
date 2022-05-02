create table avengers_email(
	id_avenger numeric(4,0) constraint pk_avengers_email primary key,
	nombre varchar(50) not null,
	email varchar(100) not null
);

create sequence avengers_email_id_avenger_seq start 1 increment 1;
alter table avengers_email alter column id_avenger set default nextval('avengers_email_id_avenger_seq') 




insert into avengers_email (nombre, email) values 
('Wanda Maximoff','wanda.maximoff@avengers.org'),
('Pietro Maximoff',	'pietro@mail.sokovia.ru'),
('Erik Lensherr',	'fuck_you_charles@brotherhood.of.evil.mutants.space'),
('Charles Xavier',	'i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste.'),
('Anthony Edward Stark',	'iamironman@avengers.gov'),
('Steve Rogers',	'americas_ass@anti_avengers'),
('The Vision',	'vis@westview.sword.gov'),
('Clint Barton',	'bul@lse.ye'),
('Natasja Romanov',	'blackwidow@kgb.ru'),
('Thor', 'god_of_thunder-^_^@royalty.asgard.gov'),
('Logan',	'wolverine@cyclops_is_a_jerk.com'),
('Ororo Monroe',	'ororo@weather.co'),
('Scott Summers',	'o@x'),
('Nathan Summers',	'cable@xfact.or'),
('Groot',	'iamgroot@asgardiansofthegalaxyledbythor.quillsux'),
('Nebula',	'idonthaveelektras@complex.thanos'),
('Gamora',	'thefiercestwomaninthegalaxy@thanos.'),
('Rocket', 'shhhhhhhh@darknet.ru');

insert into avengers_email (nombre, email) values 
('Mariel','m%@avengers.org');
--Construyan un query que regrese emails inválidos.
--		Tomo como email válido que haya contenido antes y después de la @, y que después haya un punto y algo más. ej. (h@bla.co)
select a.email from avengers_email a where (a.email like '@%' or a.email like '%.' or a.email not like '%@%' or a.email not like '%@%.%' or 
(a.email like '%^@%' or a.email  like '%!@%' or a.email  like '%>@%' or a.email  like '%<@%' or a.email  like '%?@%' or a.email  like '%"@%' 
or a.email  like '%:@%' or a.email  like '%;@%' or a.email  like '%,@%' or a.email  like '%$@%'));
	--select a.email from avengers_email a where a.email not like '%@%'; --no cumple con la condición de contenido antes y después de la @
	--select a.email from avengers_email a where a.email like '%.'; --muestra los que no tienen algo después del punto 
	--select a.email from avengers_email a where a.email not like '%@%.%'; --no tiene un punto después de la @
	--Caracteres inválidos
		--select a.email from avengers_email a where a.email  like '%^@%';
		--select a.email from avengers_email a where a.email  like '%!@%';
