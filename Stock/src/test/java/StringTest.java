import org.junit.Test;

public class StringTest {

    @Test
    public void test01() {

        StringBuilder item = new StringBuilder(" ");
        item.deleteCharAt(item.length() - 1);

        System.out.println(item);
    }
}
