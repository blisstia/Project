
CREATE TABLE `ex1_students` (
  `student_ID` int NOT NULL COMMENT 'This is our primary key',
  `surname` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ex1_session` (
  `session_ID` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `Date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`session_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `ex1_participe` (
  `student_ID` int NOT NULL,
  `session_ID` int NOT NULL,
  PRIMARY KEY (`session_ID`,`student_ID`),
  KEY `student_ID_idx` (`student_ID`),
  KEY `session_ID_idx` (`session_ID`),
  CONSTRAINT `session_ID` FOREIGN KEY (`session_ID`) REFERENCES `ex1_session` (`session_ID`),
  CONSTRAINT `student_ID` FOREIGN KEY (`student_ID`) REFERENCES `ex1_students` (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 USE our_course;

INSERT INTO ex1_session (session_ID, title, Date) VALUES(1, "Setup database", '2021-03-22');
INSERT INTO ex1_session (session_ID, title, Date) VALUES(2, "SQL on database", '2021-03-25');
INSERT INTO ex1_session (session_ID, title, Date) VALUES(3, "Connect R", '2021-03-29');

INSERT INTO ex1_students (student_ID, surname, Name) VALUES(1010,"Smith","Tony");
INSERT INTO ex1_students (student_ID, surname, Name) VALUES(2010,"Miller","Jennifer");
INSERT INTO ex1_students (student_ID, surname, Name) VALUES(3010,"Adams","Lucy");

INSERT INTO ex1_participe (session_ID, student_ID) VALUES(1, 1010);
INSERT INTO ex1_participe (session_ID, student_ID) VALUES(1, 2010);
INSERT INTO ex1_participe (session_ID, student_ID) VALUES(1, 3010);
INSERT INTO ex1_participe (session_ID, student_ID) VALUES(2, 1010);
INSERT INTO ex1_participe (session_ID, student_ID) VALUES(2, 2010);
INSERT INTO ex1_participe (session_ID, student_ID) VALUES(3, 1010);

  UPDATE Student SET Name = "Antonia" WHERE ID=1010;
  
   UPDATE Student
   SET Name = "Antonia" 
   WHERE ID=1010;


