CREATE PROC [Loader].[up_GetNewWatermark]
AS

SELECT GETUTCDATE() AS NewExtractDate