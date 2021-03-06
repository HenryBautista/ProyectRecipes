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
/****** Object:  Table [dbo].[t_comentary]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_comentary](
	[co_comentary] [int] IDENTITY(1,1) NOT NULL,
	[co_recipe] [int] NULL,
	[co_user] [int] NULL,
	[co_text] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[co_comentary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_concept]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_concept](
	[co_concept] [int] NULL,
	[co_correlative] [int] NULL,
	[co_name] [varchar](50) NULL,
	[co_abbreviation] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_consultas]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_consultas](
	[co_consultas] [int] IDENTITY(1,1) NOT NULL,
	[co_date] [date] NULL,
	[co_name] [varchar](50) NULL,
	[co_consulta] [varchar](max) NULL,
	[co_is] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[co_consultas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_discount]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_discount](
	[di_discount] [int] IDENTITY(1,1) NOT NULL,
	[di_recipe] [int] NULL,
	[di_state] [bit] NULL,
	[di_type] [bit] NULL,
	[di_discount_quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[di_discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_ingredient]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_ingredient](
	[in_ingredient] [int] IDENTITY(1,1) NOT NULL,
	[in_ingredient_id] [varchar](20) NULL,
	[in_name] [varchar](50) NULL,
	[in_unit] [int] NULL,
	[in_quantity] [float] NULL,
	[in_image] [varchar](200) NULL,
	[in_cost] [float] NULL,
	[in_factor] [float] NULL,
	[in_category] [int] NULL,
	[in_origin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[in_ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_ingredient_nutrient]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_ingredient_nutrient](
	[in_ingredient_nutrient] [int] IDENTITY(1,1) NOT NULL,
	[in_nutrient] [int] NULL,
	[in_ingredient] [int] NULL,
	[in_quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[in_ingredient_nutrient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_nutrient]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_nutrient](
	[nu_nutrient] [int] IDENTITY(1,1) NOT NULL,
	[nu_name] [varchar](50) NULL,
	[nu_quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[nu_nutrient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_order]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_order](
	[or_order] [int] IDENTITY(1,1) NOT NULL,
	[or_order_date] [date] NULL,
	[or_user] [int] NULL,
	[or_total_quantity] [int] NULL,
	[or_total_price] [float] NULL,
	[or_confirm] [bit] NULL,
	[or_ok] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[or_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_person]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_person](
	[pe_person] [int] IDENTITY(1,1) NOT NULL,
	[pe_name] [varchar](50) NULL,
	[pe_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pe_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_promotion]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_promotion](
	[pr_promotion] [int] IDENTITY(1,1) NOT NULL,
	[pr_name] [varchar](50) NULL,
	[pr_title] [varchar](50) NULL,
	[pr_text] [varchar](max) NULL,
	[pr_image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[pr_promotion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_recipe]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_recipe](
	[re_recipe] [int] IDENTITY(1,1) NOT NULL,
	[re_recipe_id] [varchar](20) NULL,
	[re_name] [varchar](50) NULL,
	[re_turn] [int] NULL,
	[re_image] [varchar](200) NULL,
	[re_url_video] [varchar](200) NULL,
	[re_total_cost] [float] NULL,
	[re_observation] [varchar](max) NULL,
	[re_of_user] [bit] NULL,
	[re_unit] [int] NULL,
	[re_quantity] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[re_recipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_recipe_ingredient]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_recipe_ingredient](
	[ri_recipe_ingredient] [int] IDENTITY(1,1) NOT NULL,
	[ri_recipe] [int] NULL,
	[ri_ingredient] [int] NULL,
	[ri_quantity] [float] NULL,
	[ri_observation] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ri_recipe_ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_recipe_order]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_recipe_order](
	[ro_recipe_order] [int] IDENTITY(1,1) NOT NULL,
	[ro_order] [int] NULL,
	[ro_key] [int] NULL,
	[ro_type] [bit] NULL,
	[ro_quantity] [int] NULL,
	[ro_price] [float] NULL,
	[ro_person] [int] NULL,
	[ro_ok] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ro_recipe_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[us_user] [int] IDENTITY(1,1) NOT NULL,
	[us_name] [varchar](50) NULL,
	[us_last_name] [varchar](50) NULL,
	[us_mother_last_name] [varchar](50) NULL,
	[us_mail] [varchar](50) NULL,
	[us_phone] [varchar](20) NULL,
	[us_address] [varchar](300) NULL,
	[us_master] [bit] NULL,
	[us_password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[us_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user_recipe]    Script Date: 07/01/2018 16:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user_recipe](
	[ur_user_recipe] [int] IDENTITY(1,1) NOT NULL,
	[ur_user] [int] NULL,
	[ur_recipe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ur_user_recipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_comentary]  WITH CHECK ADD FOREIGN KEY([co_recipe])
REFERENCES [dbo].[t_recipe] ([re_recipe])
GO
ALTER TABLE [dbo].[t_comentary]  WITH CHECK ADD FOREIGN KEY([co_user])
REFERENCES [dbo].[t_user] ([us_user])
GO
ALTER TABLE [dbo].[t_discount]  WITH CHECK ADD FOREIGN KEY([di_recipe])
REFERENCES [dbo].[t_recipe] ([re_recipe])
GO
ALTER TABLE [dbo].[t_ingredient_nutrient]  WITH CHECK ADD FOREIGN KEY([in_ingredient])
REFERENCES [dbo].[t_ingredient] ([in_ingredient])
GO
ALTER TABLE [dbo].[t_ingredient_nutrient]  WITH CHECK ADD FOREIGN KEY([in_nutrient])
REFERENCES [dbo].[t_nutrient] ([nu_nutrient])
GO
ALTER TABLE [dbo].[t_order]  WITH CHECK ADD FOREIGN KEY([or_user])
REFERENCES [dbo].[t_user] ([us_user])
GO
ALTER TABLE [dbo].[t_person]  WITH CHECK ADD FOREIGN KEY([pe_user])
REFERENCES [dbo].[t_user] ([us_user])
GO
ALTER TABLE [dbo].[t_recipe_ingredient]  WITH CHECK ADD FOREIGN KEY([ri_ingredient])
REFERENCES [dbo].[t_ingredient] ([in_ingredient])
GO
ALTER TABLE [dbo].[t_recipe_ingredient]  WITH CHECK ADD FOREIGN KEY([ri_recipe])
REFERENCES [dbo].[t_recipe] ([re_recipe])
GO
ALTER TABLE [dbo].[t_recipe_order]  WITH CHECK ADD FOREIGN KEY([ro_order])
REFERENCES [dbo].[t_order] ([or_order])
GO
ALTER TABLE [dbo].[t_recipe_order]  WITH CHECK ADD FOREIGN KEY([ro_person])
REFERENCES [dbo].[t_person] ([pe_person])
GO
ALTER TABLE [dbo].[t_user_recipe]  WITH CHECK ADD FOREIGN KEY([ur_recipe])
REFERENCES [dbo].[t_recipe] ([re_recipe])
GO
ALTER TABLE [dbo].[t_user_recipe]  WITH CHECK ADD FOREIGN KEY([ur_user])
REFERENCES [dbo].[t_user] ([us_user])
GO
