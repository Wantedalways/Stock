import com.qiheshengwu.stock.util.DateUtil;
import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.workbench.entity.Stock;
import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {

    @Test
    public void test01() {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date startDate = null;
        Date endDate = null;

        try {
            startDate = simpleDateFormat.parse("2021-5-30");
            endDate = simpleDateFormat.parse("2021-7-6");

        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
        
        
    }

    @Test
    public void test02() {

        Stock stock = new Stock();
        stock.setId(UUIDUtil.getUUID());
        System.out.println(stock);
    }
}
