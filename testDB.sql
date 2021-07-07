create table member(
    name    varchar2(10),
    userid  varchar2(10),
    pwd     varchar2(10),
    email   varchar2(20),
    phone   char(13),
    admin   number(1) default 0,
    primary key(userid)
);
drop table member;

insert into member values('이소미','somi','1234','lsm1234@naver.com','010-1234-5678',0);
insert into member values('김정명','kjmyeong','1234','kjm2399@naver.com','010-4124-1231',1);
insert into member values('김정록','kjl2399','1234','kjr2399@naver.com','010-1234-5214',0);

commit;

select *
from member;

select *
from member
where userid='kjmyeong';

update member
set phone='011-2142-2132'
where userid='kjmyeong';

-------------------------------------------------------------------------
-- 기본 테이블 구상 및 기본값 삽입 
-- 대 카테고리 테이블
create table bigCategory(
    BigC_id     varchar2(10),       -- 대 카테고리 아이디
    BigC_name   varchar2(20),       -- 대 카테고리 이름
    primary key(BigC_id)            -- (기본키)
);
insert into bigCategory values('Movie', '영화');
insert into bigCategory values('Game', '게임');
insert into bigCategory values('Drama', '드라마');

-- 소 카테고리 테이블
create table smallCategory(
    BigC_id       varchar2(10),       -- 대 카테고리 아이디
    SmallC_id     varchar2(10),       -- 소 카테고리 아이디
    SmallC_name   varchar2(20),       -- 소 카테고리 이름
    constraint FK_b_id FOREIGN KEY ( BigC_id ) REFERENCES bigCategory ( BigC_id ),        -- 외래키
    primary key(SmallC_id ,BigC_id)   -- 기본키
);

insert into smallCategory values('Movie', 'horror', '공포');
insert into smallCategory values('Movie', 'comedy', '코미디');
insert into smallCategory values('Movie', 'mello', '멜로');
insert into smallCategory values('Movie', 'action', '액션');
insert into smallCategory values('Movie', 'exorcism', '퇴마');
insert into smallCategory values('Game', 'horror', '공포');
insert into smallCategory values('Game', 'FPS', '슈팅');
insert into smallCategory values('Game', 'RPG', '롤플레잉');
insert into smallCategory values('Drama', 'period', '시대극');
insert into smallCategory values('Drama', 'crime', '범죄');
insert into smallCategory values('Drama', 'court ', '법정');


-- 정보 테이블
create table information(
    BigC_id      varchar2(10),       -- 대 카테고리 아이디(null)
    SmallC_id    varchar2(10),       -- 소 카테고리 아이디
    info_id      varchar2(10),       -- 정보 아이디
    info_name    varchar2(20),       -- 정보 이름
    keyword      varchar2(4000),     -- 정보 키워드
    info_content varchar2(4000),     -- 정보 내용
    constraint FK_bs_id FOREIGN KEY (SmallC_id ,BigC_id) REFERENCES smallCategory (SmallC_id ,BigC_id),        -- 외래키
    primary key(info_id, SmallC_id)  -- 기본키
);

insert into information values('Movie', 'horror', 'M_H_1','컨저링','#귀신#무서운#영화#무서운영화#공포#호러#컨져링#컨저링#엑소시즘','여기 박창주 출연함');
insert into information values('Movie', 'horror', 'M_H_2','알포인트','#귀신#무서운#영화#무서운영화#공포#호러#R포인트#군인#총#무전#팀#알포인트','여기도 박창주 출연함');
insert into information values('Movie', 'horror', 'M_H_3','아파트','#귀신#무서운#영화#무서운영화#공포#호러#일상#아파트#괴담#웹툰#이웃','여기에도 박창주 출연함');
insert into information values('Movie', 'exorcism', 'M_E_1','컨저링','#귀신#무서운#영화#무서운영화#공포#호러#컨져링#컨저링#엑소시즘','여기 박창주 출연함');
insert into information values('Movie', 'action', 'M_A_2','알포인트','#귀신#무서운#영화#무서운영화#공포#호러#R포인트#군인#총#무전#팀알포인트','여기도 박창주 출연함');
insert into information values('Game', 'horror', 'G_H_1','아웃라스트','#아웃라스트#정신병원#무서운#게임#무서운게임#공포#호러#생체실험#병원#싱글플레이#생존#환자','여기에도 박창주 출연함');
insert into information values('Game', 'RPG', 'G_R_1','메이플스토리','#메이플스토리#귀여운#-메-#단풍#모바일#2D#직업#과금#자쿰#RPG','여기 박창주 출연함');
insert into information values('Game', 'FPS', 'G_F_1','배틀그라운드','#배틀그라운드#배그#총#생존#3뚝#서바이벌#펍지#PUBG#배틀로얄#존버#스팀#FPS#게임','여기도 박창주 출연함');
insert into information values('Game', 'FPS', 'G_F_2','서든어택','#서든어택#총#서든#보급#스나#게임#팀#모드#점령#괴담#블루#레드#데스매치#FPS#무전','여기에도 박창주 출연함');
insert into information values('Game', 'FPS', 'G_F_3','오버워치','#총#망치#순간이동#옵치#오버워치#블리자드#모드#팀#사용자모드#FPS#스킨','여기에도 박창주 출연함');

drop table information;
-- 유저 테이블
create table user_info(
    user_id     varchar2(20),                 -- 유저 아이디 (유저가 입력)
    pwd         varchar2(20),                 -- 비밀번호
    nickname    varchar2(20) CONSTRAINT nickName_uq UNIQUE, -- 유저 닉네임 (유일한 값 기본키 아님)
    email       varchar2(20),                 -- 이메일
    primary key(user_id)                      -- 기본키
);
insert into user_info values('kjm2399','1234','김정명','kjm2399@google.com');
insert into user_info values('pcj1234','1234','박창주','pcj1234@naver.com');
insert into user_info values('kdy1234','1234','김동연','kdy1234@naver.com');
insert into user_info values('kdh1234','1234','김동호','kdh1234@naver.com');
insert into user_info values('scs1234','1234','신치수','scs1234@naver.com');
insert into user_info values('gjs1234','1234','강전석','gjs1234@naver.com');

create table ranking(
    SmallC_id   varchar2(10),
    info_id     varchar2(10),
    user_id     varchar2(10),

    constraint FK_info_id FOREIGN KEY ( SmallC_id, info_id ) REFERENCES information ( SmallC_id, info_id ),        -- 외래키
    PRIMARY KEY (info_id, user_id)
);

insert into ranking values('horror','M_H_1','kjm2399');
insert into ranking values('horror','M_H_2','kjm2399');
insert into ranking values('horror','M_H_3','kjm2399');
insert into ranking values('horror','M_H_1','pcj1234');
insert into ranking values('horror','M_H_1','kdh1234');
insert into ranking values('FPS','G_F_1','kjm2399');
insert into ranking values('FPS','G_F_1','scs1234');

commit;
-----------------------------------------------------------------------------------------
-- 쿼리 

select *
from ranking
where info_id = 'M_H_1';

-- 검색 쿼리
SELECT concat(SmallC_id,BigC_id) as newname, count(newname) 
FROM information 
WHERE keyword LIKE ('%공포%')
GROUP BY newname
HAVING COUNT(newname) > 1;

SELECT distinct SmallC_id ||' '|| BigC_id as category FROM information WHERE keyword LIKE ('%컨저링%');

SELECT BigC_id, SmallC_id COUNT(BigC_id) FROM information GROUP BY video_id HAVING COUNT(*) > 1; 

select info_name from information;