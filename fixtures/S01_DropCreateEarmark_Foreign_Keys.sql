/* Drop Foreign Key Constraints */
ALTER TABLE [dbo].[earmark_location] DROP CONSTRAINT [FK_earmark_id_loc]
GO

ALTER TABLE [dbo].[earmark_member] DROP CONSTRAINT [FK_earmark_id_mem]
GO

ALTER TABLE [dbo].[earmark_recipient] DROP CONSTRAINT [FK_earmark_id_rec]
GO

