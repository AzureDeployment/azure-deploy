CREATE TABLE [Loader].[SourceSystem] (
    [SourceSystemId]  INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystem]    VARCHAR (50) NULL,
    [CreatedDateTime] DATETIME     NULL,
    [UpdatedDateTime] DATETIME     NULL,
    CONSTRAINT [PK_SourceSystem__SourceSystemId] PRIMARY KEY NONCLUSTERED ([SourceSystemId] ASC)
);