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
/****** Object:  StoredProcedure [dbo].[sp_person]    Script Date: 18/10/2017 0:55:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_person]
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
