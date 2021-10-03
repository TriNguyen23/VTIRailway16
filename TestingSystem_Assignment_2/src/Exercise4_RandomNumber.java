import java.time.LocalDate;
import java.util.Random;

public class Exercise4_RandomNumber {

	public static void main(String[] args) {

		Random random = new Random();

		// Question 1
		System.out.println("Question 1");

		int n = random.nextInt();
		System.out.println("Số nguyên ngẫu nhiên: " + n);

		// Question 2
		System.out.println("Question 2");

		float f = random.nextFloat();
		System.out.println("Số thực ngẫu nhiên: " + f);

		// Question 3
		System.out.println("Question 3");
		String[] namStrings = { "A", "B", "D", "E", "F" };
		int i = random.nextInt(namStrings.length);
		System.out.println("Tên ngẫu nhiên 1 bạn trong lớp: " + namStrings[i]);

		// Question 4
		System.out.println("Question 4");
		int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay();
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
		System.out.println("minday:" + minDay);
		System.out.println("maxday:" + maxDay);
		long randomInt = minDay + random.nextInt(maxDay - minDay);
		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
		System.out.println(randomDay);

		// Question 5
		System.out.println("Question 5");
		int now = (int) LocalDate.now().toEpochDay();
		int randomDate = now - random.nextInt(365);
		LocalDate reusultDate = LocalDate.ofEpochDay(randomDate);
		System.out.println("Ngày ngẫu nhiên là: " + reusultDate);

		// Question 6
		System.out.println("Question 6");

		int maxDay1 = (int) LocalDate.now().toEpochDay();
		long randomDay1 = random.nextInt(maxDay1);
		LocalDate resultDate1 = LocalDate.ofEpochDay(randomDay1);
		System.out.println("1 Ngày ngẫu nhiên trong quá khứ: " + resultDate1);

		// Question 7
		System.out.println("Question 7");

		int z = random.nextInt(999 - 100 + 1) + 100;
		System.out.println(z);
	}

}
