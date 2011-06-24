---- Table structure for table `mf_conference` 
----

CREATE TABLE [mf_conference] ([conferenceID] NVARCHAR(35) NOT NULL  ,[siteID] VARCHAR(25) NOT NULL  ,[configurationID] NVARCHAR(35) NULL  ,[name] VARCHAR(150) NOT NULL  ,[title] VARCHAR(150) NOT NULL  ,[description] NTEXT NULL  ,[isActive] SMALLINT NOT NULL  ,[friendlyName] VARCHAR(200) NOT NULL  ,[orderNo] BIGINT NOT NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[idx] BIGINT IDENTITY(1,1) ,CONSTRAINT [mf_conference_mf_conference_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([conferenceID])); 
 CREATE  NONCLUSTERED  INDEX [mf_conference_mf_conference_idxFriendlyName] ON [mf_conference] ([friendlyName]);
 CREATE  NONCLUSTERED  INDEX [mf_conference_mf_conference_idxIdx] ON [mf_conference] ([idx]);
 CREATE  NONCLUSTERED  INDEX [mf_conference_mf_conference_idxRemoteID] ON [mf_conference] ([remoteID]);

---- Table structure for table `mf_configuration` 
----

CREATE TABLE [mf_configuration] ([configurationID] NVARCHAR(35) NOT NULL  ,[siteID] VARCHAR(25) NOT NULL  ,[name] VARCHAR(100) NOT NULL  ,[description] VARCHAR(255) NULL  ,[isActive] SMALLINT NOT NULL  DEFAULT 0 ,[restrictReadGroups] VARCHAR(255) NULL  ,[restrictContributeGroups] VARCHAR(255) NULL  ,[restrictModerateGroups] VARCHAR(255) NULL  DEFAULT N'RestrictAll' ,[doRequireConfirmation] SMALLINT NULL  DEFAULT 0 ,[doAvatars] SMALLINT NULL  DEFAULT 0 ,[doClosed] SMALLINT NULL  DEFAULT 0 ,[allowAttachmentExtensions] NTEXT NULL  ,[doAttachments] SMALLINT NOT NULL  DEFAULT 0 ,[isMaster] SMALLINT NULL  DEFAULT 0 ,[filesizeLimit] BIGINT NOT NULL  DEFAULT 0 ,[characterLimit] BIGINT NOT NULL  DEFAULT 0 ,[doInlineImageAttachments] SMALLINT NOT NULL  DEFAULT 0 ,[imageWidthLimit] BIGINT NOT NULL  DEFAULT 0 ,[imageHeightLimit] BIGINT NOT NULL  DEFAULT 0 ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_configuration_mf_configuration_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([configurationID])); 
 CREATE  NONCLUSTERED  INDEX [mf_configuration_mf_configuration_idxContrib] ON [mf_configuration] ([restrictContributeGroups]);
 CREATE  NONCLUSTERED  INDEX [mf_configuration_mf_configuration_idxMod] ON [mf_configuration] ([restrictModerateGroups]);
 CREATE  NONCLUSTERED  INDEX [mf_configuration_mf_configuration_idxRead] ON [mf_configuration] ([restrictReadGroups]);
 CREATE  NONCLUSTERED  INDEX [mf_configuration_mf_configuration_remoteID] ON [mf_configuration] ([remoteID]);

---- Table structure for table `mf_display` 
----

CREATE TABLE [mf_display] ([displayID] NVARCHAR(35) NOT NULL  ,[displayTypeID] NVARCHAR(35) NOT NULL  ,[objectID] NVARCHAR(35) NULL  ,[name] VARCHAR(150) NOT NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[siteID] VARCHAR(25) NOT NULL  ,[params] NTEXT NULL  ,[notes] NTEXT NULL  ,[isActive] SMALLINT NULL  DEFAULT 0 ,[adminID] NVARCHAR(35) NULL  ,[moduleID] NVARCHAR(35) NULL  ,[contentID] NVARCHAR(35) NULL  ,[isValid] SMALLINT NULL  DEFAULT 0 ,[settings] NTEXT NULL  ,CONSTRAINT [mf_display_mf_display_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([displayID])); 

---- Table structure for table `mf_displaytype` 
----

CREATE TABLE [mf_displaytype] ([displaytypeid] NVARCHAR(35) NOT NULL  ,[objectID] NVARCHAR(35) NULL  ,[package] VARCHAR(45) NOT NULL  ,[name] VARCHAR(45) NOT NULL  ,[description] NTEXT NULL  ,[settings] NTEXT NULL  ,[isConfigurable] SMALLINT NOT NULL  DEFAULT 0 ,[isActive] SMALLINT NOT NULL  DEFAULT 1 ,[version] VARCHAR(12) NOT NULL  ,[defaults] NTEXT NULL  ,[moduleID] NVARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_displaytype_mf_displaytype_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([displaytypeid])); 

---- Table structure for table `mf_forum` 
----

CREATE TABLE [mf_forum] ([forumID] NVARCHAR(35) NOT NULL  ,[conferenceID] NVARCHAR(35) NOT NULL  ,[configurationID] NVARCHAR(35) NULL  ,[siteID] VARCHAR(25) NOT NULL  ,[name] VARCHAR(150) NOT NULL  ,[title] VARCHAR(150) NOT NULL  ,[description] NTEXT NULL  ,[friendlyName] VARCHAR(200) NULL  ,[isActive] SMALLINT NOT NULL  DEFAULT 1 ,[adminID] NVARCHAR(35) NULL  ,[orderNo] BIGINT NOT NULL  DEFAULT 1000 ,[threadCounter] BIGINT NOT NULL  DEFAULT 0 ,[lastPostID] NVARCHAR(35) NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[idx] BIGINT IDENTITY(1,1) ,[parentID] NVARCHAR(35) NULL  ,CONSTRAINT [mf_forum_mf_forum_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([forumID])); 
 CREATE  NONCLUSTERED  INDEX [mf_forum_mf_forum_idxConferenceID] ON [mf_forum] ([conferenceID]);
 CREATE  NONCLUSTERED  INDEX [mf_forum_mf_forum_idxIdx] ON [mf_forum] ([idx]);
 CREATE  NONCLUSTERED  INDEX [mf_forum_mf_forum_idxRemoteID] ON [mf_forum] ([remoteID]);
 CREATE  NONCLUSTERED  INDEX [mf_forum_mf_forum_idxSiteID] ON [mf_forum] ([siteID]);

---- Table structure for table `mf_post` 
----

CREATE TABLE [mf_post] ([postID] NVARCHAR(35) NOT NULL  ,[threadID] NVARCHAR(35) NOT NULL  ,[userID] NVARCHAR(35) NOT NULL  ,[adminID] NVARCHAR(35) NULL  ,[message] NTEXT NOT NULL  ,[isActive] SMALLINT NULL  DEFAULT 0 ,[isDisabled] SMALLINT NOT NULL  DEFAULT 0 ,[isApproved] SMALLINT NOT NULL  DEFAULT 0 ,[isUserDisabled] SMALLINT NOT NULL  DEFAULT 0 ,[isModerated] SMALLINT NULL  DEFAULT 0 ,[dateModerated] DATETIME NULL  ,[doBlockAttachment] SMALLINT NULL  DEFAULT 0 ,[attachmentID] NVARCHAR(35) NULL  ,[postPosition] BIGINT NOT NULL  DEFAULT 0 ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[idx] BIGINT IDENTITY(1,1) ,[parentID] NVARCHAR(35) NULL  ,CONSTRAINT [mf_post_mf_post_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([postID])); 
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxDateCreate] ON [mf_post] ([dateCreate]);
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxIdx] ON [mf_post] ([idx]);
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxPostIdent] ON [mf_post] ([postPosition]);
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxRemoteID] ON [mf_post] ([remoteID]);
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxThread] ON [mf_post] ([threadID]);
 CREATE  NONCLUSTERED  INDEX [mf_post_mf_post_idxUserID] ON [mf_post] ([userID]);

---- Table structure for table `mf_searchable` 
----

CREATE TABLE [mf_searchable] ([threadID] NVARCHAR(35) NOT NULL  ,[postID] NVARCHAR(35) NOT NULL  ,[searchblock] NTEXT NOT NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_searchable_mf_searchable_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([postID])); 
 CREATE  NONCLUSTERED  INDEX [mf_searchable_mf_searchable_idx_dateLastUpdate] ON [mf_searchable] ([dateLastUpdate]);
 CREATE  NONCLUSTERED  INDEX [mf_searchable_mf_searchable_idx_thread] ON [mf_searchable] ([threadID],[postID]);

---- Table structure for table `mf_settings` 
----

CREATE TABLE [mf_settings] ([settingsID] NVARCHAR(35) NOT NULL  ,[siteID] VARCHAR(25) NOT NULL  ,[isMaster] SMALLINT NULL  DEFAULT 0 ,[permissionGroups] VARCHAR(255) NULL  DEFAULT N'RestrictAll' ,[themeID] NVARCHAR(35) NULL  ,[threadsPerPage] BIGINT NOT NULL  DEFAULT 20 ,[postsPerPage] BIGINT NOT NULL  DEFAULT 20 ,[subscriptionLimit] BIGINT NULL  DEFAULT 100 ,[allowedExtensions] VARCHAR(255) NULL  ,[deniedExtensions] VARCHAR(255) NULL  ,[filesizeLimit] BIGINT NULL  DEFAULT 100 ,[avatarID] NVARCHAR(35) NULL  ,[avatarResizeType] VARCHAR(45) NOT NULL  DEFAULT N'CropResize' ,[avatarQualityType] VARCHAR(45) NOT NULL  DEFAULT N'highQuality' ,[avatarAspectType] VARCHAR(45) NOT NULL  DEFAULT N'MaxAspectXY' ,[avatarCropType] VARCHAR(45) NOT NULL  DEFAULT N'BestXY' ,[userCacheSize] BIGINT NOT NULL  DEFAULT 250 ,[resetAvatar] SMALLINT NOT NULL  DEFAULT 0 ,[doInit] SMALLINT NOT NULL  DEFAULT 0 ,[activeWithinMinutes] BIGINT NOT NULL  DEFAULT 15 ,[searchMode] VARCHAR(45) NOT NULL  DEFAULT N'SIMPLE' ,[tempDir] NVARCHAR(35) NOT NULL  ,[baseTempDir] VARCHAR(150) NULL  ,[URLKey] VARCHAR(10) NOT NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_settings_mf_settings_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([siteID])); 
 CREATE  NONCLUSTERED  INDEX [mf_settings_mf_settings_siteID] ON [mf_settings] ([siteID]);

---- Table structure for table `mf_subscribe` 
----

CREATE TABLE [mf_subscribe] ([subscribeID] NVARCHAR(35) NOT NULL  ,[conferenceID] NVARCHAR(35) NULL  ,[forumID] NVARCHAR(35) NULL  ,[threadID] NVARCHAR(35) NULL  ,[userID] NVARCHAR(35) NOT NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[isEmail] SMALLINT NOT NULL  DEFAULT 0 ,CONSTRAINT [mf_subscribe_mf_subscribe_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([subscribeID])); 
 CREATE  NONCLUSTERED  INDEX [mf_subscribe_mf_subscribe_idxConf] ON [mf_subscribe] ([conferenceID]);
 CREATE  NONCLUSTERED  INDEX [mf_subscribe_mf_subscribe_idxForum] ON [mf_subscribe] ([forumID]);
 CREATE  NONCLUSTERED  INDEX [mf_subscribe_mf_subscribe_idxThread] ON [mf_subscribe] ([threadID]);
 CREATE  NONCLUSTERED  INDEX [mf_subscribe_mf_subscribe_idxUser] ON [mf_subscribe] ([userID]);

---- Table structure for table `mf_theme` 
----

CREATE TABLE [mf_theme] ([themeID] NVARCHAR(35) NOT NULL  ,[name] VARCHAR(35) NOT NULL  ,[packageName] VARCHAR(25) NOT NULL  ,[avatarSmallWidth] BIGINT NOT NULL  DEFAULT 125 ,[avatarSmallHeight] BIGINT NOT NULL  DEFAULT 125 ,[avatarMediumWidth] BIGINT NOT NULL  DEFAULT 250 ,[avatarMediumHeight] BIGINT NOT NULL  DEFAULT 250 ,[avatarDimensionType] VARCHAR(25) NOT NULL  DEFAULT N'square' ,[settings] NTEXT NULL  ,[defaultAvatar] VARCHAR(80) NULL  ,[isMaster] SMALLINT NOT NULL  DEFAULT 0 ,[style] VARCHAR(12) NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_theme_mf_theme_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([themeID])); 

---- Table structure for table `mf_thread` 
----

CREATE TABLE [mf_thread] ([threadID] NVARCHAR(35) NOT NULL  ,[forumID] NVARCHAR(35) NOT NULL  ,[typeID] BIGINT NOT NULL  DEFAULT 0 ,[siteID] VARCHAR(25) NOT NULL  ,[isActive] SMALLINT NOT NULL  DEFAULT 0 ,[isClosed] SMALLINT NOT NULL  DEFAULT 0 ,[isDisabled] SMALLINT NULL  DEFAULT 0 ,[isUserDisabled] SMALLINT NOT NULL  DEFAULT 0 ,[isDraft] SMALLINT NOT NULL  DEFAULT 0 ,[userID] NVARCHAR(35) NOT NULL  ,[adminID] NVARCHAR(35) NULL  ,[adminMessage] NTEXT NULL  ,[title] VARCHAR(150) NOT NULL  ,[friendlyName] VARCHAR(200) NULL  ,[orderNo] BIGINT NOT NULL  DEFAULT 0 ,[postCounter] BIGINT NOT NULL  DEFAULT 0 ,[lastPostID] NVARCHAR(35) NULL  ,[dateLastPost] DATETIME NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,[idx] BIGINT IDENTITY(1,1) ,[isAnnouncement] SMALLINT NOT NULL  DEFAULT 0 ,CONSTRAINT [mf_thread_mf_thread_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([threadID])); 
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxAdminID] ON [mf_thread] ([adminID]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxDateLastPost] ON [mf_thread] ([dateLastPost]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxForumID] ON [mf_thread] ([forumID]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxIdx] ON [mf_thread] ([idx]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxRemoteID] ON [mf_thread] ([remoteID]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxSiteID] ON [mf_thread] ([siteID]);
 CREATE  NONCLUSTERED  INDEX [mf_thread_mf_thread_idxUserID] ON [mf_thread] ([userID]);

---- Table structure for table `mf_user` 
----

CREATE TABLE [mf_user] ([userID] NVARCHAR(35) NOT NULL  ,[siteID] NVARCHAR(35) NULL  ,[screenname] VARCHAR(50) NULL  ,[avatarID] NVARCHAR(35) NULL  ,[redoAvatar] SMALLINT NOT NULL  DEFAULT 0 ,[threadCounter] BIGINT NOT NULL  DEFAULT 0 ,[lastPostID] NVARCHAR(35) NULL  ,[lastThreadID] NVARCHAR(35) NULL  ,[adminMessage] NTEXT NULL  ,[isConfirmed] SMALLINT NOT NULL  DEFAULT 0 ,[isPrivate] SMALLINT NOT NULL  DEFAULT 1 ,[isPostBlocked] SMALLINT NOT NULL  DEFAULT 0 ,[isBlocked] SMALLINT NOT NULL  DEFAULT 0 ,[doShowOnline] SMALLINT NOT NULL  DEFAULT 1 ,[doReplyNotifications] SMALLINT NULL  DEFAULT 1 ,[postCounter] BIGINT NOT NULL  DEFAULT 0 ,[customValues] NTEXT NULL  ,[dateLastAction] DATETIME NULL  ,[dateLastLogin] DATETIME NULL  ,[dateIsNewFrom] DATETIME NULL  ,[remoteID] VARCHAR(35) NULL  ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_user_mf_user_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([userID])); 
 CREATE  NONCLUSTERED  INDEX [mf_user_mf_user_remoteID] ON [mf_user] ([remoteID]);
 CREATE  NONCLUSTERED  INDEX [mf_user_mf_user_siteID] ON [mf_user] ([siteID]);

---- Table structure for table `mf_viewcounter` 
----

CREATE TABLE [mf_viewcounter] ([forumID] NVARCHAR(35) NOT NULL  ,[threadID] NVARCHAR(35) NOT NULL  ,[views] BIGINT NOT NULL  DEFAULT 0 ,[dateCreate] DATETIME NOT NULL  ,[dateLastUpdate] DATETIME NOT NULL  ,CONSTRAINT [mf_viewcounter_mf_viewcounter_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([forumID],[threadID])); 
 CREATE  NONCLUSTERED  INDEX [mf_viewcounter_mf_viewcounter_idxThread] ON [mf_viewcounter] ([threadID]);

---- Dumping data for table `mf_configuration`
---- 

INSERT INTO [mf_configuration] ([configurationID],[siteID],[name],[description],[isActive],[restrictReadGroups],[restrictContributeGroups],[restrictModerateGroups],[doRequireConfirmation],[doAvatars],[doClosed],[allowAttachmentExtensions],[doAttachments],[isMaster],[filesizeLimit],[characterLimit],[doInlineImageAttachments],[imageWidthLimit],[imageHeightLimit],[remoteID],[dateCreate],[dateLastUpdate]) VALUES (N'00000000-0000-0000-0000000000000001',N'default',N'Default',N'<br />\r\n',1,NULL,NULL,N'RestrictAll',0,1,0,N'jpg,png,gif,png,pdf',1,1,20000,1000,1,250,250,NULL,N'2011-03-04 15:28:51',N'2011-06-09 13:02:35')

---- Dumping data for table `mf_displaytype`
---- 

INSERT INTO [mf_displaytype] ([displaytypeid],[objectID],[package],[name],[description],[settings],[isConfigurable],[isActive],[version],[defaults],[moduleID],[dateCreate],[dateLastUpdate]) VALUES (N'63C75F85-6290-4547-AEB22844C1DFC84E',N'73D52102-0769-4E9A-82502DABFC844D49',N'forum',N'Forums',NULL,NULL,0,1,N'1',NULL,N'95119BB4-DD49-4353-B1FEB423BE7B9C0A',N'2011-03-29 15:28:33',N'2011-04-16 15:48:55')

---- Dumping data for table `mf_settings`
---- 

INSERT INTO [mf_settings] ([settingsID],[siteID],[isMaster],[permissionGroups],[themeID],[threadsPerPage],[postsPerPage],[subscriptionLimit],[allowedExtensions],[deniedExtensions],[filesizeLimit],[avatarID],[avatarResizeType],[avatarQualityType],[avatarAspectType],[avatarCropType],[userCacheSize],[resetAvatar],[doInit],[activeWithinMinutes],[searchMode],[tempDir],[baseTempDir],[URLKey],[remoteID],[dateCreate],[dateLastUpdate]) VALUES (N'00000000-0000-0000-0000000000000002',N'default',0,N'RestrictAll',N'00000000-0000-0000-0000000000000001',10,9,100,N'jpg,gif,png,jpeg,pdf,txt,doc,xls,zip',N'html,htm,php,php2,php3,php4,php5,phtml,pwml,inc,asp,aspx,ascx,jsp,cfm,cfml,cfc,pl,bat,exe,com,dll,vbs,js,reg,cgi,htaccess,asis,sh,shtml,shtm,phtm',250,NULL,N'CROPRESIZE',N'highestQuality',N'MaxAspectXY',N'BestXY',250,0,0,15,N'simple',N'3B7E866E-97D7-4919-BFEA4E8C2641147A',NULL,N'mf/',NULL,N'2011-03-29 15:28:33',N'2011-06-07 16:25:02')

---- Dumping data for table `mf_theme`
---- 

INSERT INTO [mf_theme] ([themeID],[name],[packageName],[avatarSmallWidth],[avatarSmallHeight],[avatarMediumWidth],[avatarMediumHeight],[avatarDimensionType],[settings],[defaultAvatar],[isMaster],[style],[remoteID],[dateCreate],[dateLastUpdate]) VALUES (N'00000000-0000-0000-0000000000000001',N'Preen',N'preen',125,125,250,250,N'square',NULL,NULL,1,N'TABLE',NULL,N'2011-03-29 15:28:33',N'2011-03-29 15:28:33')
