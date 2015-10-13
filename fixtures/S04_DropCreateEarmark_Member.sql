USE [Sunlight]
GO

/****** Object:  Table [dbo].[earmark_member]    Script Date: 10/12/2015 2:52:55 PM ******/
DROP TABLE [dbo].[earmark_member]
GO

/****** Object:  Table [dbo].[earmark_member]    Script Date: 10/12/2015 2:52:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[earmark_member](
	[id] [int] NOT NULL,
	[earmark_id] [int] NOT NULL,
	[raw_name] [nvarchar](4000) NOT NULL,
	[crp_id] [nvarchar](100) NULL,
	[standardized_name] [nvarchar](4000) NULL,
	[chamber] [nchar](1) NULL,
	[party] [nchar](1) NULL,
	[state] [nchar](2) NULL,
	[district] [nchar](2) NULL,
 CONSTRAINT [PK_id_earmark_mem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[earmark_member]  WITH CHECK ADD  CONSTRAINT [FK_earmark_id_mem] FOREIGN KEY([earmark_id])
REFERENCES [dbo].[earmark] ([id])
GO

ALTER TABLE [dbo].[earmark_member] CHECK CONSTRAINT [FK_earmark_id_mem]
GO

