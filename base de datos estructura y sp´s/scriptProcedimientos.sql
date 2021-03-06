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
/****** Object:  StoredProcedure [dbo].[sp_comentary]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_comentary]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_comentary int =null,
@i_recipe int=null,
@i_user int =null,
@i_text varchar(max)null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_comentary
    end
    
    if(@i_action='S2')
    begin
        select* from t_comentary where co_comentary=@i_comentary
	end
    if(@i_action='I1')
    begin
        	insert into t_comentary
			(	
				co_recipe,
				co_user, 
				co_text
			)
		values
			(
				
				@i_recipe, 
				@i_user,
				@i_text
			)
    end

        if(@i_action='U1')
   begin
		update t_comentary set 
			
				co_recipe=@i_recipe,
				co_user = @i_user,
				co_text=@i_text
		where co_comentary=@i_comentary
	end

        if(@i_action='D1')
    begin
        delete t_comentary where co_comentary=@i_comentary
    end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_concept]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_concept]
(
@i_action varchar(2),
@i_concept smallint=null,
@i_correlative smallint =null,
@i_name varchar(500) =null,
@i_abbreviation varchar(50) =null
)
as
begin

	if (@i_action ='S1')
	begin
		select *
		from t_concept
		where co_concept =@i_concept and co_correlative >0
	end
	if(@i_action = 'I1')
	begin		
		INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
		VALUES(@i_concept,@i_correlative,@i_name,@i_abbreviation)
	end
	if(@i_action = 'U1')
	begin
		update t_concept set 
			
				co_correlative=@i_correlative,
				co_name=@i_name,
				co_abbreviation=@i_abbreviation

		where co_concept=@i_concept
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_discount]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_discount]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_discount int,
@i_recipe int ,
@i_state bit,
@i_discount_quantity float
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_discount
    end
    
    if(@i_action='S2')
    begin
        select* from t_discount where di_discount=@i_discount
	end
    if(@i_action='I1')
    begin
        	insert into t_discount
			(	di_recipe,
				di_state,
				di_discount_quantity
			)
		values
			(
				@i_recipe,
				@i_state,
				@i_discount_quantity
			)
    end

        if(@i_action='U1')
   begin
		update t_discount set 
			
				di_recipe=@i_recipe,
				di_state=@i_state,
				di_discount_quantity=@i_discount_quantity
		where di_discount=@i_discount
	end

        if(@i_action='D1')
    begin
        delete t_discount where di_discount=@i_discount
    end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ingredient]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ingredient]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ingredient_nutrient]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ingredient_nutrient]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_nutrient]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_nutrient]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_nutrient int =null,
@i_name varchar(50)=null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_nutrient
    end
    
    if(@i_action='S2')
    begin
        select* from t_nutrient where nu_name=@i_name
    end

	if(@i_action='F1')
	begin 
		select *
		from t_nutrient
		where nu_name=@i_name
	end

    if(@i_action='I1')
    begin
        	insert into t_nutrient
			(
		
				nu_name
			)
		values
			(
		
				@i_name
			)
    end

        if(@i_action='U1')
   begin
		update t_nutrient set 
			
				nu_name=@i_name
		where nu_nutrient=@i_nutrient
	end

        if(@i_action='D1')
    begin
        delete t_nutrient where nu_nutrient=@i_nutrient
    end

end

GO
/****** Object:  StoredProcedure [dbo].[sp_order]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_order]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_person]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_person]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_person int =null,
@i_name varchar(50)=null,
@i_user int=null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_person
    end
    
    if(@i_action='S2')
    begin
        select* from t_person where pe_person=@i_person
	end
	if(@i_action='S3')
	begin
		select * from t_person where pe_user = @i_user
	end
    if(@i_action='I1')
    begin
        	insert into t_person
			(	
			pe_name,
			pe_user
			)
		values
			(
				@i_name,
				@i_user
			)
    end

        if(@i_action='U1')
   begin
		update t_person set 
			
			pe_name=@i_name,
			pe_user=@i_user
		where pe_person=@i_person
	end

        if(@i_action='D1')
    begin
        delete t_person where pe_person=@i_person
    end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_promotion]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_promotion]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_promotion int=null,
@i_name varchar(50)=null,
@i_title varchar(50)=null,
@i_text varchar(max)=null,
@i_image varchar(200)=null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_promotion where pr_name!='inicio'
    end    
    if(@i_action='S2')
    begin
        select* from t_promotion where pr_promotion=@i_promotion 
	end
	if(@i_action='F1')
    begin
        select* from t_promotion where pr_name='inicio' 
	end
    if(@i_action='I1')
    begin
        	insert into t_promotion
			(	
				pr_name ,
				pr_title ,
				pr_text ,
				pr_image
			)
		values
			(
			@i_name ,
			@i_title ,
			@i_text ,
			@i_image
			)
    end

        if(@i_action='U1')
   begin
		update t_promotion set 
			
				pr_name=@i_name ,
				pr_title	=@i_title ,
				pr_text =@i_text ,
				pr_image =@i_image
		where  pr_promotion=@i_promotion 
	end

        if(@i_action='D1')
    begin
        delete t_promotion where  pr_promotion=@i_promotion 
    end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_recipe]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_recipe]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_recipe_ingredient]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_recipe_ingredient]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_recipe_order]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_recipe_order]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_user]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_user]
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
				(select in_factor from t_ingredient where in_ingredient = ro_key) as re_total_cost,
				(select co_name from t_ingredient , t_concept where co_concept = 2 and in_ingredient = ro_key and in_unit = co_correlative ) as UNIT,
				ro.ro_person
		from t_order o,t_recipe_order ro
		where o.or_user=1 and o.or_order=ro.ro_order and o.or_confirm = 0 and ro_type =0
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
GO
/****** Object:  StoredProcedure [dbo].[sp_user_recipe]    Script Date: 07/01/2018 16:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_user_recipe]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_user_recipe int =null,
@i_user int =null,
@i_recipe int = null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_user_recipe
    end
    
    if(@i_action='S2')
    begin
        select* from t_user_recipe where ur_recipe=@i_user_recipe
	end
    if(@i_action='I1')
    begin
        	insert into t_user_recipe
			(	
				ur_user,
				ur_recipe
			)
		values
			(
				
			
				@i_user,
				@i_recipe
			)
    end

        if(@i_action='U1')
   begin
		update t_user_recipe set 
			
				ur_user=@i_user,
				ur_recipe=@i_recipe
		where ur_recipe=@i_user_recipe
	end

        if(@i_action='D1')
    begin
        delete t_user_recipe where ur_recipe=@i_user_recipe
    end

end
GO
