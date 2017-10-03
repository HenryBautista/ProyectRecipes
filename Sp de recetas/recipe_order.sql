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
/****** Object:  StoredProcedure [dbo].[sp_recipe_order]    Script Date: 02/10/2017 18:09:37 ******/
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
@i_ok bit
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_recipe_order
    end
    
    if(@i_action='S2')
    begin
        select* from t_recipe_order where ro_key=@i_recipe_order
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
				@i_price,
				@i_person,
				@i_ok
			)
    end

        if(@i_action='U1')
   begin
		update t_recipe_order set 
			
				ro_order=@i_order,
				ro_key=@i_key,
				ro_type = @i_type,
				ro_quantity=@i_quantity,
				ro_price=@i_price,
				ro_person=@i_person,
				ro_ok = @i_ok
		where ro_recipe_order=@i_recipe_order
	end

        if(@i_action='D1')
    begin
        delete t_recipe_order where ro_recipe_order=@i_recipe_order
    end

end
