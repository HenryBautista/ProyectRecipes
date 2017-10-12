
 
create table t_nutrient
(
nu_nutrient int identity(1,1) not null primary key,
nu_name varchar(50),
nu_quantity float,
)

create table t_ingredient
(
in_ingredient int identity(1,1) not null primary key,
in_ingredient_id varchar(20),
in_name varchar(50),
in_unit int,					--HACE REFERENCIA A LA TABLA CONCEPTS
in_quantity int,				
in_image varchar(200),
in_cost float,
in_factor float,
in_category int,				--HACE REFERENCIA A LA TABLA CONCEPTS
in_origin int				    --HACE REFERENCIA A LA TABLA CONCEPTS
)


create table t_ingredient_nutrient
(
in_ingredient_nutrient int identity(1,1) not null primary key,
in_nutrient int foreign key references t_nutrient(nu_nutrient),
in_ingredient int foreign key references t_ingredient(in_ingredient),
in_quantity int,
)
-- aqui guardaremos el dato para la historia de su empresa y la url de su imagen con al nombre "MiEMPRESA"
create table t_recipe
(
re_recipe int not null identity(1,1) primary key,
re_recipe_id varchar(20),
re_name varchar(50),
re_turn int,					--HACE REFERNCIA A LA TABLA CONCEPTS
re_image varchar(200),
re_url_video varchar(200),
re_total_cost float,			--CALCULABLE, PERO IGUALMENTE NECESITA SER GRABADO
re_observation varchar(max),
re_of_user bit					--CONTOLA SI LA RECETA LA CREO UN USUARIO, 0 PARA USUARIO 1 PARA MASTER
)

create table t_recipe_ingredient
(
ri_recipe_ingredient int not null identity(1,1) primary key,
ri_recipe int foreign key references t_recipe,
ri_ingredient int foreign key references t_ingredient(in_ingredient),
ri_quantity int,
ri_observation varchar(max)
)

create table t_discount
(
di_discount int identity(1,1) not null primary key,
di_recipe int foreign key references t_recipe(re_recipe),
di_state bit,
di_type bit,					--0 para recetas y 1 para ingredientes
di_discount_quantity float,		--CANTIDAD DE DINERO PARA EL DESCUENTO
)

create table t_user
(
us_user int not null identity(1,1) primary key,
us_name varchar(50),
us_last_name varchar(50),
us_mother_last_name varchar(50),
us_mail varchar(50),
us_phone varchar(20),
us_address varchar (300),
us_master bit
)

create table t_person
(
pe_person int not null primary key identity(1,1),
pe_name varchar(50),
pe_user int foreign key references t_user(us_user)
)

create table t_order
(
or_order int not null identity(1,1) primary key,
or_order_date date,
or_user int foreign key references t_user(us_user),
or_total_quantity int,
or_total_price float
)

create table t_recipe_order
(
ro_recipe_order int not null identity(1,1) primary key,
ro_order int foreign key references t_order(or_order),
ro_key int,
ro_type bit,					--0 para cerectas y 1 para ingredientes
ro_quantity int,
ro_price float,
ro_person int foreign key references t_person(pe_person),
ro_ok bit,						--bit que verifica si fue atendido 
)

create table t_comentary
(
co_comentary int identity(1,1) not null primary key,
co_recipe int foreign key references t_recipe(re_recipe),
co_user int foreign key references t_user(us_user),
co_text varchar(max),
)

create table t_user_recipe
(
ur_user_recipe int not null identity(1,1) primary key,
ur_user int foreign key references t_user(us_user),
ur_recipe int foreign key references t_recipe(re_recipe)
)

create table t_promotion
(
pr_promotion int not null identity(1,1) primary key,
pr_name varchar(50),
pr_title varchar(50),
pr_text varchar(max),
pr_image varchar(200)
)
create table t_consult(
co_consult int not null identity(1,1)  primary key,
co_date date, 
co_name varchar(50) not null,
co_text varchar(max),
co_email varchar(50),
co_is bit			--consulta atendida 0 no 1 
)

create table t_concept
(
co_concept int,
co_correlative int,
co_name varchar(50),
co_abbreviation varchar(20)
)

INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(1,0,'TURNOS','TURNOS')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(1,1,'DESAYUNO','DES')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(1,2,'ALMUERZO','ALM')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(1,3,'CENA','CENA')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(2,0,'UNIDADES','UNIDADES')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(2,1,'KILO','KG')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(2,2,'LITRO','LT')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(3,0,'CATEGORIA','CATEGORIA')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(3,1,'CATEGORIA 1','CAT1')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(3,2,'CATEGORIA 2','CAT2')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(4,0,'ORIGEN','ORIGEN')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(4,1,'ANIMAL','ANI')
INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
VALUES(4,2,'VEGETAL','VEG')