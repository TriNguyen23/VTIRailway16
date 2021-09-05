-- INSERT DATABASE

USE Exam_Management;

-- Add data Table 1:Department
INSERT INTO Department	(DepartmentName)
VALUES
						('Marketing'	),
						('Sale'			),
						('Technical'	),
						('Finance'		),
                        ('Director' 	),
                        ('Marketing2'	),
						('Sale2'		),
						('Technical2'	),
						('Finance2'		),
                        ('Director2' 	);

-- Add data Table 2: Position
INSERT INTO Position	(PositionName)
VALUES
						('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			);

-- Add data Table 3: Account
INSERT INTO `Account`	(Email,						Username,		FullName,		DepartmentID,	PositionID)
VALUES
						('tringuyen1@gmail.com',	'tringuyen1', 	N'NN TRÍ 01', 	1, 				1	),
						('tringuyen2@gmail.com',	'tringuyen2', 	N'NN TRÍ 2', 	2, 				2	),
						('tringuyen3@gmail.com',	'tringuyen3', 	N'NN TRÍ 3', 	2, 				3	),
						('tringuyen4@gmail.com',	'tringuyen4', 	N'NN TRÍ 4', 	3, 				4	),
                        ('tringuyen5@gmail.com',	'tringuyen5', 	N'DN TRÍ o', 	5, 				1	),
                        ('tringuyen6@gmail.com',	'tringuyen6', 	N'DD TRÍ o', 	6, 				1	),
						('tringuyen7@gmail.com',	'tringuyen7', 	N'NN TRÍ 7', 	7, 				2	),
						('tringuyen8@gmail.com',	'tringuyen8', 	N'NN TRÍ 8', 	8, 				3	),
						('tringuyen9@gmail.com',	'tringuyen9', 	N'NN TRÍ 9', 	9, 				4	),
                        ('tringuyen10@gmail.com',	'tringuyen10', 	N'NN TRÍ 10', 	2, 			1	);

-- Add data Table 4: Group
INSERT INTO `Group`		(GroupName,		CreatorID,	CreateDate)
VALUES                                             
						('GroupA',		2,			'2019-03-05'),
                        ('GroupB',		4,			'2020-03-07'),
                        ('GroupC',		1,			'2020-03-09'),
                        ('GroupD',		5,			'2020-03-10'),
                        ('GroupE',		3,			'2020-03-28'),
                        ('GroupF',		6,			'2020-04-06'),
                        ('GroupG',		7,			'2020-04-07'),
                        ('GroupH',		8,			'2020-04-08'),
                        ('GroupI',		9,			'2020-04-09'),
                        ('GroupJ',		1,			'2020-04-10');
 
 -- Add data Table 5: GroupAccount
INSERT INTO GroupAccount(GroupID,		AccountID)
VALUES
						(1,				3),
						(2,				5),
						(3,				2),
						(4,				4),
						(5,				1),
                        (6,				6),
						(7,				7),
						(8,				8),
						(9,				9),
						(10,			10);

 -- Add data Table 6: TypeQuestion
INSERT INTO TypeQuestion(TypeName)
VALUES
						('Essay'),
						('Multiple-Choice');

 -- Add data Table 7: CategoryQuestion
INSERT INTO CategoryQuestion	(CategoryName)
VALUES
								('Java'),
								('NET'),
                                ('SQL'),
                                ('Postman'),
                                ('Ruby'),
                                ('C'),
								('C++'),
                                ('C#'),
                                ('Javascipt'),
                                ('Ruby2');

 -- Add data Table 8: Question
INSERT INTO Question	(Content,					CategoryID,		TypeID,		CreatorID)
VALUES
						('câu hỏi Why learn Java',	1,				1,			1),
                        ('Why learn NET',			2,				2,			2),
                        ('câu hỏi Why learn SQL',	3,				2,			3),
                        ('Why learn Postman',		4,				1,			4),
                        ('Why learn Ruby',			5,				1,			5),
                        ('câu hỏi Why learn C',		6,				1,			6),
                        ('Why learn C++',			7,				2,			7),
                        ('câu hỏi Why learn C#',	8,				2,			8),
                        ('Why learn Javascript',	9,				1,			9),
                        ('Why learn Ruby2',			10,				1,			10);

 -- Add data Table 9: Answer
INSERT INTO Answer		(Content,			QuestionID,		isCorrect)
VALUES
						('Answer1',			1,				1),
                        ('Answer2',			1,				0),
                        ('Answer3',			1,				1),
                        ('Answer4',			1,				1),
                        ('Answer5',			5,				0),
                        ('Answer6',			1,				1),
                        ('Answer7',			2,				0),
                        ('Answer8',			3,				1),
                        ('Answer9',			4,				1),
                        ('Answer10',		5,				0);

 -- Add data Table 10: Exam
INSERT INTO Exam		(`Code`,	Title,		CategoryID,		Duration,	CreatorID,	CreateDate)
VALUES
						('AA01',	'Test1',	1,				90,			2,			'2019-03-05'),
                        ('AA02',	'Test2',	2,				60,			2,			'2020-03-07'),
						('AA03',	'Test3',	3,				90,			5,			'2020-03-09'),
                        ('AA04',	'Test4',	4,				60,			4,			'2020-03-10'),
                        ('AA05',	'Test5',	5,				60,			4,			'2020-03-28'),
                        ('AA06',	'Test6',	6,				120,		2,			'2020-04-06'),
                        ('AA07',	'Test7',	7,				60,			2,			'2020-04-07'),
						('AA08',	'Test8',	8,				90,			5,			'2020-04-08'),
                        ('AA09',	'Test9',	9,				60,			4,			'2020-04-09'),
                        ('AA10',	'Test10',	10,				60,			4,			'2020-04-10');
                        
 -- Add data Table 11: ExamQuestion
INSERT INTO ExamQuestion		(ExamID,	QuestionID)
VALUES
								(1,			1),
                                (2,			2),
                                (3,			3),
                                (4,			4),
                                (5,			5),
                                (6,			1),
                                (7,			2),
                                (8,			3),
                                (9,			4),
                                (10,		5);