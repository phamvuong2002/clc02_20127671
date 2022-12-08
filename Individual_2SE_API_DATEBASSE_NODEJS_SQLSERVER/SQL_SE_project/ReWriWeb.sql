/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     11/30/2022 6:14:49 PM                        */
/* FIT - HCMUS													*/
/* 20CLC05 - IntroSE											*/
/* Group 03														*/
/* 20127063 - Phan Minh Phúc									*/
/* 20127188 - Nguyễn Quốc Huy									*/
/* 20127570 - Võ Thị Kim Ngân									*/
/* 20127671 - Phạm Quốc Vương									*/
/* 20127681 - Lê Cung Tiến										*/
/*==============================================================*/

--use QLGVTGDT
--go

--drop database QLTG
--go

create database QLTG
go

use QLTG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AUTHOR') and o.name = 'FK_AUTHOR_MANAGE_ADMIN')
alter table AUTHOR
   drop constraint FK_AUTHOR_MANAGE_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AUTHOR') and o.name = 'FK_AUTHOR_SUPERVISE_EDITOR')
alter table AUTHOR
   drop constraint FK_AUTHOR_SUPERVISE_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHAPTER') and o.name = 'FK_CHAPTER_ADD_UPDAT_AUTHOR')
alter table CHAPTER
   drop constraint FK_CHAPTER_ADD_UPDAT_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHAPTER') and o.name = 'FK_CHAPTER_APPROVE_D_EDITOR')
alter table CHAPTER
   drop constraint FK_CHAPTER_APPROVE_D_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHAPTER') and o.name = 'FK_CHAPTER_HAVE_OUTLINE')
alter table CHAPTER
   drop constraint FK_CHAPTER_HAVE_OUTLINE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHAPTER') and o.name = 'FK_CHAPTER_HAVE_STORY')
alter table CHAPTER
   drop constraint FK_CHAPTER_HAVE_STORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENT') and o.name = 'FK_COMMENT_MAKE_EDITOR')
alter table COMMENT
   drop constraint FK_COMMENT_MAKE_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENT') and o.name = 'FK_COMMENT_ON_CHAPTER')
alter table COMMENT
   drop constraint FK_COMMENT_ON_CHAPTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DRAFT') and o.name = 'FK_DRAFT_APPROVE_D_EDITOR')
alter table DRAFT
   drop constraint FK_DRAFT_APPROVE_D_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DRAFT') and o.name = 'FK_DRAFT_INCLUDE_STORY')
alter table DRAFT
   drop constraint FK_DRAFT_INCLUDE_STORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DRAFT') and o.name = 'FK_DRAFT_WRITE_AUTHOR')
alter table DRAFT
   drop constraint FK_DRAFT_WRITE_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EDITOR') and o.name = 'FK_EDITOR_MANAGE_ADMIN')
alter table EDITOR
   drop constraint FK_EDITOR_MANAGE_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OUTLINE') and o.name = 'FK_OUTLINE_ADD_UPDAT_AUTHOR')
alter table OUTLINE
   drop constraint FK_OUTLINE_ADD_UPDAT_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OUTLINE') and o.name = 'FK_OUTLINE_APPROVE_D_EDITOR')
alter table OUTLINE
   drop constraint FK_OUTLINE_APPROVE_D_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OUTLINE') and o.name = 'FK_OUTLINE_CONSIST_STORY')
alter table OUTLINE
   drop constraint FK_OUTLINE_CONSIST_STORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALARYSTATUS') and o.name = 'FK_SALARYST_BELONG_TO_CHAPTER')
alter table SALARYSTATUS
   drop constraint FK_SALARYST_BELONG_TO_CHAPTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALARYSTATUS') and o.name = 'FK_SALARYST_EDIT_EDITOR')
alter table SALARYSTATUS
   drop constraint FK_SALARYST_EDIT_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALARYSTATUS') and o.name = 'FK_SALARYST_HAVE_AUTHOR')
alter table SALARYSTATUS
   drop constraint FK_SALARYST_HAVE_AUTHOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STORY') and o.name = 'FK_STORY_APPROVE_D_EDITOR')
alter table STORY
   drop constraint FK_STORY_APPROVE_D_EDITOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STORY') and o.name = 'FK_STORY_OWN_AUTHOR')
alter table STORY
   drop constraint FK_STORY_OWN_AUTHOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AUTHOR')
            and   name  = 'SUPERVISE_FK'
            and   indid > 0
            and   indid < 255)
   drop index AUTHOR.SUPERVISE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AUTHOR')
            and   name  = 'MANAGE_FK'
            and   indid > 0
            and   indid < 255)
   drop index AUTHOR.MANAGE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTHOR')
            and   type = 'U')
   drop table AUTHOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHAPTER')
            and   name  = 'ADD_UPDATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHAPTER.ADD_UPDATE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHAPTER')
            and   name  = 'APPROVE_DECLINE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHAPTER.APPROVE_DECLINE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHAPTER')
            and   name  = 'HAVE_FK2'
            and   indid > 0
            and   indid < 255)
   drop index CHAPTER.HAVE_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHAPTER')
            and   name  = 'HAVE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHAPTER.HAVE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHAPTER')
            and   type = 'U')
   drop table CHAPTER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMMENT')
            and   name  = 'ON_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMMENT.ON_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMMENT')
            and   name  = 'MAKE_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMMENT.MAKE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMMENT')
            and   type = 'U')
   drop table COMMENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DRAFT')
            and   name  = 'INCLUDE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DRAFT.INCLUDE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DRAFT')
            and   name  = 'APPROVE_DECLINE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DRAFT.APPROVE_DECLINE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DRAFT')
            and   name  = 'WRITE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DRAFT.WRITE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DRAFT')
            and   type = 'U')
   drop table DRAFT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EDITOR')
            and   name  = 'MANAGE_FK'
            and   indid > 0
            and   indid < 255)
   drop index EDITOR.MANAGE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EDITOR')
            and   type = 'U')
   drop table EDITOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OUTLINE')
            and   name  = 'APPROVE_DECLINE_FK'
            and   indid > 0
            and   indid < 255)
   drop index OUTLINE.APPROVE_DECLINE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OUTLINE')
            and   name  = 'ADD_UPDATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index OUTLINE.ADD_UPDATE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OUTLINE')
            and   name  = 'CONSIST_FK'
            and   indid > 0
            and   indid < 255)
   drop index OUTLINE.CONSIST_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OUTLINE')
            and   type = 'U')
   drop table OUTLINE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALARYSTATUS')
            and   name  = 'EDIT_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALARYSTATUS.EDIT_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALARYSTATUS')
            and   name  = 'HAVE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALARYSTATUS.HAVE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALARYSTATUS')
            and   name  = 'BELONG_TO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALARYSTATUS.BELONG_TO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SALARYSTATUS')
            and   type = 'U')
   drop table SALARYSTATUS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STORY')
            and   name  = 'INCLUDE_FK'
            and   indid > 0
            and   indid < 255)
   drop index STORY.INCLUDE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STORY')
            and   name  = 'OWN_FK'
            and   indid > 0
            and   indid < 255)
   drop index STORY.OWN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STORY')
            and   name  = 'CONSIST_FK'
            and   indid > 0
            and   indid < 255)
   drop index STORY.CONSIST_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STORY')
            and   name  = 'APPROVE_DECLINE_FK'
            and   indid > 0
            and   indid < 255)
   drop index STORY.APPROVE_DECLINE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STORY')
            and   type = 'U')
   drop table STORY
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   ADMINID              char(10)             not null,
   PASSWORD             char(15)             not null,
   ADMINNAME            char(20)             not null,
   EMAIL                char(30)             not null,
   PHONENUMBER          char(15)             not null,
   constraint PK_ADMIN primary key (ADMINID)
)
go

/*==============================================================*/
/* Table: AUTHOR                                                */
/*==============================================================*/
create table AUTHOR (
   AUTHORID             char(10)             not null,
   ADMINID              char(10)             not null,
   EDITORID             char(10)             not null,
   PASSWORD             char(15)             not null,
   AUTHORNAME           char(20)             not null,
   EMAIL                char(30)             not null,
   ADDRESS              char(30)             not null,
   PHONENUMBER          char(15)             not null,
   ACCOUNTNUMBER        char(15)             not null,
   SALARY               int                  not null,
   UNPAID_              int                  null,
   constraint PK_AUTHOR primary key (AUTHORID)
)
go

/*==============================================================*/
/* Index: MANAGE_FK                                             */
/*==============================================================*/




create nonclustered index MANAGE_FK on AUTHOR (ADMINID ASC)
go

/*==============================================================*/
/* Index: SUPERVISE_FK                                          */
/*==============================================================*/




create nonclustered index SUPERVISE_FK on AUTHOR (EDITORID ASC)
go

/*==============================================================*/
/* Table: CHAPTER                                               */
/*==============================================================*/
create table CHAPTER (
   CHAPTERID            char(10)             not null,
   EDITORID             char(10)             not null,
   OUTLINEID            char(10)             not null,
   STORYID              char(10)             not null,
   AUTHORID             char(10)             not null,
   CHAPTERNAME          char(30)             not null,
   constraint PK_CHAPTER primary key (CHAPTERID)
)
go

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/




create nonclustered index HAVE_FK on CHAPTER (OUTLINEID ASC)
go

/*==============================================================*/
/* Index: HAVE_FK2                                              */
/*==============================================================*/




create nonclustered index HAVE_FK2 on CHAPTER (STORYID ASC)
go

/*==============================================================*/
/* Index: APPROVE_DECLINE_FK                                    */
/*==============================================================*/




create nonclustered index APPROVE_DECLINE_FK on CHAPTER (EDITORID ASC)
go

/*==============================================================*/
/* Index: ADD_UPDATE_FK                                         */
/*==============================================================*/




create nonclustered index ADD_UPDATE_FK on CHAPTER (AUTHORID ASC)
go

/*==============================================================*/
/* Table: COMMENT                                               */
/*==============================================================*/
create table COMMENT (
   COMMENTID            char(10)             not null,
   CHAPTERID            char(10)             not null,
   EDITORID             char(10)             null,
   CONTENT              text                 null,
   constraint PK_COMMENT primary key (COMMENTID)
)
go

/*==============================================================*/
/* Index: MAKE_FK                                               */
/*==============================================================*/




create nonclustered index MAKE_FK on COMMENT (EDITORID ASC)
go

/*==============================================================*/
/* Index: ON_FK                                                 */
/*==============================================================*/




create nonclustered index ON_FK on COMMENT (CHAPTERID ASC)
go

/*==============================================================*/
/* Table: DRAFT                                                 */
/*==============================================================*/
create table DRAFT (
   DRAFTID              char(10)             not null,
   AUTHORID             char(10)             not null,
   STORYID              char(10)             not null,
   EDITORID             char(10)             not null,
   CONTENT				text                 not null,
   constraint PK_DRAFT primary key (DRAFTID)
)
go

/*==============================================================*/
/* Index: WRITE_FK                                              */
/*==============================================================*/




create nonclustered index WRITE_FK on DRAFT (AUTHORID ASC)
go

/*==============================================================*/
/* Index: APPROVE_DECLINE_FK                                    */
/*==============================================================*/




create nonclustered index APPROVE_DECLINE_FK on DRAFT (EDITORID ASC)
go

/*==============================================================*/
/* Index: INCLUDE_FK                                            */
/*==============================================================*/




create nonclustered index INCLUDE_FK on DRAFT (STORYID ASC)
go

/*==============================================================*/
/* Table: EDITOR                                                */
/*==============================================================*/
create table EDITOR (
   EDITORID             char(10)             not null,
   ADMINID              char(10)             not null,
   EDITORNAME           char(20)             not null,
   EMAIL                char(30)             not null,
   PHONENUMBER          char(15)             not null,
   ACCOUNTNUMBER        char(15)             not null,
   SALARY               int                  not null,
   constraint PK_EDITOR primary key (EDITORID)
)
go

/*==============================================================*/
/* Index: MANAGE_FK                                             */
/*==============================================================*/




create nonclustered index MANAGE_FK on EDITOR (ADMINID ASC)
go

/*==============================================================*/
/* Table: OUTLINE                                               */
/*==============================================================*/
create table OUTLINE (
   OUTLINEID            char(10)             not null,
   AUTHORID             char(10)             not null,
   EDITORID             char(10)             not null,
   STORYID              char(10)             not null,
   CONTENT              text                 not null,
   constraint PK_OUTLINE primary key (OUTLINEID)
)
go

/*==============================================================*/
/* Index: CONSIST_FK                                            */
/*==============================================================*/




create nonclustered index CONSIST_FK on OUTLINE (STORYID ASC)
go

/*==============================================================*/
/* Index: ADD_UPDATE_FK                                         */
/*==============================================================*/




create nonclustered index ADD_UPDATE_FK on OUTLINE (AUTHORID ASC)
go

/*==============================================================*/
/* Index: APPROVE_DECLINE_FK                                    */
/*==============================================================*/




create nonclustered index APPROVE_DECLINE_FK on OUTLINE (EDITORID ASC)
go

/*==============================================================*/
/* Table: SALARYSTATUS                                          */
/*==============================================================*/
create table SALARYSTATUS (
   SSID                 char(10)             not null,
   EDITORID             char(10)             not null,
   CHAPTERID            char(10)             not null,
   AUTHORID             char(10)             not null,
   STATUS               char(20)             not null,
   constraint PK_SALARYSTATUS primary key (SSID)
)
go

/*==============================================================*/
/* Index: BELONG_TO_FK                                          */
/*==============================================================*/




create nonclustered index BELONG_TO_FK on SALARYSTATUS (CHAPTERID ASC)
go

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/




create nonclustered index HAVE_FK on SALARYSTATUS (AUTHORID ASC)
go

/*==============================================================*/
/* Index: EDIT_FK                                               */
/*==============================================================*/




create nonclustered index EDIT_FK on SALARYSTATUS (EDITORID ASC)
go

/*==============================================================*/
/* Table: STORY                                                 */
/*==============================================================*/
create table STORY (
   STORYID              char(10)             not null,
   AUTHORID             char(10)             not null,
   EDITORID             char(10)             not null,
   STORYNAME            char(20)             not null,
   STATE                char(20)             not null,
   NUMOFCHAPS           int                  not null,
   TYPE                 char(10)             not null,
   constraint PK_STORY primary key (STORYID)
)
go

/*==============================================================*/
/* Index: APPROVE_DECLINE_FK                                    */
/*==============================================================*/




create nonclustered index APPROVE_DECLINE_FK on STORY (EDITORID ASC)
go

/*==============================================================*/
/* Index: CONSIST_FK                                            */
/*==============================================================*/




create nonclustered index CONSIST_FK on STORY (STORYID ASC)
go

/*==============================================================*/
/* Index: OWN_FK                                                */
/*==============================================================*/




create nonclustered index OWN_FK on STORY (AUTHORID ASC)
go

/*==============================================================*/
/* Index: INCLUDE_FK                                            */
/*==============================================================*/




create nonclustered index INCLUDE_FK on STORY (STORYID ASC)
go

alter table AUTHOR
   add constraint FK_AUTHOR_MANAGE_ADMIN foreign key (ADMINID)
      references ADMIN (ADMINID)
go

alter table AUTHOR
   add constraint FK_AUTHOR_SUPERVISE_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table CHAPTER
   add constraint FK_CHAPTER_ADD_UPDAT_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table CHAPTER
   add constraint FK_CHAPTER_APPROVE_D_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table CHAPTER
   add constraint FK_CHAPTER_HAVE_OUTLINE foreign key (OUTLINEID)
      references OUTLINE (OUTLINEID)
go

alter table CHAPTER
   add constraint FK_CHAPTER_HAVE_STORY foreign key (STORYID)
      references STORY (STORYID)
go

alter table COMMENT
   add constraint FK_COMMENT_MAKE_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table COMMENT
   add constraint FK_COMMENT_ON_CHAPTER foreign key (CHAPTERID)
      references CHAPTER (CHAPTERID)
go

alter table DRAFT
   add constraint FK_DRAFT_APPROVE_D_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table DRAFT
   add constraint FK_DRAFT_INCLUDE_STORY foreign key (STORYID)
      references STORY (STORYID)
go

alter table DRAFT
   add constraint FK_DRAFT_WRITE_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table EDITOR
   add constraint FK_EDITOR_MANAGE_ADMIN foreign key (ADMINID)
      references ADMIN (ADMINID)
go

alter table OUTLINE
   add constraint FK_OUTLINE_ADD_UPDAT_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table OUTLINE
   add constraint FK_OUTLINE_APPROVE_D_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table OUTLINE
   add constraint FK_OUTLINE_CONSIST_STORY foreign key (STORYID)
      references STORY (STORYID)
go

alter table SALARYSTATUS
   add constraint FK_SALARYST_BELONG_TO_CHAPTER foreign key (CHAPTERID)
      references CHAPTER (CHAPTERID)
go

alter table SALARYSTATUS
   add constraint FK_SALARYST_EDIT_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table SALARYSTATUS
   add constraint FK_SALARYST_HAVE_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

alter table STORY
   add constraint FK_STORY_APPROVE_D_EDITOR foreign key (EDITORID)
      references EDITOR (EDITORID)
go

alter table STORY
   add constraint FK_STORY_OWN_AUTHOR foreign key (AUTHORID)
      references AUTHOR (AUTHORID)
go

