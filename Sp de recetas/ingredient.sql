/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [recipes2]
GO
/****** Object:  StoredProcedure [dbo].[sp_ingredient]    Script Date: 07/01/2018 13:14:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_ingredient]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_ingredient int = null,
@i_ingredient_id varchar(20) = null,
@i_name varchar(50)= null,
@i_quantity float =null,
@i_image varchar(200)=null,
@i_unit int= null,				--HACE REFERENCIA A LA TABLA CONCEPTS
@i_cost float= null,
@i_factor float= null,
@i_category int= null,			--HACE REFERENCIA A LA TABLA CONCEPTS
@i_origin int =null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_ingredient
    end
    
    if(@i_action='S2')
    begin
        select* from t_ingredient where in_ingredient=@i_ingredient
    end

	if(@i_action='S3')
    begin
	 select in_ingredient,in_ingredient_id,in_name,in_unit,
		in_quantity,in_image,
		(select co_name from t_concept where co_concept=2 and co_correlative=in_unit) as UNIT,
		(select co_abbreviation from t_concept where co_concept=2 and co_correlative=in_unit) as UNITABB,
		in_cost,in_factor,in_category,
		(select co_name from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORY,
		(select co_abbreviation from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORYABB,
		in_origin,
		(select co_name from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGIN,
		(select co_abbreviation from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGINABB

		from t_ingredient 
	end
	if(@i_action='S4')
	begin
	select in_ingredient,in_ingredient_id,in_name,in_unit,in_quantity,in_image,
		(select co_name from t_concept where co_concept=2 and co_correlative=in_unit) as UNIT,
		(select co_abbreviation from t_concept where co_concept=2 and co_correlative=in_unit) as UNITABB,
		in_cost,in_factor,in_category,
		(select co_name from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORY,
		(select co_abbreviation from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORYABB,
		in_origin,
		(select co_name from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGIN,
		(select co_abbreviation from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGINABB

		from t_ingredient 
		where in_ingredient=@i_ingredient
	end	if(@i_action='S5')
	begin
	select in_ingredient,in_ingredient_id,in_unit,in_quantity,in_image,
		(select co_name from t_concept where co_concept=2 and co_correlative=in_unit) as UNIT,in_name + ' ['+
		(select co_abbreviation from t_concept where co_concept=2 and co_correlative=in_unit) + ']' as in_name,
		in_cost,in_factor,in_category,
		(select co_name from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORY,
		(select co_abbreviation from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORYABB,
		in_origin,
		(select co_name from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGIN,
		(select co_abbreviation from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGINABB

		from t_ingredient 
	end
	if(@i_action='F1')
	begin 
		select *
		from t_ingredient
		where in_name = @i_name
	end
	if(@i_action='F2')
    begin
        select y.in_ingredient_nutrient, x.nu_nutrient,x.nu_name,in_quantity
		from t_nutrient x,t_ingredient_nutrient y
		where x.nu_nutrient=y.in_nutrient and @i_ingredient=y.in_ingredient
    end
	
	if(@i_action='F3')
    begin 
		
	 select in_ingredient,in_ingredient_id,in_name,in_unit,
		in_quantity,in_image,
		(select co_name from t_concept where co_concept=2 and co_correlative=in_unit) as UNIT,
		(select co_abbreviation from t_concept where co_concept=2 and co_correlative=in_unit) as UNITABB,
		in_cost,in_factor,in_category,
		(select co_name from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORY,
		(select co_abbreviation from t_concept where co_concept=3 and co_correlative=in_category) as CATEGORYABB,
		in_origin,
		(select co_name from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGIN,
		(select co_abbreviation from t_concept where co_concept=4 and co_correlative=in_origin) as ORIGINABB

		from t_ingredient 
		where @i_origin = in_origin and @i_category = in_category
    end
    if(@i_action='I1')
    begin
        	insert into t_ingredient
			(		
			in_ingredient_id,
			in_name,
			in_unit,
			in_quantity,
			in_image,
			in_cost,
			in_factor,
			in_category,				
			in_origin		
			)
		values
			(			
			@i_ingredient_id,
			@i_name,
			@i_unit,		
			convert(decimal(10, 2), @i_quantity),
			@i_image,
			convert(decimal(10, 2), @i_cost),
			convert(decimal(10, 2), @i_factor),
			@i_category,			
			@i_origin
			)
    end

        if(@i_action='U1')
   begin
		update t_ingredient set 
			
			in_ingredient_id=@i_ingredient_id,
			in_name=@i_name,
			in_unit=@i_unit,					
			in_cost=convert(decimal(10, 2), @i_cost),
			in_factor=convert(decimal(10, 2), @i_factor),
			in_quantity = convert(decimal(10, 2), @i_quantity),
			in_image = @i_image,
			in_category=@i_category,				
			in_origin=@i_origin
		where in_ingredient=@i_ingredient
	end

        if(@i_action='D1')
    begin		
		delete t_ingredient_nutrient where in_ingredient = @i_ingredient
        delete t_ingredient where in_ingredient=@i_ingredient
    end

end
