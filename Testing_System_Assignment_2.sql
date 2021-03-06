DROP DATABASE IF EXISTS Exam_Management;

CREATE DATABASE IF NOT EXISTS Exam_Management;
USE Exam_Management;

-- Table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName		VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Table 2: Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName		ENUM('Dev','Test','Scrum Master','PM') NOT NULL
);

-- Table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email				VARCHAR(50) NOT NULL UNIQUE KEY,
    Username			VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName			NVARCHAR(50) NOT NULL,
    DepartmentID		TINYINT UNSIGNED NOT NULL,
    PositionID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- Table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName			VARCHAR(50) NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- Table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
	GroupID				TINYINT UNSIGNED NOT NULL,
    AccountID			TINYINT UNSIGNED NOT NULL,
    JoinDate			DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
	FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

-- Table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName			ENUM ('Essay','Multiple-Choice') NOT NULL
);

-- Table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName		VARCHAR(50) NOT NULL
);

-- Table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
	QuestionID			TINYINT UNSIGNED AUTO_INCREMENT,
    Content				TEXT NOT NULL,
    CategoryID			TINYINT UNSIGNED NOT NULL,
    TypeID				TINYINT UNSIGNED NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    PRIMARY KEY (QuestionID,CategoryID,TypeID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- Table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
	AnswerID			SMALLINT UNSIGNED AUTO_INCREMENT,
    Content				VARCHAR(50) NOT NULL,
    QuestionID			TINYINT UNSIGNED NOT NULL,
    isCorrect			BOOLEAN,
    PRIMARY KEY (AnswerID,QuestionID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- Table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`				VARCHAR(50) NOT NULL,
    Title				NVARCHAR(50) NOT NULL,
    CategoryID			TINYINT UNSIGNED NOT NULL,
    Duration			TINYINT UNSIGNED NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
   --  (ExamID,CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

-- Table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
	ExamID				TINYINT UNSIGNED NOT NULL,
    QuestionID			TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (ExamID,QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
