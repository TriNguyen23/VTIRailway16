-- QUERY DATA

USE Exam_Management;

-- Question 2: lấy ra tất cả các phòng ban
SELECT	*
FROM 	department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT	*
FROM 	department
WHERE	DepartmentName = 'sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT	* 
FROM	`account`
WHERE	length(FullName) = (SELECT max(length(FullName)) 
							FROM `account`);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT	* 
FROM	`account`
WHERE	DepartmentID = 3 && length(FullName) = (SELECT max(length(FullName)) 
												FROM `account` 
                                                WHERE DepartmentID = 3);

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT	*
FROM	`group`
WHERE	CreateDate < '2019-12-20 00:00:00';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT		QuestionID, count(*) AS 'số câu trả lời'-- GROUP_CONCAT(AnswerID)
FROM		answer
GROUP BY	QuestionID
HAVING		count(QuestionID) >= 4 ;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT	*
FROM	exam
WHERE	Duration >= 60 && CreateDate < '2019-12-20 00:00:00';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT		*
FROM		`group`
ORDER BY	CreateDate DESC
LIMIT		5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT	DepartmentID, count(*) AS 'So nhan vien'
FROM	`account`
WHERE	DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT	*
FROM	`account`
WHERE	FullName LIKE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
SET		foreign_key_checks = 0;
DELETE
FROM	exam
WHERE	CreateDate < '2019-12-20 00:00:00';
SET		foreign_key_checks = 1;

SELECT	*
FROM	exam;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET		foreign_key_checks = 0;
DELETE
FROM	question
-- WHERE	Content LIKE 'câu hỏi%';
WHERE	substring_index(Content,' ',2) = 'câu hỏi';
SET		foreign_key_checks = 1;

SELECT	*
FROM	question;

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE 	`account`
SET		FullName = 'Nguyễn Bá Lộc',
		Email =  'loc.nguyenba@vti.com.vn'
WHERE	AccountID = 5;

SELECT	*
FROM	`account`;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE 	groupaccount
SET		AccountID = 5
WHERE	GroupID = 4;

SELECT	*
FROM	groupaccount;