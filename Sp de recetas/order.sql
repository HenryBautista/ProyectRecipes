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
/****** Object:  StoredProcedure [dbo].[sp_order]    Script Date: 07/01/2018 14:50:20 ******/
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
        select or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = 2) as us_name,
				in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,t_ingredient
		where or_order=ro_order and or_confirm = 1 and ro_type = 0 and ro_key = in_ingredient
	end
	--muestra los ingredientes de las recetas en las ordenes
	if(@i_action='S4')
    begin        
        select or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = or_user) as us_name,
				rein.in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = rein.in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,(select in_name,in_unit,ri_recipe from t_recipe_ingredient,t_ingredient where ri_ingredient = in_ingredient ) as rein
		where or_order=ro_order and or_confirm = 1 and ro_type = 1 and ro_key = rein.ri_recipe
	end
	--muestra los ingredientes de las ordenes de solo ingredientes que faltan enviar
	if(@i_action='S5')
    begin
        select or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = or_user) as us_name,
				in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,t_ingredient
		where or_order=ro_order and or_confirm = 1 and ro_type = 0 and ro_key = in_ingredient and ro_ok = 0
	end
	--muestra los ingredientes de las recetas en las ordenes que faltan enviar 
	if(@i_action='S6')
    begin        
        select or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = or_user) as us_name,
				rein.in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = rein.in_unit) as UNIT,
				ro_quantity,ro_ok
		from t_order ,t_recipe_order,(select in_name,in_unit,ri_recipe from t_recipe_ingredient,t_ingredient where ri_ingredient = in_ingredient ) as rein
		where or_order=ro_order and or_confirm = 1 and ro_type = 1 and ro_key = rein.ri_recipe and ro_ok = 0
	end
	--las ordenes confirmadas pro no enviadas
	if(@i_action='S7')
    begin        
        select or_order, or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = or_user) as us_name,
				or_total_quantity,or_confirm,or_total_price,or_ok
		from t_order 
		where or_confirm = 1 and or_ok = 0
	end
	--las ordenes confirmadas todas
	if(@i_action='S8')
    begin        
        select or_order, or_order_date,(select us_name+' '+ us_last_name+' '+us_mother_last_name from t_user where us_user = or_user) as us_name,
				or_total_quantity,or_confirm,or_total_price,or_ok
		from t_order 
		where or_confirm = 1
	end
	if(@i_action = 'S9')
	begin
		select @i_order as or_order,x.in_name, x.UNIT, SUM(x.ro_quantity) as ro_quantity
		from (select in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = in_unit) as UNIT,
				ro_quantity
		from t_order ,t_recipe_order,t_ingredient
		where or_order = @i_order and or_order=ro_order and or_confirm = 1 and ro_type = 0 and ro_key = in_ingredient 
		union all
        select rein.in_name,(select co_name from t_concept where co_concept = 2 and co_correlative = rein.in_unit) as UNIT,
				(rein.in_quantity/re_quantity)*ro_quantity
		from t_order, t_recipe ,t_recipe_order,(select in_name,in_unit,ri_recipe,in_quantity from t_recipe_ingredient,t_ingredient where ri_ingredient = in_ingredient ) as rein
		where or_order = @i_order and or_order=ro_order and or_confirm = 1 and ro_type = 1 and ro_key = rein.ri_recipe and ro_key = re_recipe
		)as x
		group by in_name,UNIT
	end
	--la orden isn confirmar del usuario 
    if(@i_action='F1')
    begin
        select* from t_order where or_user=@i_user and or_confirm = 0
	end
	--recetas de una orden
	if(@i_action='F2')
	begin
		select ro.ro_recipe_order,ro.ro_quantity,ro.ro_price,ro.ro_key,
				(select re_name from t_recipe where re_recipe = ro_key) as RECIPE,
				(select re_image from t_recipe where re_recipe = ro_key) as re_image,
				(select re_total_cost from t_recipe where re_recipe = ro_key) as re_total_cost,
				(select co_name from t_recipe , t_concept where co_concept = 1 and re_recipe = ro_key and re_turn = co_correlative ) as TURNO,
				ro.ro_person
		from t_order o,t_recipe_order ro
		where o.or_order=@i_order and o.or_order=ro.ro_order and ro_type =1
	end
	--ingredientes de una orden
	if(@i_action='F3')
	begin
		select ro.ro_recipe_order,ro.ro_quantity,ro.ro_price,ro.ro_key,
				(select in_name from t_ingredient where in_ingredient = ro_key) as INGREDIENT,
				(select in_image from t_ingredient where in_ingredient = ro_key) as in_image,
				(select in_cost from t_ingredient where in_ingredient = ro_key) as re_total_cost,
				(select co_name from t_ingredient , t_concept where co_concept = 2 and in_ingredient = ro_key and in_unit = co_correlative ) as UNIT,
				ro.ro_person
		from t_order o,t_recipe_order ro
		where o.or_order=@i_order and o.or_order=ro.ro_order and  ro_type =0
	end
    if(@i_action='I1')
    begin
        	insert into t_order
			(	
				or_order_date,
				or_user ,
				or_total_quantity ,
				or_total_price,
				or_confirm,
				or_ok
			)
		values
			(
				GETDATE(),
				@i_user ,
				@i_total_quantity ,
				@i_total_price,
				0,0
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
		set or_confirm = 1,
			or_order_date = @i_order_date
		where or_order = @i_order
	end
	
	if(@i_action = 'U4')
	begin
		update t_order
		set or_ok = 1
		where or_order = @i_order
	end
    if(@i_action='D1')
    begin
        delete t_order where  or_order=@i_order
    end
end
