CREATE PROC [Loader].[up_UpdateSourceSystem] 
    @SourceSystem [VARCHAR](500)
AS
SET NOCOUNT ON

DECLARE @CreatedDateTime DATETIME = GETUTCDATE()

IF NOT EXISTS (
        SELECT 1
        FROM Loader.SourceSystem WITH (NOLOCK)
        WHERE SourceSystem = @SourceSystem
)
INSERT INTO Loader.SourceSystem (SourceSystem, CreatedDateTime)
VALUES (@SourceSystem, @CreatedDateTime)