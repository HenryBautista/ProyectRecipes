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
/****** Object:  StoredProcedure [dbo].[sp_recipe_order]    Script Date: 07/01/2018 12:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_recipe_order]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_recipe_order int =null,
@i_order int=null,
@i_key int =null,
@i_type bit = null,
@i_quantity int=null,
@i_price float=null,
@i_person int=null,
@i_ok bit = null
-----------
)
as
begin
declare @w_costrecipes float = 0,
		@w_costingredent float = 0,
		@w_qty int = 0,
		@w_id int = null

    if(@i_action='S1')
    begin
        select* from t_recipe_order
    end
    
    if(@i_action='S2')
    begin
        select* from t_recipe_order where ro_recipe_order=@i_recipe_order
	end	
    if(@i_action='F1')
    begin
        select* from t_recipe_order where ro_key=@i_key and ro_order = @i_order and ro_type=1
	end
    if(@i_action='F2')
    begin
        select* from t_recipe_order where ro_key=@i_key and ro_order = @i_order and ro_type=0
	end
	if(@i_action='I1')
    begin
        	insert into t_recipe_order
			(	
				ro_order,
				ro_key,
				ro_type,
				ro_quantity,
				ro_price,
				ro_person,
				ro_ok
			)
		values
			(
				
				@i_order,
				@i_key,
				@i_type,
				@i_quantity,
				convert(decimal(10, 2), @i_price),
				@i_person,
				0
			)
			select @w_qty = SUM(ro_quantity) 
			from t_recipe_order
			where ro_order = @i_order

			select @w_costrecipes = SUM(ro_quantity*re_total_cost)
			from t_recipe_order,t_recipe
			where @i_order = ro_order and ro_type = 1 and ro_key = re_recipe

			select @w_costingredent = SUM(ro_quantity*in_factor)
			from t_recipe_order,t_ingredient
			where @i_order = ro_order and ro_type = 0 and ro_key = in_ingredient
			
		update t_order set 
				or_total_quantity =ISNULL( @w_qty,0),
				or_total_price=convert(decimal(10, 2),ISNULL( @w_costingredent,0) + ISNULL (@w_costrecipes,0))
		where  or_order=@i_order
    end

        if(@i_action='U1')
   begin
		update t_recipe_order set 
			
				ro_order=@i_order,
				ro_key=@i_key,
				ro_type = @i_type,
				ro_quantity=@i_quantity,
				ro_price=convert(decimal(10, 2),@i_price*@i_quantity),
				ro_person=@i_person,
				ro_ok = @i_ok
		where ro_recipe_order=@i_recipe_order

		
			select @w_qty = SUM(ro_quantity) 
			from t_recipe_order
			where ro_order = @i_order

			select @w_costrecipes = SUM(ro_quantity*re_total_cost)
			from t_recipe_order,t_recipe
			where @i_order = ro_order and ro_type = 1 and ro_key = re_recipe

			select @w_costingredent = SUM(ro_quantity*in_factor)
			from t_recipe_order,t_ingredient
			where @i_order = ro_order and ro_type = 0 and ro_key = in_ingredient
			
		update t_order set 
				or_total_quantity =ISNULL( @w_qty,0),
				or_total_price=convert(decimal(10, 2),ISNULL( @w_costingredent,0) + ISNULL (@w_costrecipes,0))
		where  or_order=@i_order
	end

        if(@i_action='D1')
    begin
		select @w_id = ro_order from t_recipe_order where ro_recipe_order = @i_recipe_order
        delete t_recipe_order where ro_recipe_order=@i_recipe_order

		
			select @w_qty = SUM(ro_quantity) 
			from t_recipe_order
			where ro_order = @w_id

			select @w_costrecipes = SUM(ro_quantity*re_total_cost)
			from t_recipe_order,t_recipe
			where @w_id = ro_order and ro_type = 1 and ro_key = re_recipe

			select @w_costingredent = SUM(ro_quantity*in_factor)
			from t_recipe_order,t_ingredient
			where @w_id = ro_order and ro_type = 0 and ro_key = in_ingredient
			
		update t_order set 
				or_total_quantity = ISNULL( @w_qty,0),
				or_total_price=convert(decimal(10, 2),ISNULL( @w_costingredent,0) + ISNULL (@w_costrecipes,0))
		where  or_order=@w_id
    end

end
