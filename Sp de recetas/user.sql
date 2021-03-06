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
/****** Object:  StoredProcedure [dbo].[sp_user]    Script Date: 06/01/2018 7:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER procedure [dbo].[sp_user]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_user int=null,
@i_name varchar(50)=null,
@i_last_name varchar(50)=null,
@i_mother_last_name varchar(50)=null,
@i_mail varchar(50)=null,
@i_phone varchar(20)=null,
@i_address varchar(300)=null,
@i_master bit=null,
@i_password varchar(50)=null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_user
    end
    
    if(@i_action='S2')
    begin
        select* from t_user where us_mail=@i_mail 
	end
	if(@i_action='S3')
    begin
        select* from t_user where us_user= @i_user
	end
	if(@i_action='S4')
	begin
		select * from t_user where us_mail=@i_mail and us_password=@i_password
	end
	if(@i_action='F1')
	begin
		select or_order_date,or_total_quantity,or_total_price,or_order
		from t_order
		where or_user = @i_user and or_confirm = 0		
	end 
	--me devuelve las recetas de la orden sin confirmar del usuario
	if(@i_action='F2')
	begin
		select ro.ro_recipe_order,ro.ro_quantity,ro.ro_price,ro.ro_key,
				(select re_name from t_recipe where re_recipe = ro_key) as RECIPE,
				(select re_image from t_recipe where re_recipe = ro_key) as re_image,
				(select re_total_cost from t_recipe where re_recipe = ro_key) as re_total_cost,
				(select co_name from t_recipe , t_concept where co_concept = 1 and re_recipe = ro_key and re_turn = co_correlative ) as TURNO,
				ro.ro_person
		from t_order o,t_recipe_order ro
		where o.or_user=@i_user and o.or_order=ro.ro_order and o.or_confirm = 0 and ro_type =1
	end
	--me devuelve los ingredientes de la orden sin sonfirmar del usuario
	if(@i_action='F3')
	begin
		select ro.ro_recipe_order,ro.ro_quantity,ro.ro_price,ro.ro_key,
				(select in_name from t_ingredient where in_ingredient = ro_key) as INGREDIENT,
				(select in_image from t_ingredient where in_ingredient = ro_key) as in_image,
				(select in_cost from t_ingredient where in_ingredient = ro_key) as re_total_cost,
				(select co_name from t_ingredient , t_concept where co_concept = 2 and in_ingredient = ro_key and in_unit = co_correlative ) as UNIT,
				ro.ro_person
		from t_order o,t_recipe_order ro
		where o.or_user=@i_user and o.or_order=ro.ro_order and o.or_confirm = 0 and ro_type =0
	end
	--devuelve las recetas de un usuario
	if(@i_action='F4')
	begin
		select re_recipe,re_recipe_id,re_turn,re_name,
		(select co_name from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNO,	
		(select co_abbreviation from t_concept where co_concept = 1 and co_correlative = re_turn) as TURNOABB,
		(select co_name from t_concept where co_concept = 2 and co_correlative = re_unit) as UNIT,	
		(select co_abbreviation from t_concept where co_concept = 2 and co_correlative = re_unit) as UNITABB,re_quantity,
		re_image,re_url_video, re_total_cost,re_observation,re_of_user
		from t_recipe,t_user_recipe
		where re_of_user = 1 and re_recipe=ur_recipe and ur_user=@i_user
	end
    if(@i_action='I1')
    begin
        	insert into t_user
			(	
				us_name ,
				us_last_name ,
				us_mother_last_name,
				us_mail ,
				us_phone,
				us_address,
				us_master,
				us_password
			)
		values
			(
				@i_name ,
				@i_last_name ,
				@i_mother_last_name,
				@i_mail ,
				@i_phone,
				@i_address,
				@i_master,
				@i_password
			)
    end

        if(@i_action='U1')
   begin
		update t_user set 
			
				us_name =@i_name ,
				us_last_name=@i_last_name ,
				us_mother_last_name=@i_mother_last_name,
				us_mail=@i_mail ,
				us_phone=@i_phone,
				us_address=@i_address,
				us_master=@i_master,
				us_password=@i_password
		where us_user=@i_user
	end

        if(@i_action='D1')
    begin
        delete t_user where us_user=@i_user
    end

	if(@i_action='F1')
	begin
		select* from t_user where us_mail =@i_mail
	end

	if(@i_action='U2')
   begin
		update t_user set 
			
				us_name =@i_name ,
				us_last_name=@i_last_name ,
				us_mother_last_name=@i_mother_last_name,
				us_phone=@i_phone
		where us_user=@i_user
	end
end
