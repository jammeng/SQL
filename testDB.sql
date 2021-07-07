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

insert into member values('�̼ҹ�','somi','1234','lsm1234@naver.com','010-1234-5678',0);
insert into member values('������','kjmyeong','1234','kjm2399@naver.com','010-4124-1231',1);
insert into member values('������','kjl2399','1234','kjr2399@naver.com','010-1234-5214',0);

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
-- �⺻ ���̺� ���� �� �⺻�� ���� 
-- �� ī�װ� ���̺�
create table bigCategory(
    BigC_id     varchar2(10),       -- �� ī�װ� ���̵�
    BigC_name   varchar2(20),       -- �� ī�װ� �̸�
    primary key(BigC_id)            -- (�⺻Ű)
);
insert into bigCategory values('Movie', '��ȭ');
insert into bigCategory values('Game', '����');
insert into bigCategory values('Drama', '���');

-- �� ī�װ� ���̺�
create table smallCategory(
    BigC_id       varchar2(10),       -- �� ī�װ� ���̵�
    SmallC_id     varchar2(10),       -- �� ī�װ� ���̵�
    SmallC_name   varchar2(20),       -- �� ī�װ� �̸�
    constraint FK_b_id FOREIGN KEY ( BigC_id ) REFERENCES bigCategory ( BigC_id ),        -- �ܷ�Ű
    primary key(SmallC_id ,BigC_id)   -- �⺻Ű
);

insert into smallCategory values('Movie', 'horror', '����');
insert into smallCategory values('Movie', 'comedy', '�ڹ̵�');
insert into smallCategory values('Movie', 'mello', '���');
insert into smallCategory values('Movie', 'action', '�׼�');
insert into smallCategory values('Movie', 'exorcism', '��');
insert into smallCategory values('Game', 'horror', '����');
insert into smallCategory values('Game', 'FPS', '����');
insert into smallCategory values('Game', 'RPG', '���÷���');
insert into smallCategory values('Drama', 'period', '�ô��');
insert into smallCategory values('Drama', 'crime', '����');
insert into smallCategory values('Drama', 'court ', '����');


-- ���� ���̺�
create table information(
    BigC_id      varchar2(10),       -- �� ī�װ� ���̵�(null)
    SmallC_id    varchar2(10),       -- �� ī�װ� ���̵�
    info_id      varchar2(10),       -- ���� ���̵�
    info_name    varchar2(20),       -- ���� �̸�
    keyword      varchar2(4000),     -- ���� Ű����
    info_content varchar2(4000),     -- ���� ����
    constraint FK_bs_id FOREIGN KEY (SmallC_id ,BigC_id) REFERENCES smallCategory (SmallC_id ,BigC_id),        -- �ܷ�Ű
    primary key(info_id, SmallC_id)  -- �⺻Ű
);

insert into information values('Movie', 'horror', 'M_H_1','������','#�ͽ�#������#��ȭ#�����ȭ#����#ȣ��#������#������#���ҽ���','���� ��â�� �⿬��');
insert into information values('Movie', 'horror', 'M_H_2','������Ʈ','#�ͽ�#������#��ȭ#�����ȭ#����#ȣ��#R����Ʈ#����#��#����#��#������Ʈ','���⵵ ��â�� �⿬��');
insert into information values('Movie', 'horror', 'M_H_3','����Ʈ','#�ͽ�#������#��ȭ#�����ȭ#����#ȣ��#�ϻ�#����Ʈ#����#����#�̿�','���⿡�� ��â�� �⿬��');
insert into information values('Movie', 'exorcism', 'M_E_1','������','#�ͽ�#������#��ȭ#�����ȭ#����#ȣ��#������#������#���ҽ���','���� ��â�� �⿬��');
insert into information values('Movie', 'action', 'M_A_2','������Ʈ','#�ͽ�#������#��ȭ#�����ȭ#����#ȣ��#R����Ʈ#����#��#����#��������Ʈ','���⵵ ��â�� �⿬��');
insert into information values('Game', 'horror', 'G_H_1','�ƿ���Ʈ','#�ƿ���Ʈ#���ź���#������#����#���������#����#ȣ��#��ü����#����#�̱��÷���#����#ȯ��','���⿡�� ��â�� �⿬��');
insert into information values('Game', 'RPG', 'G_R_1','�����ý��丮','#�����ý��丮#�Ϳ���#-��-#��ǳ#�����#2D#����#����#����#RPG','���� ��â�� �⿬��');
insert into information values('Game', 'FPS', 'G_F_1','��Ʋ�׶���','#��Ʋ�׶���#���#��#����#3��#�����̹�#����#PUBG#��Ʋ�ξ�#����#����#FPS#����','���⵵ ��â�� �⿬��');
insert into information values('Game', 'FPS', 'G_F_2','�������','#�������#��#����#����#����#����#��#���#����#����#���#����#������ġ#FPS#����','���⿡�� ��â�� �⿬��');
insert into information values('Game', 'FPS', 'G_F_3','������ġ','#��#��ġ#�����̵�#��ġ#������ġ#���ڵ�#���#��#����ڸ��#FPS#��Ų','���⿡�� ��â�� �⿬��');

drop table information;
-- ���� ���̺�
create table user_info(
    user_id     varchar2(20),                 -- ���� ���̵� (������ �Է�)
    pwd         varchar2(20),                 -- ��й�ȣ
    nickname    varchar2(20) CONSTRAINT nickName_uq UNIQUE, -- ���� �г��� (������ �� �⺻Ű �ƴ�)
    email       varchar2(20),                 -- �̸���
    primary key(user_id)                      -- �⺻Ű
);
insert into user_info values('kjm2399','1234','������','kjm2399@google.com');
insert into user_info values('pcj1234','1234','��â��','pcj1234@naver.com');
insert into user_info values('kdy1234','1234','�赿��','kdy1234@naver.com');
insert into user_info values('kdh1234','1234','�赿ȣ','kdh1234@naver.com');
insert into user_info values('scs1234','1234','��ġ��','scs1234@naver.com');
insert into user_info values('gjs1234','1234','������','gjs1234@naver.com');

create table ranking(
    SmallC_id   varchar2(10),
    info_id     varchar2(10),
    user_id     varchar2(10),

    constraint FK_info_id FOREIGN KEY ( SmallC_id, info_id ) REFERENCES information ( SmallC_id, info_id ),        -- �ܷ�Ű
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
-- ���� 

select *
from ranking
where info_id = 'M_H_1';

-- �˻� ����
SELECT concat(SmallC_id,BigC_id) as newname, count(newname) 
FROM information 
WHERE keyword LIKE ('%����%')
GROUP BY newname
HAVING COUNT(newname) > 1;

SELECT distinct SmallC_id ||' '|| BigC_id as category FROM information WHERE keyword LIKE ('%������%');

SELECT BigC_id, SmallC_id COUNT(BigC_id) FROM information GROUP BY video_id HAVING COUNT(*) > 1; 

select info_name from information;