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
/****** Object:  StoredProcedure [dbo].[sp_nutrient]    Script Date: 18/10/2017 0:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_nutrient]
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

