USE [Sunlight]
GO

/****** Object:  Table [dbo].[earmark_recipient]    Script Date: 10/12/2015 2:53:26 PM ******/
DROP TABLE [dbo].[earmark_recipient]
GO

/****** Object:  Table [dbo].[earmark_recipient]    Script Date: 10/12/2015 2:53:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[earmark_recipient](
	[id] [int] NOT NULL,
	[earmark_id] [int] NOT NULL,
	[raw_recipient] [nvarchar](4000) NOT NULL,
	[standardized_recipient] [nvarchar](4000) NULL,
 CONSTRAINT [PK_id_earmark_rec] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[earmark_recipient]  WITH CHECK ADD  CONSTRAINT [FK_earmark_id_rec] FOREIGN KEY([earmark_id])
REFERENCES [dbo].[earmark] ([id])
GO

ALTER TABLE [dbo].[earmark_recipient] CHECK CONSTRAINT [FK_earmark_id_rec]
GO

