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
/****** Object:  StoredProcedure [dbo].[sp_comentary]    Script Date: 18/10/2017 0:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_comentary]
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