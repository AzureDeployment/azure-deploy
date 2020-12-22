CREATE PROC [Loader].[up_GetLastWatermark] 
	@TableSchema [VARCHAR](500),
	@TableName [VARCHAR](500),
	@SourceSystem [VARCHAR](500) 
AS
SET @TableSchema = ISNULL(@TableSchema, '')

DECLARE @LastExtractedDateTime DATETIME = '1/1/1900'

IF EXISTS (
        SELECT 1 
        FROM Loader.TableManifest tm WITH (NOLOCK)
        INNER JOIN Loader.SourceSystem ss WITH (NOLOCK)
            ON tm.SourceSystemId = ss.SourceSystemId
        WHERE tm.TableName = @TableName
			AND tm.TableSchema = @TableSchema
            AND ss.SourceSystem = @SourceSystem
			AND tm.LastExtractedDateTime IS NOT NULL
    )
BEGIN
	SET @LastExtractedDateTime = (
			SELECT DATEADD(hh, -2, MAX(LastExtractedDateTime)) AS LastExtractedDate
			FROM Loader.TableManifest tm WITH (NOLOCK)
			INNER JOIN Loader.SourceSystem ss WITH (NOLOCK)
				ON tm.SourceSystemId = ss.SourceSystemId
			WHERE tm.TableName = @TableName
				AND tm.TableSchema = @TableSchema
				AND ss.SourceSystem = @SourceSystem
		)
END

SELECT @LastExtractedDateTime AS LastExtractedDate