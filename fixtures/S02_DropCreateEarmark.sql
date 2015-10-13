USE [Sunlight]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'house_amount'

GO

EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'budget_amount'

GO

EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'fiscal_year'

GO

EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'id'

GO

/****** Object:  Table [dbo].[earmark]    Script Date: 10/12/2015 2:51:56 PM ******/
DROP TABLE [dbo].[earmark]
GO

/****** Object:  Table [dbo].[earmark]    Script Date: 10/12/2015 2:51:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[earmark](
	[id] [int] NOT NULL,
	[import_reference_id] [int] NOT NULL,
	[fiscal_year] [int] NOT NULL,
	[budget_amount] [money] NOT NULL CONSTRAINT [DF_earmark_budget_amount]  DEFAULT ((0)),
	[house_amount] [money] NOT NULL CONSTRAINT [DF_earmark_house_amount]  DEFAULT ((0)),
	[senate_amount] [money] NOT NULL CONSTRAINT [DF_earmark_senate_amount]  DEFAULT ((0)),
	[omni_amount] [money] NOT NULL,
	[final_amount] [money] NOT NULL CONSTRAINT [DF_earmark_final_amount]  DEFAULT ((0)),
	[bill] [nchar](100) NOT NULL,
	[bill_section] [nvarchar](100) NOT NULL,
	[bill_subsection] [nvarchar](255) NULL,
	[description] [nvarchar](4000) NULL,
	[notes] [nvarchar](4000) NULL,
	[presidential] [nchar](1) NULL,
	[undisclosed] [nchar](1) NULL,
	[house_members] [nvarchar](4000) NULL,
	[house_parties] [nvarchar](4000) NULL,
	[house_states] [nvarchar](2000) NULL,
	[house_districts] [nvarchar](100) NULL,
	[senate_members] [nvarchar](4000) NULL,
	[senate_parties] [nvarchar](4000) NULL,
	[senate_states] [nvarchar](2000) NULL,
 CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'identifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for the bill in which the earmark appears.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'fiscal_year'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earmark amount in the President''s budget proposal.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'budget_amount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earmark amount in the version of the bill passed by the House.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'earmark', @level2type=N'COLUMN',@level2name=N'house_amount'
GO

