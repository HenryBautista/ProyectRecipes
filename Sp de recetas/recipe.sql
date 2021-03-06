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
/****** Object:  StoredProcedure [dbo].[sp_recipe]    Script Date: 05/01/2018 23:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_recipe]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_recipe int =null,
@i_recipe_id varchar(20)=null,
@i_name varchar(50)=null,
@i_turn int=null,					
@i_image varchar(200)=null,			
@i_url_video varchar(200)=null,
@i_total_cost float=null,		
@i_observation varchar(max)=null,
@i_of_user bit = null,
@i_unit int = null,
@i_quantity float = null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_recipe
    end
    
    if(@i_action='S2')
    begin
        select* from t_recipe where re_recipe=@i_recipe
    end

	if(@i_action='S3')
    begin
		select re_recipe,re_recipe_id,re_turn,re_name,
		(select co_name from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNO,	
		(select co_abbreviation from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNOABB,
		(select co_name from t_concept where co_concept = 2 and co_correlative = re_unit) as UNIT,	
		(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = re_unit) as UNITABB,re_quantity,
		re_image,re_url_video, re_total_cost,re_observation,re_of_user
		from t_recipe 
		where re_of_user = 0
    end
	if(@i_action = 'S4')
	begin 
		select re_recipe,re_recipe_id,re_turn,re_name,
		(select co_name from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNO,	
		(select co_abbreviation from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNOABB,
		(select co_name from t_concept where co_concept = 2 and co_correlative = re_unit) as UNIT,	
		(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = re_unit) as UNITABB,re_quantity,
		re_image,re_url_video, re_total_cost,re_observation,re_of_user
		from t_recipe 
		where re_recipe = @i_recipe
	end
	if(@i_action='S5')
    begin
		select re_recipe,re_recipe_id,re_turn,re_name,
		(select co_name from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNO,	
		(select co_abbreviation from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNOABB,
		(select co_name from t_concept where co_concept = 2 and co_correlative = re_unit) as UNIT,	
		(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = re_unit) as UNITABB,re_quantity,
		re_image,re_url_video, re_total_cost,re_observation,re_of_user
		from t_recipe 
		where re_of_user = 1 
    end
	
	if(@i_action='S6')
    begin
		select re_recipe,re_recipe_id,re_turn,us_name,re_name,
		(select co_name from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNO,	
		(select co_abbreviation from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNOABB,
		(select co_name from t_concept where co_concept = 2 and co_correlative = re_unit) as UNIT,	
		(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = re_unit) as UNITABB,re_quantity,
		re_image,re_url_video, re_total_cost,re_observation,re_of_user
		from t_recipe,t_user_recipe,t_user
		where re_of_user = 1 and ur_recipe = re_recipe and ur_user = us_user
    end
	if(@i_action = 'F1')
	begin
		select in_ingredient,in_ingredient_id, in_name,in_cost, in_factor, in_category,in_image,
				(select co_name from t_concept where co_concept = 3 and co_correlative = in_category )as CATEGORY,
				(select co_abbreviation from t_concept where co_concept = 3 and co_correlative = in_category )as CATEGORYABB,
				in_unit,
				(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit )as UNIT,
				(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = in_unit )as UNITABB,
				in_origin,
				(select co_name from t_concept where co_concept = 4 and co_correlative = in_origin )as ORIGIN,
				(select co_abbreviation from t_concept where co_concept = 4 and co_correlative = in_origin )as ORIGINABB,
				ri_recipe_ingredient, ri_quantity,ri_observation
		from t_recipe_ingredient, t_ingredient
		where ri_recipe = @i_recipe and ri_ingredient = in_ingredient
	end
	if(@i_action = 'F2')
	begin
		select * from t_recipe where re_recipe_id = @i_recipe_id
	end
    if(@i_action='I1')
    begin
        	insert into t_recipe
			(
		
				re_recipe_id,
				re_name,
				re_turn,					
				re_image,
				re_url_video,
				re_total_cost,			
				re_observation,
				re_of_user ,
				re_unit,
				re_quantity
			)
		values
			(
		
			@i_recipe_id,
			@i_name,
			@i_turn,				
			@i_image,
			@i_url_video,
			@i_total_cost,			
			@i_observation,
			@i_of_user,
			@i_unit,
			convert(decimal(10, 2), @i_quantity)
			)
    end

        if(@i_action='U1')
   begin
		update t_recipe set 
			
				re_recipe_id=@i_recipe_id,
				re_name=@i_name,
				re_turn=@i_turn,				
				re_image=@i_image,
				re_url_video=@i_url_video,
				re_total_cost=@i_total_cost,			
				re_observation=@i_observation,
				re_of_user =@i_of_user,
				re_unit = @i_unit,
				re_quantity = convert(decimal(10, 2), @i_quantity)
		where re_recipe=@i_recipe
	end

        if(@i_action='D1')
    begin
		delete t_discount where di_recipe = @i_recipe
		delete t_comentary where co_recipe = @i_recipe
		delete t_user_recipe where ur_recipe = @i_recipe
		delete t_recipe_ingredient where ri_recipe = @i_recipe
		delete t_recipe_order where ro_key = @i_recipe
        delete t_recipe where re_recipe = @i_recipe
    end
end
