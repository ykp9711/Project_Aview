CREATE SEQUENCE SEQ_ACADEMY_BOARD;
CREATE TABLE TBL_ACADEMY_BOARD(
   ANO NUMBER(10),
   ACADEMYAREA VARCHAR2(200),
   ACADEMYKIND VARCHAR2(200),
   ACADEMYPHOTO VARCHAR2(200),
   ACADEMYTITLE VARCHAR2(200),
   ACADEMYID VARCHAR2(200),
   ACADEMYNAME VARCHAR2(200),
   ACADEMYCONTENT VARCHAR2(2000),
   ACADEMYINTRO VARCHAR2(2000),
   ACADEMYYOUTUBE VARCHAR2(200) ,
   ACADEMYTAG VARCHAR2(200),
   ACADEMYMAPPHOTO VARCHAR2(200),
   ACAZIPCODE VARCHAR2(200),
   ACAADDRESS VARCHAR2(200),
   ACAADDRESSDETAIL VARCHAR2(200),
   REGDATE DATE DEFAULT SYSDATE
);

DROP TABLE TBL_ACADEMY_BOARD;
ALTER TABLE TBL_ACADEMY_BOARD ADD CONSTRAINT FK_ACADEMY_BOARD FOREIGN KEY (ACADEMYID) REFERENCES TBL_ACADEMY(AID) ON DELETE CASCADE;
ALTER TABLE TBL_ACADEMY_BOARD ADD CONSTRAINT PK_ACADEMY_BOARD PRIMARY KEY(ANO);
SELECT * FROM TBL_ACADEMY_BOARD;
DELETE FROM TBL_ACADEMY_BOARD;

INSERT INTO TBL_ACADEMY_BOARD (ANO, ACADEMYAREA, ACADEMYKIND, ACADEMYPHOTO, ACADEMYTITLE, ACADEMYID, ACADEMYCONTENT, ACADEMYNAME, ACADEMYINTRO, ACADEMYYOUTUBE, ACADEMYTAG) 
(SELECT  SEQ_ACADEMY_BOARD.NEXTVAL,  ACADEMYAREA, ACADEMYKIND, ACADEMYPHOTO, ACADEMYTITLE, ACADEMYID, ACADEMYCONTENT, ACADEMYNAME, ACADEMYINTRO, ACADEMYYOUTUBE, ACADEMYTAG FROM TBL_ACADEMY_BOARD);

SELECT SEQ_ACADEMY_BOARD.NEXTVAL FROM DUAL;
-----------�븰�썝媛뺤궗------------
CREATE SEQUENCE SEQ_TEACHER;
DROP TABLE TBL_TEACHER;
SELECT * FROM TBL_TEACHER;
CREATE TABLE TBL_TEACHER(
	ANO NUMBER,
	NAME VARCHAR2(200),
	GENDER VARCHAR2(200),
	PHOTO VARCHAR2(200),
	INTRO VARCHAR2(2000)
);
DROP TABLE TBL_TEACHER;
ALTER TABLE TBL_TEACHER ADD CONSTRAINT FK_TEACHER FOREIGN KEY(ANO) REFERENCES TBL_ACADEMY_BOARD(ANO) ON DELETE CASCADE;
SELECT * FROM TBL_TEACHER;


-------- �븰�썝 �떆�꽕臾� ----------
CREATE TABLE TBL_ACADEMY_PHOTO(
	ANO NUMBER,
	PHOTO VARCHAR2(1000)
);
ALTER TABLE TBL_ACADEMY_PHOTO ADD CONSTRAINT PK_ACADEMY_PHOTO FOREIGN KEY (ANO) REFERENCES TBL_ACADEMY_BOARD(ANO) ON DELETE CASCADE;
DROP TABLE TBL_ACADEMY_PHOTO;
SELECT * FROM TBL_ACADEMY_PHOTO;
DELETE FROM TBL_ACADEMY_PHOTO;

INSERT INTO TBL_ACADEMY_PHOTO VALUES(75,123);

CREATE TABLE TBL_ACADEMY_REVIEW(
   ANO NUMBER,
   RNO NUMBER PRIMARY KEY, 
   WRITER VARCHAR2(200),
   CONTENT VARCHAR2(2000),
   REGDATE DATE DEFAULT SYSDATE
);
DROP TABLE TBL_ACADEMY_REVIEW;

ALTER TABLE TBL_ACADEMY_REVIEW ADD CONSTRAINT FK_ACADEMY_REVIEW FOREIGN KEY (ANO) REFERENCES TBL_ACADEMY_BOARD(ANO);



SELECT * FROM TBL_ACADEMY_REVIEW;
SELECT * FROM TBL_ACADEMY_REIVEW WHERE WIRTER = "테스트리뷰";
CREATE SEQUENCE SEQ_ACADEMY_REVIEW;

----------리뷰 작성 테스트-----------
INSERT INTO TBL_ACADEMY_REVIEW(ANO, RNO, WRITER, CONTENT)
    VALUES(136, SEQ_ACADEMY_REVIEW.nextval, '육정근', '리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰2');
    
   
----------------댓글-----------------
CREATE TABLE COMMENT (
	C_CODE NUMBER,
	B_CODE NUMBER,
	COMMENTS VARCHAR2(100),
	WRITER VARCHAR2(50),
	REGDATE DATE DEFAULT SYSDATE
);

ALTER TABLE COMMENT ADD CONSTRAINT 
