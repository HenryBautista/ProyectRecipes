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
/****** Object:  StoredProcedure [dbo].[sp_promotion]    Script Date: 18/10/2017 0:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_promotion]
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
