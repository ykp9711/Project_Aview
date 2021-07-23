CREATE SEQUENCE SEQ_ACADEMY_BOARD;
CREATE TABLE TBL_ACADEMY_BOARD(
   ANO NUMBER(10),
   ACADEMYAREA VARCHAR2(200) NOT NULL,
   ACADEMYKIND VARCHAR2(200) NOT NULL,
   ACADEMYPHOTO VARCHAR2(200) NOT NULL,
   ACADEMYTITLE VARCHAR2(200) NOT NULL,
   ACADEMYID VARCHAR2(200) NOT NULL,
   ACADEMYNAME VARCHAR2(200) NOT NULL,
   ACADEMYCONTENT VARCHAR2(2000) NOT NULL,
   ACADEMYINTRO VARCHAR2(2000) NOT NULL,
   ACADEMYYOUTUBE VARCHAR2(200) NOT NULL,
   ACADEMYTAG VARCHAR2(200) NOT NULL
);

DROP TABLE TBL_ACADEMY_BOARD;
ALTER TABLE TBL_ACADEMY_BOARD ADD CONSTRAINT FK_ACADEMY_BOARD FOREIGN KEY (ACADEMYID) REFERENCES TBL_ACADEMY(AID);
ALTER TABLE TBL_ACADEMY_BOARD ADD CONSTRAINT PK_ACADEMY_BOARD PRIMARY KEY(ANO);
SELECT * FROM TBL_ACADEMY_BOARD;