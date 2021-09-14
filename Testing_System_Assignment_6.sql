USE Exam_Management;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_all_account_of_department;
DELIMITER $$
CREATE PROCEDURE get_all_account_of_department(IN Department_Name VARCHAR(50))
	BEGIN
		SELECT	*
		FROM	`account`
        JOIN	department USING (DepartmentID)
        WHERE	DepartmentName = Department_Name;
    END $$
DELIMITER ;
CALL exam_management.get_all_account_of_department('sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS number_of_account;
DELIMITER $$
CREATE PROCEDURE number_of_account()
	BEGIN
		SELECT		GroupID, count(GroupID)
		FROM		`account`
        JOIN		groupaccount USING (AccountID)
        GROUP BY	GroupID;
    END $$
DELIMITER ;
CALL	number_of_account();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS question_in_the_month;
DELIMITER $$
CREATE PROCEDURE question_in_the_month()
	BEGIN
		SELECT		TypeID, count(TypeID), GROUP_CONCAT(QuestionID)
		FROM		question
        WHERE		month (CreateDate) = month(now()) && year(CreateDate) = year(now())
        GROUP BY	TypeID;
    END $$
DELIMITER ;
CALL	question_in_the_month();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS get_typequestion;
DELIMITER $$
CREATE PROCEDURE get_typequestion(OUT out_id_typequestion TINYINT UNSIGNED)
	BEGIN
		WITH
		Count_TypeID AS (
			SELECT		TypeID, count(TypeID) 'num'
			FROM		question 
            GROUP BY	TypeID)
        
		SELECT		TypeID INTO out_id_typequestion
		FROM		question
		GROUP BY	TypeID
        HAVING		count(TypeID) = (SELECT	max(num)
									 FROM 	Count_TypeID);
    END $$
DELIMITER ;

SET		@TypeID = '0';
CALL	get_typequestion(@TypeID);
SELECT	@TypeID;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
CALL	get_typequestion(@TypeID);

SELECT	*
FROM	typequestion
WHERE	TypeID = (SELECT	@TypeID);

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS get_username_or_groupname;
DELIMITER $$
CREATE PROCEDURE get_username_or_groupname(IN your_name NVARCHAR(50))
	BEGIN
		SELECT	Username
		FROM	`account`
		WHERE	Username LIKE concat('%',your_name,'%');
		
        SELECT	GroupName
		FROM	`group`
		WHERE	GroupName LIKE concat('%',your_name,'%');
    END $$
DELIMITER ;

CALL exam_management.get_username_or_groupname('a');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS insert_account;
DELIMITER $$
CREATE PROCEDURE insert_account(IN your_fullName NVARCHAR(50), your_email VARCHAR(50))
	BEGIN
		DECLARE your_username VARCHAR(50) DEFAULT SUBSTRING_INDEX(your_email,'@',1);
        -- DECLARE your_positionID TINYINT UNSIGNED DEFAULT 1; 
        -- DECLARE your_departmentID TINYINT UNSIGNED DEFAULT 11;
        
        INSERT INTO department	(DepartmentID, DepartmentName)
        VALUES					(11, 'Waiting_room');
        
        INSERT INTO `account`	(Email, Username, FullName, DepartmentID, PositionID)
        VALUES					(your_email, your_username, your_fullName, 11, 1);
        
        SELECT	*
		FROM	`account`;
    END $$
DELIMITER ;

CALL exam_management.insert_account('qwerty2', 'qwerty2@gmail.com');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS delete_exam;
DELIMITER $$
CREATE PROCEDURE delete_exam (IN in_ExamID TINYINT UNSIGNED)
BEGIN
	DELETE 	
    FROM 	Exam 
    WHERE	ExamID = in_ExamID;
	
    SELECT	*
    FROM	exam;
END $$ 
DELIMITER ;

CALL exam_management.delete_exam(1);