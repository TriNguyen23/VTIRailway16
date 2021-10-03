import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;

public class Exercise3_DateFormat {

	public static void main(String[] args) {

		// Create Department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketting";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Service";

		// Create Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.DEV;

		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.PM;

		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.SCRUM_MASTER;

		// Create Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Group A";
		group1.accounts = new Account[] {};

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Group B";

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Group C";

		// Create Account
		Account account1 = new Account();
		account1.id = 1;
		account1.email = "nguyenvana@gmail.com";
		account1.userName = "nguyenvana";
		account1.fullName = "Nguyen Van A";
		account1.department = department1;
		account1.position = position1;
		account1.createDate = LocalDate.now();
		account1.groups = new Group[] { group1, group2 };

		Account account2 = new Account();
		account2.id = 2;
		account2.email = "nguyenvanb@gmail.com";
		account2.userName = "nguyenvanb";
		account2.fullName = "Nguyen Van B";
		account2.department = department2;
		account2.position = position2;
		account2.createDate = LocalDate.now();
		account2.groups = new Group[] { group2, group3 };

		Account account3 = new Account();
		account3.id = 3;
		account3.email = "nguyenvanc@gmail.com";
		account3.userName = "nguyenvanc";
		account3.fullName = "Nguyen Van C";
		account3.department = department3;
		account3.position = position3;
		account3.createDate = LocalDate.now();
		account3.groups = new Group[] { group2, group3 };

		group1.accounts = new Account[] { account1, account2 };

		// Create TypeQuestion
		TypeQuestion type1 = new TypeQuestion();
		type1.id = 1;
		type1.name = TypeName.Essay;

		TypeQuestion type2 = new TypeQuestion();
		type2.id = 2;
		type2.name = TypeName.Multiple_Choice;

		// Create CategoryQuestion
		CategoryQuestion category1 = new CategoryQuestion();
		category1.id = 1;
		category1.name = "Java";

		CategoryQuestion category2 = new CategoryQuestion();
		category2.id = 2;
		category2.name = "NET";

		CategoryQuestion category3 = new CategoryQuestion();
		category3.id = 3;
		category3.name = "SQL";

		// Create Question
		Question question1 = new Question();
		question1.id = 1;
		question1.content = "Why learn Java";
		question1.category = category1;
		question1.type = type1;
		question1.creator = account1;
		question1.createDate = LocalDate.now();

		Question question2 = new Question();
		question2.id = 2;
		question2.content = "Why learn NET";
		question2.category = category2;
		question2.type = type2;
		question2.creator = account2;
		question2.createDate = LocalDate.now();

		Question question3 = new Question();
		question3.id = 3;
		question3.content = "Why learn SQL";
		question3.category = category3;
		question3.type = type1;
		question3.creator = account3;
		question3.createDate = LocalDate.now();

		// Create Answer
		Answer answer1 = new Answer();
		answer1.id = 1;
		answer1.content = "answer1";
		answer1.question = question1;
		answer1.isCorrect = true;

		Answer answer2 = new Answer();
		answer2.id = 2;
		answer2.content = "answer2";
		answer2.question = question2;
		answer2.isCorrect = true;

		Answer answer3 = new Answer();
		answer3.id = 3;
		answer3.content = "answer3";
		answer3.question = question3;
		answer3.isCorrect = false;

		// Create Exam
		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "A01";
		exam1.title = "Test1";
		exam1.category = category1;
		exam1.duration = 60;
		exam1.creator = account1;
		exam1.createDate = LocalDate.now();
		exam1.questions = new Question[] { question1 };

		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "A02";
		exam2.title = "Test2";
		exam2.category = category2;
		exam2.duration = 90;
		exam2.creator = account2;
		exam2.createDate = LocalDate.now();
		exam2.questions = new Question[] { question2 };

		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "A03";
		exam3.title = "Test3";
		exam3.category = category3;
		exam3.duration = 120;
		exam3.creator = account3;
		exam3.createDate = LocalDate.now();
		exam3.questions = new Question[] { question3 };

		// Question 1
		System.out.println("Question 1");
		System.out.println(exam1.code + ": " + exam1.createDate);

		Locale locale = new Locale("vn", "VN");
		DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String date = dateformat.format(new Date());
		System.out.println(exam1.code + ": " + date);

		// Question 2
		System.out.println("Question 2");
		String pattern = "yyyy-MM-dd-HH-mm-ss";

		Exam[] exams = { exam1, exam2, exam3 };
		for (Exam exam : exams) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date1 = simpleDateFormat.format(new Date());
			System.out.println(exam.id + ": " + date1);
		}

		// Question 3
		System.out.println("Question 3");
		String pattern1 = "yyyy";

		for (Exam exam : exams) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern1);
			String date2 = simpleDateFormat.format(new Date());
			System.out.println(exam.id + ": " + date2);
		}

		// Question 4
		System.out.println("Question 4");
		String pattern2 = "yyyy-MM";

		for (Exam exam : exams) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern2);
			String date3 = simpleDateFormat.format(new Date());
			System.out.println(exam.id + ": " + date3);
		}

		// Question 5
		System.out.println("Question 5");
		String pattern3 = "MM-dd";

		for (Exam exam : exams) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern3);
			String date4 = simpleDateFormat.format(new Date());
			System.out.println(exam.id + ": " + date4);
		}
	}

}
