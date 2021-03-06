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
/****** Object:  StoredProcedure [dbo].[sp_user_recipe]    Script Date: 18/10/2017 0:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[sp_user_recipe]
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
