CREATE PROC [Loader].[up_UpdateLastWatermark]
    @LastUpdatedDate [DATETIME],
    @TableSchema [VARCHAR](50),
    @TableName [VARCHAR](100),
    @Incremental [VARCHAR](50),
    @SourceSystem [VARCHAR](500) 
AS
    SET @LastUpdatedDate = (SELECT ISNULL(@LastUpdatedDate, GETUTCDATE()))
    
    EXECUTE Loader.up_UpdateSourceSystem @SourceSystem

    DECLARE @SourceSystemId INT
    SET @SourceSystemId = (SELECT SourceSystemId FROM Loader.SourceSystem WHERE SourceSystem = @SourceSystem)

	SET @TableSchema = (SELECT CASE WHEN @TableSchema = 'null' THEN NULL ELSE @TableSchema END)

    IF NOT EXISTS (
            SELECT 1 
            FROM Loader.TableManifest tm WITH (NOLOCK)
            INNER JOIN Loader.SourceSystem ss WITH (NOLOCK)
                ON tm.SourceSystemId = ss.SourceSystemId
            WHERE tm.TableName = @TableName
                AND tm.TableSchema = @TableSchema
                AND ss.SourceSystemId = @SourceSystemId
        )
    BEGIN
            INSERT INTO Loader.TableManifest (
                SourceSystemId,
				TableSchema,
                TableName,
                LastExtractedDateTime,
                Incremental,
                CreatedDateTime,
                LastUpdatedDateTime
            )    
            SELECT 
                @SourceSystemId AS SourceSystemId,
                @TableSchema AS TableSchema, 
                @TableName AS TableName, 
                @LastUpdatedDate AS LastExtractedDate,
                @Incremental AS Incremental,
                GETUTCDATE() AS CreatedDate,
                GETUTCDATE() AS LastUpdatedDate
    END
    ELSE
    BEGIN
            UPDATE myTarget
            SET LastExtractedDateTime = @LastUpdatedDate, Incremental = @Incremental, LastUpdatedDateTime = GETUTCDATE()
            FROM Loader.TableManifest myTarget
            WHERE SourceSystemId = @SourceSystemId
                AND TableName = @TableName
                AND TableSchema = @TableSchema
    END