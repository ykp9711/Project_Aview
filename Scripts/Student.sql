CREATE SEQUENCE SEQ_STUDENT;

CREATE SEQUENCE SEQ_STUDENT;


CREATE TABLE TBL_STUDENT(
   SID VARCHAR2(200) NOT NULL,
   SPWD VARCHAR2(200) NOT NULL,
   SPWDQ VARCHAR2(200) NOT NULL,
   SPWDA VARCHAR2(200) NOT NULL,
   SLASTNAME VARCHAR2(100) NOT NULL,
   SFIRSTNAME VARCHAR2(100) NOT NULL,
   SEMAIL VARCHAR2(200) NOT NULL,
   SBIRTH VARCHAR2(300) NOT NULL,
   SPHONE VARCHAR2(100) NOT NULL,   
   SZIPCODE VARCHAR2(1000) NOT NULL,
   SADDRESS VARCHAR2(1000) NOT NULL,
   SADDRESSDETAIL VARCHAR2(1000) NOT NULL,
   CHECKACADEMY NUMBER(10) DEFAULT 0
);
DROP TABLE TBL_STUDENT ;
ALTER TABLE TBL_STUDENT ADD CONSTRAINT PK_STUDENT PRIMARY KEY(SID);
SELECT * FROM TBL_STUDENT;

