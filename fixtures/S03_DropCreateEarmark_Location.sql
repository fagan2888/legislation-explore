USE [Sunlight]
GO

/****** Object:  Table [dbo].[earmark_location]    Script Date: 10/12/2015 2:52:30 PM ******/
DROP TABLE [dbo].[earmark_location]
GO

/****** Object:  Table [dbo].[earmark_location]    Script Date: 10/12/2015 2:52:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[earmark_location](
	[id] [int] NOT NULL,
	[earmark_id] [int] NOT NULL,
	[city] [nvarchar](4000) NULL,
	[state] [nchar](2) NULL,
 CONSTRAINT [PK_id_earmark_loc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[earmark_location]  WITH CHECK ADD  CONSTRAINT [FK_earmark_id_loc] FOREIGN KEY([earmark_id])
REFERENCES [dbo].[earmark] ([id])
GO

ALTER TABLE [dbo].[earmark_location] CHECK CONSTRAINT [FK_earmark_id_loc]
GO

