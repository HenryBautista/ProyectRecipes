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
/****** Object:  StoredProcedure [dbo].[sp_concept]    Script Date: 19/10/2017 19:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_concept]
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
	if(@i_action = 'S2')
	begin 	
		select *
		from t_concept
	end
	if(@i_action = 'F1')
	begin 	
		select *
		from t_concept
		where co_name = @i_name
	end
	if(@i_action = 'I1')
	begin		
		INSERT INTO t_concept(co_concept, co_correlative,co_name,co_abbreviation)
		VALUES(@i_concept,@i_correlative,@i_name,@i_abbreviation)
	end
	if(@i_action = 'U1')
	begin
		update t_concept set 

				co_name=@i_name,
				co_abbreviation=@i_abbreviation

		where co_correlative=@i_correlative and co_concept=@i_concept
	end
	if(@i_action='D1')
    begin
        delete t_concept where co_concept = @i_concept and co_correlative = @i_correlative
    end
end
