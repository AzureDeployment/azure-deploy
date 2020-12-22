CREATE TABLE [Loader].[TableManifest] (
    [TableId]               INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemId]        INT           NULL,
    [TableSchema]           VARCHAR (50)  NULL,
    [TableName]             VARCHAR (100) NULL,
    [Incremental]           BIT           CONSTRAINT [DF_TableManifest__Incremental] DEFAULT ((0)) NOT NULL,
    [LastExtractedDateTime] DATETIME      NULL,
    CreatedDateTime DATETIME NULL,
    LastUpdatedDateTime DATETIME NULL
);

GO
CREATE NONCLUSTERED INDEX [NCLI_Loader_TableManifest__SourceSystemId]
    ON [Loader].[TableManifest]([SourceSystemId] ASC);

