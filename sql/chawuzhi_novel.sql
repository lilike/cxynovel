/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/10/26 15:51:18                          */
/*==============================================================*/


drop table if exists recommend_book;

drop table if exists sys_user;

drop table if exists t_article;

drop table if exists t_book;

drop table if exists t_bookcase;

drop table if exists t_chapter;

drop table if exists t_system_block;

drop table if exists t_user;

drop table if exists t_user_detail;

drop table if exists user_login_info;

/*==============================================================*/
/* Table: recommend_book                                        */
/*==============================================================*/
create table recommend_book
(
   id                   int(32) not null auto_increment,
   book_id              int(32),
   position             int(32),
   lay_position         varchar(32),
   length_of_recommend  date,
   creater_no           varchar(32),
   create_time          timestamp,
   modifier_no          varchar(32),
   modify_time          timestamp,
   primary key (id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   user_id              int not null auto_increment,
   user_name            varchar(32),
   password             varchar(32),
   login_date           timestamp,
   logout_date          timestamp,
   error_input_num      int(10),
   remark               varchar(32),
   primary key (user_id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_article                                             */
/*==============================================================*/
create table t_article
(
   id                   int(32) not null auto_increment,
   chapter_id           int(32),
   chapter_name         varchar(32),
   content_name         varchar(32),
   content              longtext,
   creater_no           int(32),
   create_time          varchar(32),
   modifier_no          int(32),
   modify_time          varchar(32),
   primary key (id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_book                                                */
/*==============================================================*/
create table t_book
(
   id                   int(32) not null auto_increment,
   book_name            varchar(32),
   pinyin               text,
   pinyin_headchar      varchar(32),
   book_author          varchar(32),
   category             varchar(32),
   intro                varchar(100),
   keyword              varchar(32),
   address              varchar(255),
   chapters             int(32),
   last_chapter_no      int(32),
   last_chapter         varchar(32),
   creater_no           varchar(32),
   create_time          timestamp,
   modifier_no          varchar(32),
   modifiy_time         timestamp,
   use_customize_info_title tinyint,
   info_title           char(150) default null,
   info_keywords        char(150) default null,
   info_description     char(200) default null,
   use_customize_list_title tinyint,
   list_title           char(150) default null,
   list_keywords        char(150) default null,
   list_description     char(200) default null,
   primary key (id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_bookcase                                            */
/*==============================================================*/
create table t_bookcase
(
   bookcase_id          int(32) not null auto_increment,
   user_id              int(32),
   book_id              int(32),
   last_category_id     int(32),
   chapter_id           int(32),
   chapter_name         varchar(32),
   last_visit           timestamp,
   delete_flag          tinyint(1),
   creater_no           varchar(32),
   create_time          timestamp,
   modifier             varchar(32),
   moidfiy_time         timestamp,
   primary key (bookcase_id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_chapter                                             */
/*==============================================================*/
create table t_chapter
(
   id                   int(32) not null auto_increment,
   book_id              int(32),
   book_name            varchar(32),
   chapter_name         varchar(32),
   chapter_type         smallint,
   isvip                int(1),
   size                 int,
   publish_date         timestamp,
   deleteflag           tinyint(1),
   creater              varchar(32),
   creater_time         timestamp,
   modifier             varchar(32),
   modifiy_time         timestamp,
   primary key (id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_system_block                                        */
/*==============================================================*/
create table t_system_block
(
   block_no             int(32) not null auto_increment,
   block_id             int(32),
   block_name           varchar(32),
   type                 smallint,
   category             int(32),
   content              text,
   sortcol              char(32) default null,
   isasc                tinyint,
   ifinish              tinyint,
   limitnum             int,
   deleteflag           tinyint(1),
   target               smallint,
   creater_no           char(32),
   create_time          timestamp,
   modifier             char(32),
   modify_time          timestamp,
   primary key (block_no)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   user_no              int not null auto_increment,
   account              char(32) not null,
   password             char(32),
   username             char(50),
   email                char(60),
   reg_date             timestamp,
   sex                  smallint,
   qq                   char(15),
   last_logintime       timestamp,
   lineno               char(32),
   type                 smallint,
   vote_count           int,
   delete_flag          tinyint,
   real_name            char(10),
   id                   char(18),
   phone                char(11),
   branch               char(50),
   bankno               char(20),
   alipay_account       char(50),
   category             int,
   subcategory          int,
   modify_user_no       int,
   modify_name          char(10),
   openid               char(50),
   activeflag           tinyint,
   mail_token           char(32),
   primary key (user_no)
)
auto_increment = 1;

/*==============================================================*/
/* Table: t_user_detail                                         */
/*==============================================================*/
create table t_user_detail
(
   user_id              int not null auto_increment,
   hobby                varchar(32),
   birthday             timestamp,
   motto                varchar(255),
   photo                varchar(255),
   sex                  char(2),
   remark               varchar(32),
   primary key (user_id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: user_login_info                                       */
/*==============================================================*/
create table user_login_info
(
   user_id              int not null auto_increment,
   user_name            varchar(32),
   login_date           timestamp,
   logout_date          timestamp,
   error_input_num      int(10),
   remark               varchar(32),
   primary key (user_id)
)
auto_increment = 1;

