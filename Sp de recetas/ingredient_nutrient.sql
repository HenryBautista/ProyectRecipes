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
/****** Object:  StoredProcedure [dbo].[sp_ingredient_nutrient]    Script Date: 05/01/2018 23:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_ingredient_nutrient]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_ingredient_nutrient int =null,
@i_nutrient int =null,
@i_ingredient int =null,
@i_quantity float =null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_ingredient_nutrient
    end
    
    if(@i_action='S2')
    begin
        select* from t_ingredient_nutrient where in_ingredient_nutrient=@i_ingredient_nutrient
    end

	if(@i_action='S3')
    begin
        select x.nu_name
		from t_nutrient x,t_ingredient_nutrient y
		where x.nu_nutrient=y.in_nutrient and @i_ingredient=y.in_ingredient
    end
	if(@i_action='F1')
	begin
		select *
		from t_ingredient_nutrient
		where in_ingredient=@i_ingredient and in_nutrient=@i_nutrient
	end
    if(@i_action='I1')
    begin
        	insert into t_ingredient_nutrient
			(
		
				in_nutrient,
				in_ingredient,
				in_quantity
			)
		values
			(
		
			
				@i_nutrient,
				@i_ingredient,
				convert(decimal(10, 2), @i_quantity)
			)
    end

        if(@i_action='U1')
   begin
		update t_ingredient_nutrient set 
			
				in_nutrient=@i_nutrient,
				in_ingredient=@i_ingredient,
				in_quantity=convert(decimal(10, 2), @i_quantity)
		where in_ingredient_nutrient=@i_ingredient_nutrient
	end

        if(@i_action='D1')
    begin
        delete t_ingredient_nutrient where in_ingredient_nutrient=@i_ingredient_nutrient
    end

end
