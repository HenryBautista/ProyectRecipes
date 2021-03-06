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
/****** Object:  StoredProcedure [dbo].[sp_consult]    Script Date: 18/10/2017 0:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_consult]
(
@i_action varchar(2) =null,
------------ valores de la tabla
@i_consult int =null,
@i_name varchar (50)=null,
@i_email varchar(50) =null,
@i_text varchar(max) = null,
@i_is bit =null
-----------
)
as
begin
    if(@i_action='S1')
    begin
        select* from t_consult
    end
    
    if(@i_action='S2')
    begin
        select* from t_consult where co_consult=@i_consult
	end
	if(@i_action='S3')
    begin
        select* from t_consult where co_is = 'false'
	end
    if(@i_action='I1')
    begin
        	insert into t_consult
			(	
				co_date,
				co_email, 
				co_name,
				co_text,
				co_is
			)
		values
			(
				GETDATE(),
				@i_email,
				@i_name,
				@i_text,
				'false'
			)
    end

        if(@i_action='U1')
   begin
		update t_consult set 			
				co_is = 'true'
		where co_consult=@i_consult
	end
        if(@i_action='D1')
    begin
        delete t_consult where co_consult=@i_consult
    end

end