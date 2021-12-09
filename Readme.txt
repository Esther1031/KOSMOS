[ Settings for Test ]


1. com.kosmos.common.CommonUtils (회원가입 테스트시)

	- 이미지 업로드 Path설정




2. 학생 테이블, 교사 테이블 생성

	

-- 회원(학생) 테이블
SELECT * FROM KOSMOS_MEMSTU;
DROP TABLE KOSMOS_MEMSTU;
--DELETE kosmos_memstu;

CREATE TABLE KOSMOS_MEMSTU (
                             MS_NUM          VARCHAR2(20) PRIMARY KEY
                            ,MS_ID           VARCHAR2(100)
                            ,MS_NAME         VARCHAR2(20)
                            ,MS_GEN          VARCHAR2(10)
                            ,MS_BIRTH        VARCHAR2(10)
                            ,MS_PW           VARCHAR2(20)
                            ,MS_CP           VARCHAR2(30)
                            ,MS_ZIPCODE      VARCHAR2(6)
                            ,MS_DORO         VARCHAR2(300)
                            ,MS_PHOTO        VARCHAR2(300)
                            ,MS_GRADE        VARCHAR2(10)
                            ,MS_SEMESTER     VARCHAR2(10)
                            ,MS_CLASS        VARCHAR2(2)
                            ,MS_NUMBER       VARCHAR2(2)
                            ,MS_ADMYEAR      VARCHAR2(10)           -- 년도 4자리 ex) 2021
                            ,MS_JOINYN       VARCHAR2(1)
                            ,MS_INSDATE      DATE
                            ,MS_UPDDATE      DATE
                            ,MS_DELYN        VARCHAR2(1)
                        );


INSERT INTO KOSMOS_MEMSTU (
          
                             MS_NUM         
                            ,MS_ID           
                            ,MS_NAME         
                            ,MS_GEN          
                            ,MS_BIRTH        
                            ,MS_PW           
                            ,MS_CP           
                            ,MS_ZIPCODE      
                            ,MS_DORO         
                            ,MS_PHOTO        
                            ,MS_GRADE        
                            ,MS_SEMESTER     
                            ,MS_CLASS        
                            ,MS_NUMBER       
                            ,MS_ADMYEAR      
                            ,MS_JOINYN       
                            ,MS_INSDATE      
                            ,MS_UPDDATE      
                            ,MS_DELYN        
          
            ) VALUES (

                             '202111260001'                         -- 채번 로직을 따른다.(임시로 테스트 진행)
                             ,'accelerator@kakao.com'               -- 아이디는 이메일주소의 형태.
                             ,'김찬기'                               -- ex)홍길동
                             ,'02'                                  -- 01 : 여자, 02 : 남자
                             ,'19881215'                            -- 1945년01월01일 형태 숫자연결
                             ,'111111'                              -- 8자리 (영문?)
                             ,'01074101900'                         -- 11자리 숫자
                             ,'08110'                               -- 5자리 숫자
                             ,'서울시 양천구 신정로170'                -- API활용 : 도로명 주소
                             ,'lion'                                -- 사진 (이름으로 테스트 진행)
                             ,'2'                                   -- 학생의 학년
                             ,'1'                                   -- 학생의 학기
                             ,'8'                                   -- 학생의 반    
                             ,'24'                                  -- 학생의 번호
                             ,'2021'                                -- 입학년도
                             ,'Y'                                   -- (임시로 'Y'생성 후 테스트 진행)
                             ,SYSDATE                               -- 등록일 : 현재 일시
                             ,SYSDATE                               -- 수정일 : 수정 당시 일시
                             ,'Y'                                   -- 삭제여부 : 데이터존재 'Y', 없으면 'N'
            );
            
            
            
-- 회원(선생) 테이블
SELECT * FROM KOSMOS_MEMTEA;
DROP TABLE KOSMOS_MEMTEA;
COMMIT;

CREATE TABLE KOSMOS_MEMTEA (
                             MT_NUM          VARCHAR2(20)       PRIMARY KEY
                            ,MT_ID           VARCHAR2(100)
                            ,MT_NAME         VARCHAR2(20)
                            ,MT_GEN          VARCHAR2(10)
                            ,MT_BIRTH        VARCHAR2(10)
                            ,MT_PW           VARCHAR2(20)
                            ,MT_CP           VARCHAR2(30)
                            ,MT_ZIPCODE      VARCHAR2(6)
                            ,MT_DORO         VARCHAR2(300)
                            ,MT_PHOTO        VARCHAR2(300)
                            ,SB_NUM          VARCHAR2(10) 
                            ,MT_INSDATE      DATE
                            ,MT_UPDDATE      DATE
                            ,MT_DELYN        VARCHAR2(1)
                        );


INSERT INTO KOSMOS_MEMTEA (
                             MT_NUM          
                            ,MT_ID           
                            ,MT_NAME         
                            ,MT_GEN          
                            ,MT_BIRTH        
                            ,MT_PW           
                            ,MT_CP           
                            ,MT_ZIPCODE      
                            ,MT_DORO         
                            ,MT_PHOTO        
                            ,SB_NUM         
                            ,MT_INSDATE     
                            ,MT_UPDDATE      
                            ,MT_DELYN        
            ) VALUES (

                             '202111260001'          
                            ,'accelerator@kakao.com'        
                            ,'김찬기'
                            ,'02'
                            ,'19881215'
                            ,'111111'
                            ,'01074101900'
                            ,'08110'
                            ,'서울시 양천구 신정로170'
                            ,'lion'
                            ,'001'
                            ,SYSDATE
                            ,SYSDATE      
                            ,'Y' 
            );
            
COMMIT;





3. 수강신청 테이블 생성



--솔잎 수강신청파트

--KOSMOS_SUBJECT1 테이블 생성하고 데이터 넣고 (74건)
--KOSMOS_SUGANG 테이블 생성하고 데이터 없는채로 
--INDEX.JSP 실행하면 문제없이 실행 되어야 함

-- [선행] KOSMOS_SUBJECT1 테이블 + 74건 과목데이터
-- 1) Index.jsp 실행 > 로그인
-- 2) 로그인 한 학생에 대해 학년 불러옴 (학년값이 세션에 없어서 강제로 2학년으로 넣는중) 
-- 3) 조건 (2학년+선수과목들)에 따른 수강 신청할 수 있는 과목들만 KOSMOS_SUBJECT1에서 불러옴
-- 4) DELYN = N으로 KOSMOS_SUGANGLIST 에 저장 > 수강신청 하는 기본이 되는 테이블과 값
-- 5) 클릭할 때 마다 단일과목에 대해 UPDATE문으로 DELYN = Y로 바꿈 (+ 단일 과목이 포함된 대과목에서 다른 단일 과목들은 N으로 바꿔줌)
-- 6) 수강신청 후 페이지를 벗어날 때 KOSMOS_OLDSUGANG에 값들 저장 (수강신청 완료한 테이블 > 시간표) 



--KOSMOS_SUBJECT1 : 과목정보 들어가는 테이블 : 데이터 74건 입력해야함 다른 INSERT파일 참고


CREATE TABLE KOSMOS_SUBJECT1 (
    SB_NUM VARCHAR2(20),        -- 과목번호     --NOT NULL PRIMARY KEY,     
    SB_GROUP VARCHAR2(2),       -- 교과군번호
    SB_CODE VARCHAR2(3),        -- 과목코드
    SB_TYPE VARCHAR2(20),       -- 과목유형
    SB_NAME VARCHAR2(50),       --과목명        -- 과목명 작아서 수정 10 > 30 > 50
    SB_CREDITUNIT VARCHAR2(1),  -- 이수단위
    SB_GRADE VARCHAR2(10),      -- 대상학년     **크기 변경 -솔잎
    SB_YEAR VARCHAR2(10),       -- 개설년도     **새로추가 2021 고정 -솔잎
    SB_SEMESTER VARCHAR2(10),   -- 개설학기     **크기 변경 1 > 10 -솔잎
    SB_TEACHER VARCHAR2(20),    -- 담당교사     --이름값 작아서 수정했어요.
    SB_MAXSTU VARCHAR2(2),      -- 정원        
    SB_DAY VARCHAR2(15),        -- 수업요일
    SB_TIME NUMBER(5),          -- 수업교시     **넘버는 자릿수 2 > 5 변경  -솔잎
    SB_TIMETABLE NUMBER(5),     -- 수업교시     **추가 시간표용 -솔잎
    SB_BEFOREYN VARCHAR2(1),    -- 선수과목유무
    SB_BEFORENAME VARCHAR2(50), -- 선수과목명   **크기 변경 10 > 50 (과목명 크기로) -솔잎
    SB_INSDATE DATE,            -- 등록일
    SB_UPDDATE DATE,            -- 수정일
    SB_DELYN VARCHAR2(1)        -- 삭제여부
);


--조회
SELECT * FROM KOSMOS_SUBJECT1;

--삭제용
DROP TABLE KOSMOS_SUGANGLIST;

--데이터 Y인 과목만 선택해서 보기
SELECT * FROM KOSMOS_SUGANG WHERE SL_DELYN='Y';


-------------------------------------------------------------------
--Ctrl+A 눌러서 전체 선택 후
--Ctrl+Enter 눌러서 입력하세요.
--마지막 SELECT 문으로 74건 들어가는지 확인하세요!


--[국어 교과군]

--국어
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '', '01', '01'
    ,'필수', '국어', '3'
    ,'1' ,'2021', '전학기' , '유재석'
    ,'30', '월화수목','36619'
    ,'36619'                        --시간표용
    ,'N', '' 
    ,SYSDATE, SYSDATE, 'Y');

--문학    
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '','01','02'
    ,'선택','문학','3'
    ,'2','2021','1학기','박명수'
    ,'30','월화수목','36619'
    ,'36619'                        --시간표용
    ,'N', ''
    ,SYSDATE, SYSDATE,'Y');

-- 언어와 매체1 
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '', '01', '03'
    ,'선택', '언어와 매체1', '3'
    ,'2','2021','2학기','김종국'
    ,'30', '월화수목', '36619'
    ,'36619'                        --시간표용
    ,'N', ''
    ,SYSDATE, SYSDATE, 'Y');

--언어와 매체2 **이름 띄어쓰기 추가, 2학년 언어와 매체 선수과목으로 선택
--이거 할 때 년도로 탈락시키면 안됌 잘생각할것
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '', '01', '04'
    ,'선택', '언어와 매체2', '3'
    ,'3', '2021', '전학기', '이광수'
    ,'30', '월화수목', '36619'
    ,'36619'                        --시간표용
    ,'Y', '언어와 매체1'
    ,SYSDATE, SYSDATE, 'Y');

--독서    
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '', '01', '05'
    ,'선택', '독서', '3'
    ,'3', '2021', '전학기', '송지효'
    ,'30', '월화수목', '36619'
    ,'36619'                        --시간표용
    ,'N', ''
    ,SYSDATE, SYSDATE, 'Y');
 
--화법 작문   
INSERT INTO KOSMOS_SUBJECT1 
    VALUES (
	 '', '01', '06'
    ,'선택', '화법 작문', '3'
    ,'3', '2021', '전학기', '노홍철'
    ,'30', '월화수목', '36619'
    ,'36619'                        --시간표용
    ,'N', ''
    ,SYSDATE, SYSDATE, 'Y');


--심화 국어
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	 '', '01', '07'
    ,'선택', '심화 국어1', '3'
    ,'2', '2021', '전학기', '이진기'
    ,'30', '월화수목', '36619'
    ,'36619'                        --시간표용    
    ,'N', ''                        --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정

--심화 국어 
INSERT INTO KOSMOS_SUBJECT1 VALUES (
     '','01','08'
    ,'선택', '심화 국어2' ,'3'
    ,'3', '2021', '전학기', '김종현'
    ,'25', '월화수목', '36619'
    ,'36619'                        --시간표용
	,'Y', '심화 국어1'               --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정
    

--고전읽기
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','01', '09'
    ,'선택', '고전읽기', '3'
    ,'3', '2021', '전학기', '김기범'
    ,'20', '월화수목', '36619'
    ,'36619'                        --시간표용
	,'N', ''                        --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정


-------------------------------------------------------------------
--[수학 교과군]

--수학
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'', '02', '01'
    ,'필수', '수학', '3'
	,'1', '2021', '전학기', '최민호'
    ,'30', '월화수목', '62369'
    ,'62369'                        --시간표용
    ,'N', ''                        --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정

--수학1
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'', '02', '02'
    ,'선택', '수학1', '3'
    ,'2', '2021', '1학기', '이태민'
    ,'25', '월화수목', '62369'
    ,'62369'                        --시간표용
    ,'N', ''                        --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정

--수학2
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'', '02', '03'
    ,'선택', '수학2', '3'
    ,'2', '2021', '2학기', '방민수'
    ,'20', '월화수목', '62369'
    ,'62369'                        --시간표용
    ,'Y', '수학1'                   --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정

--기하
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','02','04'
    ,'선택','기하','3'
    ,'2','2021','전학기','이찬희'
    ,'30', '월화수목', '62369'
    ,'62369'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--미적분
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','02','05'
    ,'선택','미적분','3'
    ,'3','2021','전학기','이병헌'
    ,'25','월화수목','62369'
    ,'62369'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--확률과 통계
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','02','06'
    ,'선택','확률과 통계','3'
    ,'3','2021','전학기','안다니엘'
    ,'20','월화수목','62369'
    ,'62369'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--심화 수학
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','02','07'
    ,'선택','심화 수학','3'
    ,'3','2021','전학기','전소민'
    ,'20','월화수목','62369'
    ,'62369'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정




-------------------------------------------------------------------
--[영어 교과군]


--영어
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','03','01'
    ,'필수','영어','3'
    ,'1','2021','전학기','유창현'
    ,'30','화수목금','91471'
    ,'91471'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

-- 영어1
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','03','02'
    ,'선택','영어1','3'
    ,'2','2021','1학기','김사랑'
    ,'25','화수목금','91471'
    ,'91471'                        --시간표용
    ,'N','',     -- 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
-- 심화 영어1
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','03','03'
    ,'선택','심화 영어','3'
    ,'2','2021','전학기','김사랑'
    ,'25','화수목금','91471'
    ,'91471'                        --시간표용
    ,'N','',     -- 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

-- 영어 독해와 작문
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','03','04'
    ,'선택','영어 독해와 작문','3'
    ,'2','2021','2학기','김사랑'
    ,'25','화수목금','91471'
    ,'91471'                        --시간표용
    ,'N','',
	SYSDATE, SYSDATE, 'Y'); --고정    

-- 영어2
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','03','05'
    ,'선택','영어2','3'
    ,'3','2021','전학기','김사랑'
    ,'25','화수목금','91471'
    ,'91471'                        --시간표용
    ,'Y','영어1',
	SYSDATE, SYSDATE, 'Y'); --고정

-- 심화 영어 독해
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','03','06'
    ,'선택','심화 영어 독해','3'
    ,'3','2021','전학기','김사랑'
    ,'25','화수목금','91471'
    ,'91471'                        --시간표용
    ,'N','',
	SYSDATE, SYSDATE, 'Y'); --고정

-------------------------------------------------------------------
--[한국사 교과군]


-- 한국사
INSERT INTO KOSMOS_SUBJECT1 
VALUES (
	'','04','01',
    '필수','한국사','3'
    ,'1','2021','전학기','김도식'
    ,'25','월목','59959'
    ,'59959'                        --시간표용
    ,'N','',
	SYSDATE, SYSDATE, 'Y'); --고정

-------------------------------------------------------------------
--[사회 교과군]

--통합사회
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','01'
    ,'필수','통합사회','3'
    ,'1','2021','전학기','서은광'
    ,'30','수목','99539'
    ,'99539'                        --시간표용
	,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--세계지리
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','02'
    ,'선택','세계 지리','3'
    ,'2','2021','전학기','이민혁'
    ,'25', '', ''
    ,'99999'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--세계사
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','03'
    ,'선택','세계사','3'
    ,'2','2021','전학기','이창섭'
    ,'20', '', ''
    ,'99999'                        --시간표용
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--정치와 법
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','04'
    ,'선택','정치와 법','3'
    ,'2','2021','전학기','임현식'
    ,'30', '', ''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--윤리와 사상
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','05'
    ,'선택','윤리와 사상','3'
    ,'2','2021','전학기','신동근'
    ,'25', '', ''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--사회 문제 탐구
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','06', 
    '선택','사회 문제 탐구','3'
    ,'2','2021','전학기','정일훈'
    ,'20', '', ''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--한국지리
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','07'
    ,'선택','한국 지리','3'
    ,'3','2021','전학기','육성재'
    ,'30', '', ''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--동아시아사
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','08'
    ,'선택','동아시아사','3'
    ,'3','2021','전학기','방용국'
    ,'25','',''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--경제
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','09'
    ,'선택','경제','3'
    ,'3','2021','전학기','김힘찬'
    ,'20','',''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--사회문화
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','10'
    ,'선택','사회 문화','3'
    ,'3','2021','전학기','정대현'
    ,'30','', ''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--생활과 윤리
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','11'
    ,'선택','생활과 윤리','3'
    ,'3','2021','전학기','유영재'
    ,'25','',''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--여행지리
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','05','12'
    ,'선택','여행 지리','3'
    ,'3','2021','전학기','문종업'
    ,'20','',''
    ,'99999'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정



-------------------------------------------------------------------
--[과학 교과군]

--통합과학
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','06','01'
    ,'필수','통합과학','3'
    ,'1','2021','전학기','최준홍'
    ,'30','월수금','19294'
    ,'19294'                        --시간표용    
    ,'N','' --선수과목유무, 선수과목명 
	,SYSDATE, SYSDATE, 'Y'); --고정

--과학탐구실험
INSERT INTO KOSMOS_SUBJECT1 VALUES (
    '','06','02'
    ,'필수','과학탐구실험','3'
    ,'1','2021','전학기','남태희'
    ,'25','목','99929'
    ,'99929'                        --시간표용    
    ,'N','' --선수과목유무, 선수과목명 
    ,SYSDATE, SYSDATE, 'Y'); --고정

--지구과학
INSERT INTO KOSMOS_SUBJECT1 VALUES (
    '','06','03'
    ,'선택','지구과학','3'
    ,'2','2021','전학기','이강인'
    ,'25', '', ''
    ,'99999'                        --시간표용    
    ,'N','' --선수과목유무, 선수과목명 
    ,SYSDATE, SYSDATE, 'Y'); --고정

--물리학1
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','04'
   ,'선택','물리학1','3'
   ,'2','2021','전학기','이근호'
   ,'25', '', ''
    ,'99999'                        --시간표용    
   ,'N','', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--화학1
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','05'
   ,'선택','화학1','3'
   ,'2','2021','전학기','차두리'
   ,'25', '', ''
    ,'99999'                        --시간표용    
   ,'N','', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--생명과학1
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','06'
   ,'선택','생명과학1','3'
   ,'2','2021','전학기','이청용'
   ,'25','',''
    ,'99999'                        --시간표용    
   ,'N','', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--물리학2
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','07'
   ,'선택','물리학2','3'
   ,'3','2021','전학기','지동원'
   ,'25','',''
    ,'99999'                        --시간표용    
   ,'Y','물리학1', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--생명과학2
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','08'
   ,'선택','생명과학2','3'
   ,'3','2021','전학기','박주영'
   ,'25','',''
    ,'99999'                        --시간표용    
   ,'Y','생명과학1', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--화학2
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','09'
   ,'선택','화학2','3'
   ,'3','2021','전학기','김민재'
   ,'25','',''
    ,'99999'                        --시간표용    
   ,'Y','화학1', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--생활과 과학
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','06','10'
   ,'선택','생활과 과학','3'
   ,'3','2021','전학기','손흥민'
   ,'25','',''
    ,'99999'                        --시간표용    
   ,'N','', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

-------------------------------------------------------------------
--[체육/예술 교과군]에서
--[체육 교과군] 으로 변경 (예술 교과군 분리)

--스포츠 생활
INSERT INTO KOSMOS_SUBJECT1 VALUES (
   '','07','01'
   ,'필수','스포츠 생활','2'
   ,'1','2021','전학기','정우영'
   ,'20','월화금','45992'
    ,'45992'                        --시간표용    
   ,'N','', --선수과목유무, 선수과목명 
   SYSDATE, SYSDATE, 'Y'); --고정

--체육
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','07','02'
    ,'선택','체육','2'
    ,'2','2021','전학기','김희철'
    ,'20','월화금','45992'
    ,'45992'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정

--체육   
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','07','03'
    ,'선택','체육','2'
    ,'3','2021','전학기','김종운'
    ,'20','월화금','45992'
    ,'45992'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정  

--체육
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','07','04'
    ,'선택','운동과 건강','2'
    ,'2','2021','전학기','김영운'
    ,'20','월화금','45992'
    ,'45992'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정    

--체육 추가*******
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','07','05'
    ,'선택','운동과 건강','2'
    ,'3','2021','전학기','김연아'
    ,'20','월화금','45992'
    ,'45992'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정 

-------------------------------------------------------------------
--[예술 교과군] 08

INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','06'
    ,'필수','음악','2'
    ,'1','2021','전학기','신동희'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정  

INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','07'
    ,'선택','음악 감상과 비평','2'
    ,'3','2021','전학기','이성민'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정  

INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','08'
    ,'선택','미술','2'
    ,'2','2021','전학기','이혁재'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정  
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','09'
    ,'선택','미술 이론','2'
    ,'2','2021','전학기','최시원'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','10'
    ,'선택','미술 감상과 비평','2'
    ,'3','2021','전학기','이동해'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
   
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','08','11'
    ,'선택','미술사','2'
    ,'3','2021','전학기','김려욱'
    ,'20','월화목','27949'
    ,'27949'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
 
-------------------------------------------------------------------
--[생활/교양 교과군] 도 나눔
--[교양 교과군] : 09   
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','01'
    ,'필수','한문1','2'
    ,'1','2021','전학기','조규현'
    ,'20','화수','93199'
    ,'93199'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','02'
    ,'선택','일본어1','2'
    ,'2','2021','전학기','김민준'
    ,'20','화수','93199'
    ,'93199'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','03'
    ,'선택','중국어1','2'
    ,'2','2021','전학기','닉쿤'
    ,'20','화수','93199'
    ,'93199'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','04'
    ,'선택','한문2','2'
    ,'3','2021','전학기','옥택연'
    ,'20','화수','93199'
    ,'93199'                        --시간표용    
    ,'Y','한문1', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','05'
    ,'선택','일본어2','2'
    ,'2','2021','2학기','강다니엘'
    ,'20','화수', '93199'
    ,'93199'                        --시간표용    
    ,'Y','일본어1', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','09','06'
    ,'선택','중국어2','2'
    ,'2','2021','2학기','임창균'
    ,'20','화수','93199'
    ,'93199'                        --시간표용    
    ,'Y','중국어1', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
-------------------------------------------------------------------
--[생활 교과군] : 10   

	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','07'
    ,'선택','정보','2'
    ,'2','2021','전학기','이주헌'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','08'
    ,'선택','정보','2'
	,'3','2021','전학기','채형원'
    ,'20', '금금', '99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','09'
    ,'필수','철학','2'
    ,'1','2021','전학기','유기현'
    ,'20', '금금', '99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','10'
    ,'선택','철학','2'
    ,'2','2021','전학기','이민혁'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
    INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','11'
    ,'선택','철학','2'
    ,'3','2021','전학기','황찬성'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','12'
    ,'선택','환경','2'
    ,'2','2021','전학기','신호석'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
    INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','13'
    ,'선택','환경','2'
    ,'3','2021','전학기','초아'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','14'
    ,'선택','논술','2'
    ,'2','2021','전학기','손현우'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
	,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','10','15'
    ,'선택','논술','2'
	,'3','2021','전학기','김혜수'
    ,'20','금금','99996'
    ,'99996'                        --시간표용    
	,'N','', --선수과목유무, 선수과목명
	SYSDATE, SYSDATE, 'Y'); --고정
    
 -----------------------------------------------------
 --[진로 따로 뺌]
 
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','11','16'
    ,'필수','진로','2'
	,'1','2021','전학기','최한솔'
    ,'20','화금','94993'
    ,'94993'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
	
    INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','11','17'
    ,'필수','진로','2'
    ,'2','2021','전학기','부승관'
    ,'20','화금','94993'
    ,'94993'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명 
	SYSDATE, SYSDATE, 'Y'); --고정
    
	INSERT INTO KOSMOS_SUBJECT1 VALUES (
	'','11','18'
    ,'필수','진로','2'
    ,'3','2021','전학기','전지현'
    ,'20','화금','94993'
    ,'94993'                        --시간표용    
    ,'N','', --선수과목유무, 선수과목명
	SYSDATE, SYSDATE, 'Y'); --고정



COMMIT;

SELECT * FROM KOSMOS_SUBJECT1;

-- 총 74건 








--KOSMOS_SUGANGLIST 장바구니처럼 데이터 넣고 빼고 사용하는 테이블 : 빈 상태가 디폴트

CREATE TABLE KOSMOS_SUGANGLIST (
     SL_NUM VARCHAR2(10)
    ,MS_NUM VARCHAR2(20)
    ,SB_GROUP VARCHAR2(3) --추가 과목코드
    ,SB_NAME VARCHAR2(50) --추가
    ,SB_GRADE VARCHAR2(10) --추가  
    ,SB_CREDITUNIT VARCHAR2(1) --이름/크기 통일
    ,SB_DAY VARCHAR2 (15)
    ,SB_TIMETABLE NUMBER(5) --수옥이테이블따라 변경
    ,SB_BEFOREYN VARCHAR2(1)    -- 선수과목유무 ******추가!!
    ,SB_BEFORENAME VARCHAR2(50)
    ,SB_MAXSTU NUMBER(2) --추가 **** NUMBER로 바꿈
    ,SL_INSDATE DATE
    ,SL_UPDATE DATE
    ,SL_DELYN VARCHAR2 (1)
);



--조회
SELECT * FROM KOSMOS_SUBJECT1;
SELECT * FROM KOSMOS_SUGANGLIST;
--삭제용
DROP TABLE KOSMOS_SUGANGLIST;

--데이터 Y인 과목만 선택해서 보기
SELECT * FROM KOSMOS_SUGANG WHERE SL_DELYN='Y';


	



4. 시간표 테이블 생성 및 데이터 삽입



	테이블 생성
	CREATE TABLE KOSMOS_OLDSUGANG (
									     SL_NUM VARCHAR2(10)
									    ,MS_NUM VARCHAR2(20)
									    ,SB_GROUP VARCHAR2(3) 
									    ,SB_NAME VARCHAR2(50) 
									    ,SB_GRADE VARCHAR2(10) 		
									    ,SB_CREDITUNIT VARCHAR2(1)
									    ,SB_DAY VARCHAR2 (15)
									    ,SB_TIMETABLE NUMBER(5) 
									    ,SB_BEFOREYN VARCHAR2(1)    
									    ,SB_BEFORENAME VARCHAR2(50) 
									    ,SB_MAXSTU NUMBER(2) 
									    ,SL_INSDATE DATE
									    ,SL_UPDATE DATE
									    ,SL_DELYN VARCHAR2 (1)
									);

	데이터 세팅 정보
	
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','01','국어','1','3','월화수목', '62369','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','02','수학','1','3','월화수목', '91475','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','03','영어','1','3','월화수목', '59951','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','04','한국사','1','3','월화수목', '99539','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','05','통합사회','1','3','월화수목', '19294','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','06','통합과학','1','3','월화수목', '99929','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','06','과학탐구실험','1','3','월화수목', '45992','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','07','스포츠 생활','1','3','월화수목', '27949','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','08','음악','1','2','월화수목', '93199','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','09','한문1','1','2','월화수목', '99996','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','10','철학','1','2','월화수목', '94993','N','','30',SYSDATE,SYSDATE,'Y');
	INSERT INTO KOSMOS_OLDSUGANG VALUES ('번호','202111260001','11','진로','1','2','월화수목', '36619','N','','30',SYSDATE,SYSDATE,'Y');





=> 로그인 CSS적용, 마이페이지 회원 테이블 수정사항 적용, 회원가입 테스트완료


