CREATE TABLE [FROM_CONFIG](
   [TRANSPORT_ID]         varchar(10),
   [TRANSPORT_PASSWORD]   varchar(45),
   [PARTY_ID]             varchar(10) NOT NULL,
   [PARTY_DESCRIPTION]    varchar(200),
   [ROUTING_ID]           varchar(39),
   [ROUTING_DESCRIPTION]  varchar(200),
   [SIGN_ID]              varchar(4),
   [SUBSTITUTE_PARTY_ID]   varchar(10),
   CONSTRAINT [FROM_CONFIG_PK1] UNIQUE NONCLUSTERED (
    [PARTY_ID] ASC   
   ) ON [PRIMARY] 
)
CREATE  INDEX [FROM_CONFIG_INDEX1] ON [FROM_CONFIG]([SUBSTITUTE_PARTY_ID])

CREATE TABLE [TURNKEY_TRANSPORT_CONFIG](
  [TRANSPORT_ID] varchar(10) NOT NULL,
  [TRANSPORT_PASSWORD] varchar(60) NOT NULL,
  CONSTRAINT [TURNKEY_TRANSPORT_CONFIG_PK1] UNIQUE NONCLUSTERED (
  [TRANSPORT_ID] ASC   
 ) ON [PRIMARY] 
)

CREATE TABLE [TURNKEY_USER_PROFILE](
  [USER_ID] varchar(10) NOT NULL,
  [USER_PASSWORD] varchar(100) NOT NULL,
  [USER_ROLE] varchar(2),
  CONSTRAINT [TURNKEY_USER_PROFILE_PK1] UNIQUE NONCLUSTERED (
  [USER_ID]  ASC       
 ) ON [PRIMARY] 
)
INSERT INTO [TURNKEY_USER_PROFILE] ([USER_ID],[USER_PASSWORD],[USER_ROLE]) VALUES
 ('ADMIN','ADMIN','0');


CREATE TABLE [SCHEDULE_CONFIG](
   [TASK]                varchar(30) NOT NULL,
   [ENABLE]               varchar(1),
   [SCHEDULE_TYPE]        varchar(10),
   [SCHEDULE_WEEK]        varchar(15),
   [SCHEDULE_TIME]        varchar(50),
   [SCHEDULE_PERIOD]      varchar(10),
   [SCHEDULE_RANGE]       varchar(15),
   CONSTRAINT [SCHEDULE_CONFIG_PK1] UNIQUE NONCLUSTERED (
   [TASK]  ASC
   ) ON [PRIMARY]      
)


CREATE TABLE [SIGN_CONFIG](
  [SIGN_ID] varchar(4) NOT NULL,
  [SIGN_TYPE] varchar(10)  DEFAULT NULL,
  [PFX_PATH] varchar(100)  DEFAULT NULL,
  [SIGN_PASSWORD] varchar(60)  DEFAULT NULL,
  CONSTRAINT [SIGN_CONFIG_PK1] UNIQUE NONCLUSTERED (
   [SIGN_ID] ASC 
 ) ON [PRIMARY]    
)


CREATE TABLE [TASK_CONFIG](
   [CATEGORY_TYPE]        varchar(5) NOT NULL,
   [PROCESS_TYPE]         varchar(10) NOT NULL,
   [TASK]                 varchar(15) NOT NULL,
   [SRC_PATH]             varchar(200),
   [TARGET_PATH]          varchar(200),
   [FILE_FORMAT]          varchar(20),
   [VERSION]              varchar(5),
   [ENCODING]             varchar(15),
   [TRANS_CHINESE_DATE]   varchar(1),
   CONSTRAINT [TASK_CONFIG_PK1] UNIQUE NONCLUSTERED (
   [CATEGORY_TYPE], [PROCESS_TYPE], [TASK]  ASC  
 ) ON [PRIMARY]    
)


CREATE TABLE [TO_CONFIG](
   [PARTY_ID]             varchar(10) NOT NULL,
   [PARTY_DESCRIPTION]    varchar(200),
   [ROUTING_ID]           varchar(39),
   [ROUTING_DESCRIPTION]  varchar(200),
   [FROM_PARTY_ID]        varchar(10),
   CONSTRAINT [TO_CONFIG_PK1] UNIQUE NONCLUSTERED ([FROM_PARTY_ID], [PARTY_ID] ASC 
 ) ON [PRIMARY]    
)

CREATE TABLE [TURNKEY_MESSAGE_LOG](
  [SEQNO] varchar(8) NOT NULL,
  [SUBSEQNO] varchar(5) NOT NULL,
  [UUID] varchar(40) DEFAULT NULL,
  [MESSAGE_TYPE] varchar(10) DEFAULT NULL,
  [CATEGORY_TYPE] varchar(5) DEFAULT NULL,
  [PROCESS_TYPE] varchar(10) DEFAULT NULL,
  [FROM_PARTY_ID] varchar(10) DEFAULT NULL,
  [TO_PARTY_ID] varchar(10) DEFAULT NULL,
  [MESSAGE_DTS] varchar(17) DEFAULT NULL,
  [CHARACTER_COUNT] varchar(10) DEFAULT NULL,
  [STATUS] varchar(5) DEFAULT NULL,
  [IN_OUT_BOUND] varchar(1) DEFAULT NULL,
  [FROM_ROUTING_ID] varchar(39) DEFAULT NULL,
  [TO_ROUTING_ID] varchar(39) DEFAULT NULL,
  [INVOICE_IDENTIFIER] varchar(30) DEFAULT NULL,
  CONSTRAINT [TURNKEY_MESSAGE_LOG_PK1] UNIQUE NONCLUSTERED (
  [SEQNO], [SUBSEQNO]     ASC   
 ) ON [PRIMARY]   
)
CREATE  INDEX [TURNKEY_MESSAGE_LOG_INDEX1] ON [TURNKEY_MESSAGE_LOG]([MESSAGE_DTS])
CREATE  INDEX [TURNKEY_MESSAGE_LOG_INDEX2] ON [TURNKEY_MESSAGE_LOG]([UUID])


CREATE TABLE [TURNKEY_MESSAGE_LOG_DETAIL](
   [SEQNO]                varchar(8) NOT NULL,
   [SUBSEQNO]             varchar(5) NOT NULL,
   [PROCESS_DTS]          varchar(17),
   [TASK]                 varchar(30) NOT NULL,
   [STATUS]               varchar(5),
   [FILENAME]             varchar(300),
   [UUID]                 varchar(40),
   CONSTRAINT [TURNKEY_MESSAGE_LOG_DETAIL_PK1] UNIQUE NONCLUSTERED (
   [SEQNO], [SUBSEQNO], [TASK] ASC 
 ) ON [PRIMARY]     
)

CREATE  INDEX [TURNKEY_MESSAGE_LOG_DETAIL_INDEX1] ON [TURNKEY_MESSAGE_LOG_DETAIL]([FILENAME])

CREATE TABLE [TURNKEY_SEQUENCE](
   [SEQUENCE] varchar(8) NOT NULL,
   CONSTRAINT [TURNKEY_SEQUENCE_PK1] UNIQUE NONCLUSTERED (
   [SEQUENCE] ASC     
 ) ON [PRIMARY] 
)

CREATE TABLE [TURNKEY_SYSEVENT_LOG](
   [EVENTDTS]             varchar(17) NOT NULL,
   [PARTY_ID]             varchar(10),
   [SEQNO]                varchar(8),
   [SUBSEQNO]             varchar(5),
   [ERRORCODE]            varchar(4),
   [UUID]                 varchar(40),
   [INFORMATION1]         varchar(100),
   [INFORMATION2]         varchar(100),
   [INFORMATION3]         varchar(100),
   [MESSAGE1]             varchar(100),
   [MESSAGE2]             varchar(100),
   [MESSAGE3]             varchar(100),
   [MESSAGE4]             varchar(100),
   [MESSAGE5]             varchar(100),
   [MESSAGE6]             varchar(100),
   CONSTRAINT [TURNKEY_SYSEVENT_LOG_PK1] UNIQUE NONCLUSTERED (
   [EVENTDTS] ASC
   ) ON [PRIMARY]      
)

CREATE  INDEX [TURNKEY_SYSEVENT_LOG_INDEX1] ON [TURNKEY_SYSEVENT_LOG]([SEQNO],[SUBSEQNO])
CREATE  INDEX [TURNKEY_SYSEVENT_LOG_INDEX2] ON [TURNKEY_SYSEVENT_LOG]([UUID])

  
GO