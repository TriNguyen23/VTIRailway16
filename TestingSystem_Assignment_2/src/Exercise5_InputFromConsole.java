import java.time.LocalDate;
import java.util.Scanner;

public class Exercise5_InputFromConsole {

	public static void main(String[] args) {

//		question1();
//		question2();
//		question3();
//		question4();
//		question6();
//		question7();
		question8();

	}

	private static void question1() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào 3 số nguyên");
		System.out.println("Nhập vào số 1: ");
		int a = sc.nextInt();
		System.out.println("Nhập vào số 2: ");
		int b = sc.nextInt();
		System.out.println("Nhập vào số 3: ");
		int c = sc.nextInt();
		System.out.println("Bạn vừa nhập vào các số: " + a + " " + b + " " + c);
	}

	private static void question2() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào 3 số thực");
		System.out.println("Nhập vào số 1: ");
		float a = sc.nextFloat();
		System.out.println("Nhập vào số 2: ");
		float b = sc.nextFloat();
		System.out.println("Nhập vào số 3: ");
		float c = sc.nextFloat();
		System.out.println("Bạn vừa nhập vào các số: " + a + " " + b + " " + c);
	}

	private static void question3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào Họ: ");
		String s1 = sc.next();
		System.out.println("Mời bạn nhập vào Tên: ");
		String s2 = sc.next();
		System.out.println("Fullname của bạn là: " + s1 + " " + s2);
	}

	private static void question4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào năm sinh: ");
		int year = sc.nextInt();
		System.out.println("Mời bạn nhập vào tháng sinh: ");
		int month = sc.nextInt();
		System.out.println("Mời bạn nhập vào ngày sinh: ");
		int day = sc.nextInt();
		LocalDate dateBirth = LocalDate.of(year, month, day);
		System.out.println("Ngày sinh của bạn là: " + dateBirth);
	}

	private static void question6() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào thông tin Department cân tạo: ");
		Department dep = new Department();
		System.out.println("Nhập ID: ");
		dep.id = sc.nextInt();
		System.out.println("Nhập Name: ");
		dep.name = sc.next();
		System.out.println("Thông tin Department vừa nhập, ID: " + dep.id + " Name: " + dep.name);
	}

	private static void question7() {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("Hãy nhập vào 1 số chẵn: ");
			int a = sc.nextInt();
			if (a % 2 == 0) {
				System.out.println("Bạm vừa nhập vào:" + a);
				return;
			} else {
				System.out.println("Nhập sai, đây không phải là số chẵn");
			}
		}
	}

	private static void question8() {

		Scanner sc = new Scanner(System.in);
		int choose;
		while (true) {
			System.out.println("Mời bạn chọn chức năng: 1. Tạo Account, 2. Tạo Department");
			choose = sc.nextInt();
			if (choose == 1 || choose == 2) {
				switch (choose) {
				case 1:
					// question5();
					break;
				case 2:
					question6();
					break;
				}
				return;
			} else {
				System.out.println("Nhập lại: ");
			}
		}
	}

}
