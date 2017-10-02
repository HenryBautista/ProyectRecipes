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
/****** Object:  StoredProcedure [dbo].[sp_order]    Script Date: 02/10/2017 18:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_order]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_order int  =null,
@i_order_date date =null,
@i_user int =null,
@i_total_quantity int =null,
@i_total_price float =null,
@i_confirm bit = null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_order order by or_order desc
    end
    
    if(@i_action='S2')
    begin
        select* from t_order where or_order=@i_order
	end
	--muestra los ingredientes de las ordenes de solo ingredientes 
	if(@i_action='S3')
    begin
        select or_order_date,(select us_user+' '+ us_name+' '+ us_last_name from t_user where us_user = or_user) as us_name,
				in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,t_ingredient
		where or_order=ro_order and or_confirm = 'true' and ro_type = 'false' and ro_key = in_ingredient
	end
	--muestra los ingredientes de las recetas en las ordenes
	if(@i_action='S4')
    begin        
        select or_order_date,(select us_user+' '+ us_name+' '+ us_last_name from t_user where us_user = or_user) as us_name,
				rein.in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = rein.in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,(select in_name,in_unit,ri_recipe from t_recipe_ingredient,t_ingredient where ri_ingredient = in_ingredient ) as rein
		where or_order=ro_order and or_confirm = 'true' and ro_type = 'true' and ro_key = rein.ri_recipe
	end
	--muestra los ingredientes de las ordenes de solo ingredientes que faltan enviar
	if(@i_action='S3')
    begin
        select or_order_date,(select us_user+' '+ us_name+' '+ us_last_name from t_user where us_user = or_user) as us_name,
				in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,t_ingredient
		where or_order=ro_order and or_confirm = 'true' and ro_type = 'false' and ro_key = in_ingredient and ro_ok = 'false'
	end
	--muestra los ingredientes de las recetas en las ordenes que faltan enviar 
	if(@i_action='S4')
    begin        
        select or_order_date,(select us_user+' '+ us_name+' '+ us_last_name from t_user where us_user = or_user) as us_name,
				rein.in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = rein.in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,(select in_name,in_unit,ri_recipe from t_recipe_ingredient,t_ingredient where ri_ingredient = in_ingredient ) as rein
		where or_order=ro_order and or_confirm = 'true' and ro_type = 'true' and ro_key = rein.ri_recipe and ro_ok = 'false'
	end
    if(@i_action='I1')
    begin
        	insert into t_order
			(	
				or_order_date,
				or_user ,
				or_total_quantity ,
				or_total_price,
				or_confirm
			)
		values
			(
				@i_order_date,
				@i_user ,
				@i_total_quantity ,
				@i_total_price,
				@i_confirm
			)
    end

        if(@i_action='U1')
   begin
		update t_order set 
			
				or_order_date=@i_order_date,
				or_user =@i_user ,
				or_total_quantity =@i_total_quantity ,
				or_total_price=@i_total_price,
				or_confirm = @i_confirm
		where  or_order=@i_order
	end
	if(@i_action='U2')
	begin
		select @i_total_price = sum(ro_quantity * re_total_cost)
		from t_recipe_order, t_recipe
		where ro_order=@i_order and ro_key = re_recipe
		select @i_total_quantity = sum(ro_quantity)
		from t_recipe_order
		where ro_order = @i_order
		update t_order 
		set or_total_price = @i_total_price,
			or_total_quantity = @i_total_quantity
		where or_order = @i_order
	end
	if(@i_action = 'U3')
	begin
		update t_order
		set or_confirm = 1
		where or_user = @i_user
	end
    if(@i_action='D1')
    begin
        delete t_order where  or_order=@i_order
    end

end
