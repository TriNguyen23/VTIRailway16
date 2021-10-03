import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Exercise2_SystemOutPrintf {

	public static void main(String[] args) {

		// Question 1
		System.out.println("Question 1");
		int i = 5;
		System.out.printf("integer : %d%n", i);

		// Question 2
		System.out.println("Question 2");
		int i1 = 100000000;
		System.out.printf(Locale.US, "integer : %,d%n", i1);

		// Question 3
		System.out.println("Question 3");
		float i2 = 5.567098f;
		System.out.printf("float : %.4f%n", i2);

		// Question 4
		System.out.println("Question 4");
		String t = "Nguyễn Văn A";
		System.out.printf("Tên tôi là \"" + t + "\" và tôi đang độc thân \n");

		// Question 5
		System.out.println("Question 5");
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);

		// Question 6

	}

}
