import java.time.LocalDate;

public class Exercise1_FlowControl {

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

		// IF
		// Question 1
		System.out.println("Question 1");

		if (account2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			System.out.println("Phòng ban của nhân viên này là : " + account2.department.name);
		}

		// Question 2
		System.out.println("Question 2");

		if (account2.groups.length == 0) {
			System.out.println("Nhân viên này chưa có group");
		} else if (account2.groups.length == 1 || account2.groups.length == 2) {
			System.out.println("Group của nhân viên này là : ");
			for (Group group : account2.groups) {
				System.out.println(group.name + " ");
			}
		} else if (account2.groups.length == 3) {
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
		} else if (account2.groups.length >= 4) {
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
		}

		// Question 3
		System.out.println("Question 3");

		System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban"
				: "Phòng ban nhân viên này là: " + account2.department.name);

		// Question 4
		System.out.println("Question 4");

		System.out.println(
				account1.position.name == PositionName.DEV ? "Đây là Developer" : "Người này không phải là Developer");

		// SWITCH CASE
		// Question 5
		System.out.println("Question 5");

		int x = group1.accounts.length;
		switch (x) {
		case 1:
			System.out.println("Nhóm có một thành viên");
			break;
		case 2:
			System.out.println("Nhóm có hai thành viên");
			break;
		case 3:
			System.out.println("Nhóm có ba thành viên");
			break;
		default:
			System.out.println("Nhóm có nhiều thành viên");
			break;
		}

		// Question 6
		System.out.println("Question 6");

		switch (account2.groups.length) {
		case 0:
			System.out.println("Nhân viên này chưa có group");
			break;
		case 1:
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			break;
		case 2:
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			break;
		case 3:
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
			break;
		default:
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
			break;
		}

		// Question 7
		System.out.println("Question 7");

		switch (account1.position.name.toString()) {
		case "DEV":
			System.out.println("Đây là Developer");
			break;
		default:
			System.out.println("Người này không phải là Developer");
			break;
		}

		// FOREACH
		// Question 8
		System.out.println("Question 8");
		Account[] accounts1 = { account1, account2, account3 };

		for (Account account : accounts1) {
			System.out.println("AccountID: " + account.id + " Email: " + account.email + " Name: " + account.fullName);
		}

		// Question 9
		System.out.println("Question 9");
		Department[] departments = { department1, department2, department3 };
		for (Department department : departments) {
			System.out.println("DepartmentID: " + department.id + " Name: " + department.name);
		}

		// FOR
		// Question 10
		System.out.println("Question 10");
		Account[] accounts = { account1, account2, account3 };

		for (int i = 0; i < accounts.length; i++) {
			// System.out.println(accounts[i]);
			System.out.println("Thông tin account thứ " + (i + 1) + " là : ");
			System.out.println("Email: " + accounts[i].email);
			System.out.println("Fullname: " + accounts[i].fullName);
			System.out.println("Phòng ban: " + accounts[i].department.name);
		}

		// Question 11
		System.out.println("Question 11");
		Department[] departments1 = { department1, department2, department3 };

		for (int i = 0; i < departments1.length; i++) {
			System.out.println("Thông tin department thứ " + (i + 1) + " là : ");
			System.out.println("Id: " + departments1[i].id + " Name: " + departments1[i].name);
		}

		// Question 12
		System.out.println("Question 12");
		Department[] departments2 = { department1, department2, department3 };

		for (int i = 0; i < departments2.length; i++) {
			if (i >= 2) {
				break;
			}
			System.out.println("Thông tin department thứ " + (i + 1) + " là : ");
			System.out.println("Id: " + departments2[i].id);
			System.out.println("name: " + departments2[i].name);
		}

		// Question 13
		System.out.println("Question 13");
		Account[] accounts2 = { account1, account2, account3 };

		for (int i = 0; i < accounts2.length; i++) {
			if (i != 1) {
				System.out.println("Thông tin account thứ " + (i + 1) + " là : ");
				System.out.println("Email: " + accounts2[i].email);
				System.out.println("Fullname: " + accounts2[i].fullName);
				System.out.println("Phòng ban: " + accounts2[i].department.name);
			}
		}

		// Question 14
		System.out.println("Question 14");
		Account[] accounts3 = { account1, account2, account3 };

		for (int i = 0; i < accounts3.length; i++) {
			if (accounts3[i].id < 4) {
				System.out.println("Thông tin account thứ " + (i + 1) + " là : ");
				System.out.println("Email: " + accounts3[i].email);
				System.out.println("Fullname: " + accounts3[i].fullName);
				System.out.println("Phòng ban: " + accounts3[i].department.name);
			}
		}

		// Question 15
		System.out.println("Question 15");

		for (int i = 1; i <= 20; i++) {
			if (i % 2 == 0) {
				System.out.print(i + " ");
			}
		}

		// WHILE
		// Question 16
		System.out.print("\n");
		System.out.println("Question 16 làm lại Q15");

		int i = 1;
		while (i <= 20) {
			if (i % 2 == 0) {
				System.out.print(i + " ");
			}
			i++;
		}

		// DO-WHILE
		// Question 17
		System.out.print("\n");
		System.out.println("Question 17 làm lại Q15");

		int i1 = 1;
		do {
			if (i1 % 2 == 0) {
				System.out.print(i1 + " ");
			}
			i1++;
		} while (i1 <= 20);

	}

}
