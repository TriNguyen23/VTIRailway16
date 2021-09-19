USE Exam_Management;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS CheckInsertGroup;
DELIMITER $$
CREATE TRIGGER CheckInsertGroup
BEFORE INSERT ON `group`
FOR EACH ROW
BEGIN
	-- IF 	year(NEW.CreateDate)	< (year(now()) - 1 ) THEN
    DECLARE	t_CreateDate DATETIME;
    SET		t_CreateDate = (DATE_SUB(now(), INTERVAL 1 YEAR));
    IF 	NEW.CreateDate	< t_CreateDate THEN
		SIGNAL SQLSTATE '12345' -- 10001->99999
        SET MESSAGE_TEXT = 'CreateDate Error';
	END IF;
END $$
DELIMITER ;

INSERT INTO `Group`		(GroupName,		CreatorID,	CreateDate)
VALUES                                             
						('GroupAA',		2,			'2020-03-05');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more usery
DROP TRIGGER IF EXISTS CheckInsertAccount;
DELIMITER $$
CREATE TRIGGER CheckInsertAccount
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	DECLARE t_DepartmentID TINYINT UNSIGNED;
	SELECT 	DepartmentID INTO t_DepartmentID
    FROM 	department
    WHERE	DepartmentName = 'Sale';
    
    IF 	NEW.DepartmentID = t_DepartmentID THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = '"Sale" cannot add more user';
	END IF;
END $$
DELIMITER ;

INSERT INTO `Account`	(Email,						Username,		FullName,			DepartmentID,	PositionID)
VALUES
						('tringuyen11@gmail.com',	'tringuyen11', 	N'NGUYỄN TRÍ 11', 	2, 				1	);
                        
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS CheckInsertUser;
DELIMITER $$
CREATE TRIGGER CheckInsertUser
BEFORE INSERT ON `groupaccount`
FOR EACH ROW
BEGIN
    IF 	NEW.GroupID IN (SELECT 		GroupID
						FROM 		`groupaccount`
						GROUP BY	GroupID
						HAVING		COUNT(GroupID) >= 5) THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'GroupID cannot add more user';
	END IF;
END $$
DELIMITER ;

INSERT INTO GroupAccount(GroupID,		AccountID)
VALUES
						(1,				10);

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS CheckInsertExamQuestion;
DELIMITER $$
CREATE TRIGGER CheckInsertExamQuestion
BEFORE INSERT ON examquestion
FOR EACH ROW
BEGIN
    IF 	NEW.ExamID IN ( SELECT 		ExamID
						FROM 		examquestion
						GROUP BY	ExamID
						HAVING		COUNT(ExamID) >= 3) THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'ExamID cannot add more QuestionID';
	END IF;
END $$
DELIMITER ;

INSERT INTO ExamQuestion		(ExamID,	QuestionID)
VALUES
								(1,			5);

-- Cách 2
DROP TRIGGER IF EXISTS CheckInsertExamQuestion;
DELIMITER $$
CREATE TRIGGER CheckInsertExamQuestion
BEFORE INSERT ON examquestion
FOR EACH ROW
BEGIN
	DECLARE	t_Count_ExamID TINYINT;
	SELECT 	COUNT(ExamID) INTO t_Count_ExamID
	FROM 	examquestion
	WHERE	ExamID = NEW.ExamID;
	
    IF 	t_Count_ExamID >= 3 THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'ExamID cannot add more QuestionID';
	END IF;
END $$
DELIMITER ;

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó
DROP TRIGGER IF EXISTS CheckDeleteAccount;
DELIMITER $$
CREATE TRIGGER CheckDeleteAccount
BEFORE DELETE ON `account`
FOR EACH ROW
BEGIN
    IF 	OLD.Email LIKE '%admin@gmail.com'THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'This is a User Admin, cannot be deleted';
	END IF;
END $$
DELIMITER ;

DELETE
FROM	`account`
WHERE	Email = 'tringuyen.admin@gmail.com';

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
INSERT INTO department	(DepartmentID, DepartmentName)
VALUES					(11, 'Waiting Department');
        
DROP TRIGGER IF EXISTS InsertAccount;
DELIMITER $$
CREATE TRIGGER InsertAccount
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
    IF 	NEW.DepartmentID IS NULL THEN
	SET	NEW.DepartmentID = 11;
	END IF;
END $$
DELIMITER ;

INSERT INTO `Account`	(Email,						Username,		FullName,			PositionID)
VALUES
						('tringuyen11@gmail.com',	'tringuyen11', 	N'NGUYỄN TRÍ 11',	1	);

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS CheckAnswer;
DELIMITER $$
CREATE TRIGGER CheckAnswer
BEFORE INSERT ON answer
FOR EACH ROW
BEGIN
	DECLARE	t_QuestionID TINYINT;
    DECLARE	t_isCorrect TINYINT;
    SELECT	COUNT(QuestionID) INTO t_QuestionID
    FROM	answer
    WHERE	QuestionID = NEW.QuestionID;
    SELECT	COUNT(isCorrect) INTO t_isCorrect
    FROM	answer
    WHERE	QuestionID = NEW.QuestionID && isCorrect = NEW.isCorrect;
    
    IF 	t_QuestionID >= 4 || t_isCorrect >= 2 THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Unable to add data';
	END IF;
END $$
DELIMITER ;

INSERT INTO Answer		(Content,			QuestionID,		isCorrect)
VALUES
						('Answer11',			1,				1);
                        
-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
DROP TRIGGER IF EXISTS UpdateGender;
DELIMITER $$
CREATE TRIGGER UpdateGender
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	IF 		NEW.Gender = 'Nam' THEN
	SET 	NEW.Gender = 'M';
	ELSEIF 	NEW.Gender = 'Nu' THEN
	SET 	NEW.Gender = 'F';
	ELSEIF 	NEW.Gender IS NULL THEN
	SET 	NEW.Gender = 'U';
	END IF ;
END $$
DELIMITER ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS CheckDeleteExam;
DELIMITER $$
CREATE TRIGGER CheckDeleteExam
BEFORE DELETE ON exam
FOR EACH ROW
BEGIN
    DECLARE	t_CreateDate DATETIME;
    SET		t_CreateDate = (DATE_SUB(now(), INTERVAL 2 DAY));
    IF 	OLD.CreateDate	>= t_CreateDate THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Cannot delete exam';
	END IF;
END $$
DELIMITER ;

DELETE
FROM	exam
WHERE	ExamID = 10;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

SELECT	*,
	CASE
		WHEN	Duration <= 60 THEN 'Sort time'
        WHEN	Duration > 60 && Duration <= 90 THEN 'Medium time'
        WHEN	Duration > 90 THEN 'Long time'
        ELSE	'Unknown'
	END AS Type_Duration
FROM	exam;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:2
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
