create database mommy;
use mommy;   /*데이터베이스 */

create table tbl_user(
   userNum int unsigned auto_increment primary key,
   userName varchar(1000),
   userId varchar(1000),
   userPw varchar(1000), 
   userPhone varchar(1000),
   userBirthYear tinyint unsigned,
   userBirthMonth tinyint unsigned,
   userBirthDate tinyint unsigned,
   userStatus tinyint unsigned,
   userEmail varchar(1000),
   userBirthYear int unsigned,
   userGender tinyint unsigned
);

create table tbl_community(
   communityNum int unsigned auto_increment primary key,
   communityTitle varchar(2000),
   communityContent varchar(5000),
   userNum int unsigned,
   boardDate date,
   communityCategory tinyint unsigned,
   fileName varchar(1000),
   constraint fk_community foreign key(userNum) references tbl_user(userNum)
);




create table tbl_communityComment(
   commentNum int unsigned auto_increment primary key,
   communityNum int unsigned,
   commentDate date,
   userNum int unsigned,
   commentContent varchar(3000),
   constraint fk_comment_communityNum foreign key(communityNum) references tbl_community(communityNum),
   constraint fk_comment_userNum foreign key(userNum) references tbl_user(userNum)
);

create table tbl_ask_category(
   categoryNum int unsigned auto_increment primary key,
   categoryName varchar(1000)
);


INSERT INTO mommy.tbl_ask_category
(categoryName)
VALUES('문의');

INSERT INTO mommy.tbl_ask_category
(categoryName)
VALUES('신고');

create table tbl_ask(
   askNum int unsigned auto_increment primary key,
   userNum int unsigned,
   categoryNum int unsigned,
   askTitle varchar(1000),
   askContent varchar(1000),
   askAttach varchar(1000),
   askDate date,
   askStatus tinyint unsigned default'0' not NULL,
   askAnswer varchar(1000),
   constraint fk_ask_userNum foreign key(userNum) references tbl_user(userNum),
   constraint fk_ask_categoryNum foreign key(categoryNum) references   tbl_ask_category(categoryNum)
);

create table tbl_askFiles(
   fileName varchar(765) primary key,
   askNum int unsigned,
   fileNameOriginal varchar(2000),
   constraint fk_tbl_ask_files foreign key(askNum) references tbl_ask(askNum)
);

create table tbl_notice (
   noticeNum int unsigned auto_increment primary key,
   noticeDate date,
   noticeTitle varchar(1000),
   noticeContent varchar(1000)
);


create table tbl_profile(
   profileNum int unsigned auto_increment primary key,
   userNum int unsigned,
   profileDate date,
   profilePicture varchar(1000),
   profileDescription varchar(1000),
   profileSalary int,
   profileAttach varchar(1000),
   profileProcess bit,   
   locationSido varchar(50),   
   locationSigun varchar(50),   
   locationDong varchar(50),   
   P_periodStartDate date,
   P_mon bit,
   P_tue bit,
   P_wed bit,
   P_thu bit,
   P_fri bit,
   P_sat bit,
   P_sun bit,
   P_morning bit,
   P_lunch bit,
   P_noon bit,
   P_week bit,
   P_month bit,
   P_quarter bit,
   P_semiAnnual bit,
   careIndoor bit,
   careCommit bit,
   careFood bit,
   careClean bit,
   careStudy bit,
   babyNewborn bit,
   babyChild bit,
   babyKinder bit,
   babyElementary bit,
   checkMedi bit,      
   checkMom bit,      
   checkTeacher bit,    
   checkCitizen bit,   
   checkUniversity bit,   
   careEmergency tinyint,
   constraint fk_profile_userNum foreign key(userNum) references tbl_user(userNum)
);



create table tbl_profileFiles(
   profileNum int unsigned,
   fileName varchar(765) primary key,
   fileNameOriginal varchar(2000),
   constraint fk_tbl_profile_files foreign key(profileNum) references tbl_profile(profileNum)
);



create table tbl_favorite(
   favoriteNum int unsigned auto_increment primary key,
   userNum int unsigned,
   profileUserNum int unsigned,
   profileNum int unsigned,
   constraint fk_favorite_user foreign key(userNum) references tbl_user(userNum),
   constraint fk_favorite_profile foreign key(profileUserNum) references tbl_profile(profileNum)
);
		
create table tbl_chat(
   chatNum int unsigned auto_increment primary key,
   userNum int unsigned,
   sendUserName int unsigned, /*나에게 요청한 사람의 유저넘*/
   chatTitle varchar(400),
   chatContent varchar(400),
   chatStatus tinyint,
   chatDate date,
   constraint fk_chat_user foreign key(userNum) references tbl_user(userNum)
);


	



  



