set hive.mapred.mode=nonstrict;
SET hive.vectorized.execution.enabled=true;
set hive.fetch.task.conversion=none;

DROP TABLE IF EXISTS DECIMAL_4_1_n0;
DROP TABLE IF EXISTS DECIMAL_4_2_n0;

CREATE TABLE DECIMAL_4_1_n0(key decimal(35,25), value int) 
ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

CREATE TABLE DECIMAL_4_2_n0(key decimal(35,25), value decimal(35,25)) 
STORED AS ORC;

LOAD DATA LOCAL INPATH '../../data/files/kv7.txt' INTO TABLE DECIMAL_4_1_n0;

INSERT OVERWRITE TABLE DECIMAL_4_2_n0 SELECT key, key * 3 FROM DECIMAL_4_1_n0;

SELECT * FROM DECIMAL_4_1_n0 ORDER BY key, value;

SELECT * FROM DECIMAL_4_2_n0 ORDER BY key, value;

SELECT * FROM DECIMAL_4_2_n0 ORDER BY key;

SELECT * FROM DECIMAL_4_2_n0 ORDER BY key, value;

DROP TABLE DECIMAL_4_1_n0;
DROP TABLE DECIMAL_4_2_n0;