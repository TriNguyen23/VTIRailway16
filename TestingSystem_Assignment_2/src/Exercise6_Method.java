
public class Exercise6_Method {

	public static void main(String[] args) {

		question1();
		question3();
	}

	private static void question1() {
		System.out.println("Question 1");
		for (int i = 0; i < 10; i++) {
			if (i % 2 == 0) {
				System.out.print(i + " ");
			}
		}
		System.out.println("");
	}

	private static void question3() {
		System.out.println("Question 3");
		for (int i = 0; i < 10; i++) {
			System.out.print(i + " ");
		}
	}

}
