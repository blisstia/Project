CREATE TABLE `patent` (
  `id` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `number` varchar(64) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `country` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `abstracte` mediumtext CHARACTER SET ascii COLLATE ascii_general_ci,
  `title` mediumtext CHARACTER SET ascii COLLATE ascii_general_ci,
  `kind` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `num_claims` int DEFAULT NULL,
  `filename` varchar(120) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `withdrawn` varchar(120) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

LOAD DATA LOCAL INFILE 'Users/tia/Desktop/session2/patent_1pct.tsv'
IGNORE
INTO TABLE patent_1pct
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id,type,number,country, @date_col,abstract,title,kind,num_claims,filename,withdrawn)
set date = STR_TO_DATE(@date_col, "%Y-%m-%d");

USE uspto_course;

CREATE TABLE patent_1pct (
id varchar(20) NOT NULL,
type varchar(100) DEFAULT NULL,
number varchar(64) DEFAULT NULL,
country varchar(20) DEFAULT NULL,
date date DEFAULT NULL,
abstract mediumtext DEFAULT NULL,
title mediumtext DEFAULT NULL,
kind varchar(10) DEFAULT NULL,
num_claims int(11) DEFAULT NULL,
filename varchar(120) DEFAULT NULL,
withdrawn varchar(120) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE= InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci;

CREATE TABLE assigne_1pct(
id varchar(36) NOT NULL,
type int(4) DEFAULT NULL,
name_first varchar(64) DEFAULT NULL,
name_last varchar(64) DEFAULT NULL,
organisation varchar(256) DEFAULT NULL,
PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci;

CREATE TABLE cpc_current_1pct(
uuid varchar(36) NOT NULL,
patent_id varchar(20) DEFAULT NULL,
section_id varchar(10) DEFAULT NULL,
subsection_id varchar(20) DEFAULT NULL,
group_id varchar(20) DEFAULT NULL,
subgroup_id varchar(20) DEFAULT NULL,
category varchar(36) DEFAULT NULL,
sequence int(11) DEFAULT NULL,
PRIMARY KEY (uuid)
)ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci;

#不输入innoDB不能使用foreign key
CREATE TABLE patent_assigne_1pct(
patent_id varchar(20) NOT NULL,
assignee_id varchar(36) NOT NULL,
location_id varchar(128) NOT NULL, 
PRIMARY KEY(patent_id, assignee_id, location_id),
FOREIGN KEY(patent_id) REFERENCES patent_1pct(id),
FOREIGN KEY(assignee_id) REFERENCES assigne_1pct(id)
)ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci;

ALTER TABLE patent_assigne_1pct ADD FOREIGN KEY (patent_id) REFERENCES patent_1pct(id); 

LOAD DATA LOCAL INFILE 'Users/tia/Desktop/session2/patent_1pct.tsv'
IGNORE
INTO TABLE patent_1pct
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id,type,number,country, @date_col,abstract,title,kind,num_claims,filename,withdrawn)
set date = STR_TO_DATE(@date_col, "%Y-%m-%d");

LOAD DATA LOCAL INFILE 'Users/tia/Desktop/session2/patent_1pct.tsv'
IGNORE 
INTO TABLE assigne_1pct 
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(id, type, name_first, name_last, organisation);

LOAD DATA LOCAL INFILE 'Users/tia/Desktop/session2/patent_1pct.tsv'
IGNORE 
INTO TABLE cpc_current_1pct 
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(uuid, patent_id, section_id, subsection_id, group_id, subgroup_id, category, sequence);


CREATE TABLE patent_assigne_1pct2(
patent_id varchar(20) NOT NULL,
assignee_id varchar(36) NOT NULL,
location_id varchar(128) NOT NULL, 
PRIMARY KEY(patent_id, assignee_id, location_id)
)ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_general_ci;

LOAD DATA LOCAL INFILE 'Users/tia/Desktop/session2/patent_1pct.tsv'
IGNORE 
INTO TABLE patent_assigne_1pct
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(patent_id, assignee_id, location_id);







