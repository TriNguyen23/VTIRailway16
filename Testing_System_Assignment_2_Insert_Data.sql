-- INSERT DATABASE

USE Exam_Management;

-- Add data Table 1:Department
INSERT INTO Department	(DepartmentName)
VALUES
						('Marketing'	),
						('Sale'			),
						('Technical'	),
						('Finance'		),
                        ('Director' 	);

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
						('tringuyen1@gmail.com',	'tringuyen1', 	N'NN TRÍ 1', 	1, 				1	),
						('tringuyen2@gmail.com',	'tringuyen2', 	N'NN TRÍ 2', 	2, 				2	),
						('tringuyen3@gmail.com',	'tringuyen3', 	N'NN TRÍ 3', 	3, 				3	),
						('tringuyen4@gmail.com',	'tringuyen4', 	N'NN TRÍ 4', 	4, 				4	),
                        ('tringuyen5@gmail.com',	'tringuyen5', 	N'NN TRÍ 5', 	5, 				1	);

-- Add data Table 4: Group
INSERT INTO `Group`		(GroupName,		CreatorID)
VALUES
						('GroupA',		2),
                        ('GroupB',		4),
                        ('GroupC',		1),
                        ('GroupD',		5),
                        ('GroupE',		3);
 
 -- Add data Table 5: GroupAccount
INSERT INTO GroupAccount(GroupID,		AccountID)
VALUES
						(1,				3),
						(2,				5),
						(3,				2),
						(4,				4),
						(5,				1);

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
                                ('Ruby');

 -- Add data Table 8: Question
INSERT INTO Question	(Content,					CategoryID,		TypeID,		CreatorID)
VALUES
						('Why learn Java',			1,				1,			1),
                        ('Why learn NET',			2,				2,			2),
                        ('Why learn SQL',			3,				2,			3),
                        ('Why learn Postman',		4,				1,			4),
                        ('Why learn Ruby',			5,				1,			5);

 -- Add data Table 9: Answer
INSERT INTO Answer		(Content,			QuestionID,		isCorrect)
VALUES
						('Answer1',			1,				1),
                        ('Answer2',			2,				2),
                        ('Answer3',			3,				1),
                        ('Answer4',			4,				1),
                        ('Answer5',			5,				2);

 -- Add data Table 10: Exam
INSERT INTO Exam		(`Code`,	Title,		CategoryID,		Duration,	CreatorID)
VALUES
						('AA01',	'Test1',	1,				90,			2),
                        ('AA02',	'Test2',	2,				60,			2),
						('AA03',	'Test3',	3,				90,			5),
                        ('AA04',	'Test4',	4,				60,			4),
                        ('AA05',	'Test5',	5,				60,			4);
                        
 -- Add data Table 11: ExamQuestion
INSERT INTO ExamQuestion		(ExamID,	QuestionID)
VALUES
								(1,			1),
                                (2,			2),
                                (3,			3),
                                (4,			4),
                                (5,			5);