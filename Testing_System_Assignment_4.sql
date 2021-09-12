USE Exam_Management;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT	FullName, DepartmentID, DepartmentName
FROM	`account`
JOIN	department USING (DepartmentID);

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT	*
FROM	`account`
WHERE	CreateDate > '2010-12-20 00:00:00';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT	*
FROM	`account`
JOIN	position USING (PositionID)
WHERE	PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT		DepartmentID, DepartmentName, count(DepartmentID) 'Number of employees', GROUP_CONCAT(AccountID)
FROM		`account`
JOIN		department USING (DepartmentID)
GROUP BY	DepartmentID
HAVING		count(DepartmentID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT		QuestionID, Content, count(QuestionID) 'Number of uses', GROUP_CONCAT(ExamID)
FROM		question
JOIN		examquestion USING (QuestionID)
GROUP BY	QuestionID
HAVING		count(QuestionID) = (SELECT 	max(num)
								FROM	(SELECT 	count(QuestionID) 'num'
										FROM		question
										JOIN		examquestion USING (QuestionID)
										GROUP BY	QuestionID) `MAX`);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT		CategoryID, CategoryName, count(CategoryID) 'Number of uses', GROUP_CONCAT(QuestionID)
FROM		question
JOIN		categoryquestion USING (CategoryID)
GROUP BY	CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT		QuestionID, count(QuestionID) 'Number of uses', GROUP_CONCAT(ExamID)
FROM		examquestion
GROUP BY	QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT		QuestionID,count(QuestionID) 'Number of answers', GROUP_CONCAT(AnswerID)
FROM		answer
GROUP BY	QuestionID
HAVING		count(QuestionID) = (SELECT		max(num)
								FROM	(SELECT		count(QuestionID) 'num'
										FROM		answer
										GROUP BY	QuestionID) `MAX`);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT		GroupID, count(GroupID) 'Number of accounts' , GROUP_CONCAT(AccountID)
FROM		groupaccount
GROUP BY	GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
CREATE VIEW		Number_of_position AS
	SELECT		count(PositionID) 'num'
	FROM		`account`
	GROUP BY	PositionID;

SELECT		PositionID, PositionName, count(PositionID) 'Number of employees'
FROM		`account`
JOIN		position USING (PositionID)
GROUP BY	PositionID 
HAVING		count(PositionID) = ( 	SELECT		min(num)
									FROM		Number_of_position);

DROP VIEW IF EXISTS Number_of_position;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT		DepartmentID, DepartmentName, count(PositionID), GROUP_CONCAT(PositionName)
FROM		department
LEFT JOIN	`account` USING (DepartmentID)
LEFT JOIN	position USING (PositionID)
GROUP BY	DepartmentID, PositionID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT		QuestionID, q.Content 'Content of question', CategoryName, FullName 'Creator', answer.Content 'Conten of answer'
FROM		question q
JOIN		answer USING (QuestionID)
JOIN		categoryquestion USING (CategoryID)
JOIN		`account` a ON q.CreatorID = a.AccountID
ORDER BY	QuestionID ASC;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT		TypeID, TypeName, count(QuestionID) 'Number of questions'
FROM		question
JOIN		typequestion USING (TypeID)
GROUP BY	TypeID;

-- Question 14:Lấy ra group không có account nào
SELECT		*
FROM		`group`
LEFT JOIN	groupaccount USING (GroupID)
WHERE		AccountID IS NULL; 

-- Question 15: Lấy ra group không có account nào
SELECT 	*
FROM 	`Group`
WHERE 	GroupID NOT IN (SELECT 	GroupID
						FROM 	GroupAccount);

-- Question 16: Lấy ra question không có answer nào
SELECT		*
FROM		question
LEFT JOIN	answer USING (QuestionID)
WHERE		AnswerID IS NULL;

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT	*
FROM	`account`
JOIN	groupaccount USING (AccountID)
WHERE	GroupID = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT	*
FROM	`account`
JOIN	groupaccount USING (AccountID)
WHERE	GroupID = 2;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT	*
FROM	`account`
JOIN	groupaccount USING (AccountID)
WHERE	GroupID = 1
UNION
SELECT	*
FROM	`account`
JOIN	groupaccount USING (AccountID)
WHERE	GroupID = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT		GroupID, count(GroupID) 'Number of accounts'
FROM		`account`
JOIN		groupaccount USING (AccountID)
GROUP BY	GroupID
HAVING		`Number of account` > 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT		GroupID, count(GroupID) 'Number of accounts'
FROM		`account`
JOIN		groupaccount USING (AccountID)
GROUP BY	GroupID
HAVING		`Number of account` < 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT		GroupID, count(GroupID) 'Number of accounts'
FROM		`account`
JOIN		groupaccount USING (AccountID)
GROUP BY	GroupID
HAVING		`Number of account` > 5
UNION ALL
SELECT		GroupID, count(GroupID) 'Number of accounts'
FROM		`account`
JOIN		groupaccount USING (AccountID)
GROUP BY	GroupID
HAVING		`Number of account` < 7;
