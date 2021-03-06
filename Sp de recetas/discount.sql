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
/****** Object:  StoredProcedure [dbo].[sp_discount]    Script Date: 18/10/2017 0:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_discount]
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
