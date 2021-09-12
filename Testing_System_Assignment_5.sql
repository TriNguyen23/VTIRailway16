USE Exam_Management;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS View_SaleEmployee;
CREATE VIEW View_SaleEmployee AS
	SELECT	*
	FROM	`account`
	JOIN	department USING (DepartmentID)
	WHERE	DepartmentName = 'Sale';
SELECT	*
FROM	View_SaleEmployee;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS `MAX`;
CREATE VIEW `MAX` AS
	SELECT 	max(num)
	FROM	(	SELECT		count(AccountID) 'num'
				FROM		`account`
				JOIN		groupaccount USING (AccountID)
				GROUP BY	AccountID) Number_of_AccountID;

DROP VIEW IF EXISTS View_account;
CREATE VIEW View_account AS            
	SELECT		AccountID, GROUP_CONCAT(GroupID)
	FROM		`account`
	JOIN		groupaccount USING (AccountID)
	GROUP BY	AccountID
	HAVING		count(AccountID) = (SELECT  *
									FROM	`MAX`);
SELECT	* 
FROM 	View_account;
DROP VIEW IF EXISTS `MAX`;

-- Sử dụng CTE
DROP VIEW IF EXISTS View_account;
CREATE VIEW View_account AS  
	WITH
	Number_of_AccountID AS (
		SELECT		count(AccountID) 'num'
		FROM		`account`
		JOIN		groupaccount USING (AccountID)
		GROUP BY	AccountID )
	SELECT		AccountID, GROUP_CONCAT(GroupID)
	FROM		`account`
	JOIN		groupaccount USING (AccountID)
	GROUP BY	AccountID
	HAVING		count(AccountID) = (SELECT  max(num)
									FROM	Number_of_AccountID);
SELECT	*
FROM	View_account;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 20 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS View_Question;
CREATE VIEW View_Question AS
	SELECT	*
	FROM	question
	WHERE	length(Content) > 20;
SELECT	*
FROM	View_Question;

SET 	foreign_key_checks = 0;
DELETE
FROM	View_Question;
SET 	foreingn_key_checks = 1;

SELECT	*
FROM	question;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS `MAX`;
CREATE VIEW `MAX` AS
	SELECT		count(DepartmentID)
	FROM		`account`
	GROUP BY	DepartmentID
	ORDER BY	count(DepartmentID) DESC
	LIMIT		1;

DROP VIEW IF EXISTS View_Department;
CREATE VIEW View_Department AS 
	SELECT		DepartmentID, count(DepartmentID) 'Number of accounts'
	FROM		`account`
	GROUP BY	DepartmentID
	HAVING		count(DepartmentID) = (	SELECT 	*
										FROM	`MAX`);
SELECT	*
FROM	View_Department;
DROP VIEW IF EXISTS `MAX`;

-- Sử dụng CTE
DROP VIEW IF EXISTS View_Department;
CREATE VIEW View_Department AS 
	WITH
    `MAX` AS (
		SELECT		count(DepartmentID)
		FROM		`account`
		GROUP BY	DepartmentID
		ORDER BY	count(DepartmentID) DESC
		LIMIT		1)
	SELECT		DepartmentID, count(DepartmentID) 'Number of accounts'
	FROM		`account`
	GROUP BY	DepartmentID
	HAVING		count(DepartmentID) = (	SELECT 	*
										FROM	`MAX`);
SELECT	*
FROM	View_Department;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS View_Creator;
CREATE VIEW View_Creator AS
	SELECT	QuestionID, Content, FullName Creator
	FROM	question q
	JOIN	`account` a ON q.CreatorID = a.AccountID
	WHERE	FullName LIKE 'Nguyễn%';
    -- WHERE	substring_index(FullName,' ',1) = 'Nguyễn';
SELECT	*
FROM	View_Creator;
