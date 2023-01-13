

create table book_main(
	num int not null,
	book_type varchar(50) not null,
	book_title varchar(150) not null,
	book_author varchar(50) not null,
	book_publish varchar(50) not null,
	book_start varchar(50) not null,
	book_end varchar(50) not null,
	primary key(num)
);


drop table test;
drop table book_main;

show tables;

delete from book_main;

select * from book_main;

LOAD DATA INFILE '사서추천도서_realData.csv' INTO TABLE book_main FIELDS TERMINATED BY ',';

LOAD DATA INFILE 'C:\Users\82102\Desktop\사서추천도서 목록\사서추천도서_realData.csv' INTO TABLE book_main FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INFILE 'C:\Users\82102\Desktop\사서추천도서 목록\사서추천도서_realData.csv' INTO TABLE book_main;

LOAD DATA INFILE '사서추천도서_realData.csv'
INTO TABLE book_main
FIELDS TERMINATED BY ','

//자연과학

insert into book_main value(1168,'자연과학','누가 내 이름을 이렇게 지었어? : 좀벌레부터 범고래까지 우리가 몰랐던 야생의 뒷이야기','오스카르 아란다','동녘','2020','2021.4');

insert into book_main value(1165,'자연과학','실험실의 진화 : 연금술에서 시민과학까지','홍성욱 지음','김영사','2020','2021.4');

insert into book_main value(1161,'자연과학','건축 근대소설을 거닐다','김소연','루아크','2020','2021.2');

insert into book_main value(1156,'자연과학','최고의 수학자가 사랑한 문제들','이언 스튜어트','반니','2020','2021.2');

insert into book_main value(1151,'자연과학','우주를 만지다 : 삶이 물리학을 만나는 순간들','권재술','특별한서재','2020','2021.1');

insert into book_main value(1148,'자연과학','상상이 현실이 되는 순간 : 시대를 앞서간 SF가 만든 과학 이야기','조엘 레비','행북','2020','2021.1');

insert into book_main value(1143,'자연과학','세계를 정복한 식물들','스티븐 해리스 지음','돌배나무','2020','2020.12');

insert into book_main value(1142,'자연과학','수학으로 생각하는 힘 : 일상의 모든 순간 수학은 어떻게 최선의 선택을 돕는가 ','키트 예이츠 지음 ','웅진지식하우스','2020','2020.12');

insert into book_main value(1135,'자연과학','우유보다 뇌과학','만프레드 슈피처| 노르베르트 헤르슈코비츠','The Nan(더난콘텐츠그룹)','2020','2020.11');

insert into book_main value(1134,'자연과학','마음의 오류들' ,'에릭 캔델','RHK(알에이치코리아)','2020','2020.11');



delete from book_main;

select * from book_main;

//인문과학

insert into book_main value(1164,'인문과학','습관의 디테일 : 위대한 변화를 만드는 사소한 행동 설계','BJ 포그','흐름출판','2020','2021.4');

insert into book_main value(1158,'인문과학','국보| 역사의 명장면을 담다','배한철','매경경제신문사','2020','2021.2');

insert into book_main value(1157,'인문과학','철학자의 음악서재| C#','최대환','책밥상','2020','2021.2');

insert into book_main value(1153,'인문과학','걸작과 졸작 사이','김이산','반니','2020','2021.1');

insert into book_main value(1150,'인문과학','실례지만| 이 책이 시급합니다','이수은','민음사','2020','2021.1');

insert into book_main value(1146,'인문과학','컨셔스 : 내 인생을 바꾸는 힘','문성림 지음','미디어숲 ','2020','2020.12');

insert into book_main value(1145,'인문과학','오늘도 이상한 사람 때문에 힘들었습니다','정희정','꿈의지도','2020','2020.12');

insert into book_main value(1138,'인문과학','(1일 1페이지| 세상에서 가장 짧은) 교양 수업 365.인물편 ','데이비드 S. 키더| 노아 D. 오펜하임','위즈덤하우스','2020','2020.11');

insert into book_main value(1133,'인문과학','한 공기의 사랑| 아낌의 인문학','강신주','EBS Books','2020','2020.11');

insert into book_main value(1132,'인문과학','소르본 철학 수업','전진','나무의철학','2020','2020.11');






delete from book_main;

select * from book_main;

//사회과학

insert into book_main value(1167,'사회과학','뉴노멀 교양수업','필리프 비옹뒤리| 레미 노용','문예출판사','2020','2021.4');

insert into book_main value(1163,'사회과학','인크루서파이 : 통합의 기술 ','스테파니 K. 존슨','비즈니스맵','2020','2021.4');

insert into book_main value(1160,'사회과학','엘리트 세습','대니얼 마코비츠','세종','2020','2021.2');

insert into book_main value(1159,'사회과학','백년식사','주영하','휴머니스트','2020','2021.2');

insert into book_main value(1155,'사회과학','음식에도 마스크를 씌워야 하나요','임선영','마음의숲','2020','2021.1');

insert into book_main value(1152,'사회과학','지금 여기| 무탈한가요?','오찬호 ','북트리거','2020','2021.1');

insert into book_main value(1144,'사회과학','데이터 프라이버시','니혼게이자이신문 데이터경제 취재반','머스트리드북','2020','2020.12');

insert into book_main value(1140,'사회과학','시간이 멈춘 방','고지마 미유','더숲','2020','2020.12');

insert into book_main value(1139,'사회과학','차의 시간을 걷다','김세리| 조미라 ','열린세상','2020','2020.11');

insert into book_main value(1136,'사회과학','(알아두면 쓸모있는 신박한) 조직생활 가이드 ','전충렬','무한','2020','2020.11');






delete from book_main;

select * from book_main;

//문학

insert into book_main value(1166,'문학','노라와 모라','김선재','다산책방','2020','2021.4');

insert into book_main value(1162,'문학','당신에게 일시 정지를 권유합니다','김종관','혜화동','2020','2021.2');

insert into book_main value(1154,'문학','열다섯 마리 개','앙드레 알렉시스','삐삐북스','2020','2021.1');

insert into book_main value(1149,'문학','스노볼','박소영','창비','2020','2021.1');

insert into book_main value(1147,'문학','목소리를 삼킨 아이','파리누쉬 사니이','북레시피','2020','2020.12');

insert into book_main value(1141,'문학','천개의 파랑','천선란','허블','2020','2020.12');

insert into book_main value(1137,'문학','머지않아 이별입니다','나가쓰키 아마네','해냄출판사','2020','2020.11');

insert into book_main value(1131,'문학','오늘도 흔들리는 중입니다','이재영','흐름출판','2020','2020.11');

insert into book_main value(1128,'문학','당신의 4분 33초','이서수 ','은행나무','2020','2020.10');

insert into book_main value(1124,'문학','디어 에드워드','앤 나폴리타노 ','쌤앤파커스','2020','2020.10');





// 교보문고 책 추천 

delete from book_kyobo where book_type="과학";

select * from book_kyobo;

create table book_kyobo(
	book_type varchar(50) not null,
	book_title varchar(150) not null,
	book_author varchar(50) not null,
	book_publish varchar(50) not null
);

//문학

insert into book_kyobo value('문학','달러구트 꿈 백화점','이미예','북닻');

insert into book_kyobo value('문학','요리코를 위해','노리즈키 린타로 지음','모모');

insert into book_kyobo value('문학','명탐정을 위한 1분 추리','리플리 지음','위즈덤커넥트');

insert into book_kyobo value('문학','데미안','헤르만 헤세 지음','스타북스');

insert into book_kyobo value('문학','웨어하우스','롭 하트 지음','북로드');



// 자연과학

insert into book_kyobo value('자연과학','시간은 흐르지 않는다','카를로 로벨리 지음','쌤앤파커스');

insert into book_kyobo value('자연과학','알아두면 쓸모 있는 과학 잡학상식','이연호 지음','팬덤북스');

insert into book_kyobo value('자연과학','포스트 코로나 일상의 미래','과학기술정책연구원 지음','청림출판');

insert into book_kyobo value('자연과학','아내를 모자로 착각한 남자','올리버 색스 지음','알마');

insert into book_kyobo value('자연과학','로봇 시대 일자리의 미래','제이슨 솅커 지음','미디어숲');




// 인문과학

insert into book_kyobo value('인문과학','유리멘탈을 위한 심리책','미즈시마 히로코 지음','갤리온');

insert into book_kyobo value('인문과학','나는 나답게 살기로 했다','손힘찬 지음','스튜디오오드리');

insert into book_kyobo value('인문과학','알아두면 쓸 데 있는 신 잡학상식','온스토리편집부 지음','온스토리');

insert into book_kyobo value('인문과학','노화의 종말','데이비드 실클레어','부키');

insert into book_kyobo value('인문과학','나는 왜 참으려고만 할까?','이시하라 가즈코 지음','필름');




//사회과학

insert into book_kyobo value('사회과학','새로운 가난이 온다','김만권','헤다');

insert into book_kyobo value('사회과학','비트코인과 블록체인','이병욱 지음','에이콘');

insert into book_kyobo value('사회과학','주린이도 술술 읽는 친절한 주식책','최정희 지음','메이트북스');

insert into book_kyobo value('사회과학','나의 첫 투자 수업','김정환 지음','트러스트북스');

insert into book_kyobo value('사회과학','세계사 속 부의 대반전','장진현 지음','스마트북스');



// 밀리의 서제 책 추천 

delete from book_mily where book_type="과학";

select * from book_mily;

show tables;

create table book_mily(
	book_type varchar(50) not null,
	book_title varchar(150) not null,
	book_author varchar(50) not null,
	book_publish varchar(50) not null
);

//문학

insert into book_mily value('문학','땡큐파워','민진홍 지음','라온북');

insert into book_mily value('문학','엄마 일단가고봅시다!','태원준 지음','북로그컴퍼니');

insert into book_mily value('문학','달러구트 꿈 백화점','이미예','팩토리나인');

insert into book_mily value('문학','시한병동','치넨 마키토 지음','아르테');

insert into book_mily value('문학','프랙처드|삶의 균열','대니 앳킨스 지음','살림출판사');



// 자연과학

insert into book_mily value('자연과학','돈의 속성 ','김승호','스노우폭스북스');

insert into book_mily value('자연과학','플랫폼 경제와 공짜 점심','강성호 지음','미디어숲');

insert into book_mily value('자연과학','30대 맞벌이 부부의 30억 부동산 재테크','홍사장 지음','델피노');

insert into book_mily value('자연과학','부의 추월차선','엠제이 드마코','토트');

insert into book_mily value('자연과학','로봇 시대 일자리의 미래','제이슨 솅커 지음','미디어숲');




// 인문과학

insert into book_mily value('인문과학','달러구트 꿈 백화점','이미예','팩토리나인');

insert into book_mily value('인문과학','불편한 편의점','김호연','나무옆의자');

insert into book_mily value('인문과학','범인 없는 살인의 밤','히가시노 게이고 지음','알에이치코리아');

insert into book_mily value('인문과학','콜 미 바이 유어 네임','안드레 애치먼 지음','도서출판 잔');

insert into book_mily value('인문과학','너무 한낮의 연애','감금희 지음','문학동네');




//사회과학

insert into book_mily value('사회과학','땡큐파워','민진홍 지음','라온북');

insert into book_mily value('사회과학','엄마 일단가고봅시다!','태원준 지음','북로그컴퍼니');

insert into book_mily value('사회과학','달러구트 꿈 백화점','이미예','팩토리나인');

insert into book_mily value('사회과학','시한병동','치넨 마키토 지음','아르테');

insert into book_mily value('사회과학','프랙처드|삶의 균열','대니 앳킨스 지음','살림출판사');



