DROP DATABASE IF EXISTS Exam_management;

CREATE DATABASE IF NOT EXISTS Exam_Management;
USE Exam_Management;

-- Table 1
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID		INT,
    DepartmentName		VARCHAR(50)
);

-- Table 2
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID			INT,
    PositionName		VARCHAR(50)
);

-- Table 3
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID			INT,
    Email				VARCHAR(50),
    Username			VARCHAR(50),
    FullName			VARCHAR(50),
    DepartmentID		INT,
    PositionID			INT,
    CreateDate			DATE
);

-- Table 4
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID				INT,
    GroupName			VARCHAR(50),
    CreatorID			INT,
    CreateDate			DATE
);

-- Table 5
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
	GroupID				INT,
    AccountID			INT,
    JoinDate			DATE
);

-- Table 6
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID				INT,
    TypeName			VARCHAR(50)
);

-- Table 7
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID			INT,
    CategoryName		VARCHAR(50)
);

-- Table 8
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
	QuestionID			INT,
    Content				VARCHAR(50),
    CategoryID			INT,
    TypeID				INT,
    CreatorID			INT,
    CreateDate			DATE
);

-- Table 9
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
	AnswerID			INT,
    Content				VARCHAR(50),
    QuestionID			INT,
    isCorrect			VARCHAR(50)
);

-- Table 10
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID				INT,
    Code				VARCHAR(50),
    Title				VARCHAR(50),
    CategoryID			INT,
    Duration			INT,
    CreatorID			INT,
    CreateDate			DATE
);

-- Table 11
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
	ExamID				INT,
    QuestionID			INT
);
