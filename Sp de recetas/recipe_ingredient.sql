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
/****** Object:  StoredProcedure [dbo].[sp_recipe_ingredient]    Script Date: 07/01/2018 15:47:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[sp_recipe_ingredient]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_recipe_ingredient int = null,
@i_recipe int =null,
@i_ingredient int =null,
@i_quantity float =null,
@i_observation varchar(max) =null
-----------
)
as
begin
declare @w_total float = 0
    if(@i_action='S1')
    begin
        select* from t_recipe_ingredient
    end    
    if(@i_action='S2')
    begin
        select* from t_recipe_ingredient where ri_recipe_ingredient=@i_recipe_ingredient
	end
	if(@i_action = 'F1')
	begin
		select *
		from t_recipe_ingredient
		where ri_recipe = @i_recipe
	end
	if(@i_action = 'F2')
	begin
		select *
		from t_recipe_ingredient
		where ri_recipe = @i_recipe and ri_ingredient = @i_ingredient
	end
    if(@i_action='I1')
    begin
        	insert into t_recipe_ingredient
			(
		
				ri_recipe,
				ri_ingredient,
				ri_quantity,
				ri_observation
			)
		values
			(
		
				@i_recipe,
				@i_ingredient,
				convert(decimal(10, 2), @i_quantity),
				@i_observation
			)
		--actualiza costo de la receta
			select @w_total = sum(ri_quantity*in_factor) 
			from t_recipe_ingredient,t_ingredient
			where ri_recipe = @i_recipe and ri_ingredient = in_ingredient
			update t_recipe set 			
				re_total_cost=convert(decimal(10, 2), @w_total/re_quantity)
			where re_recipe=@i_recipe
    end

        if(@i_action='U1')
   begin
		update t_recipe_ingredient set 
			
				ri_recipe=@i_recipe,
				ri_ingredient=@i_ingredient,
				ri_quantity=convert(decimal(10, 2), @i_quantity),
				ri_observation=@i_observation
		where ri_recipe_ingredient=@i_recipe_ingredient

		--actualiza costo de la receta
			select @w_total = sum(ri_quantity*in_factor) 
			from t_recipe_ingredient,t_ingredient
			where ri_recipe = @i_recipe and ri_ingredient = in_ingredient
			update t_recipe set 			
				re_total_cost= convert(decimal(10, 2), @w_total/re_quantity)
			where re_recipe=@i_recipe
	end

        if(@i_action='D1')
    begin
        delete t_recipe_ingredient where ri_recipe_ingredient=@i_recipe_ingredient

		--actualiza costo de la receta
			select @w_total = sum(ri_quantity*in_factor) 
			from t_recipe_ingredient,t_ingredient
			where ri_recipe = @i_recipe and ri_ingredient = in_ingredient
			update t_recipe set 			
				re_total_cost= convert(decimal(10, 2), @w_total/re_quantity)
			where re_recipe=@i_recipe
    end

end
