import java.time.LocalDate;
import java.util.Arrays;

public class Group {
	int id;
	String name;
	Account creator;
	LocalDate createDate;
	Account[] accounts;
	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate
				+ ", accounts=" + Arrays.toString(accounts) + "]";
	}
}
