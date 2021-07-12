
import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.workbench.dao.StockDao;
import com.qiheshengwu.stock.workbench.entity.Stock;
import com.qiheshengwu.stock.workbench.service.StockService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:conf/applicationContext.xml"})
public class StockTest {

    @Resource
    private StockService stockService;

    @Resource
    private StockDao stockDao;

    @Test
    public void test01() {

        List<Stock> stockList = new ArrayList<>();

        Stock stock;

        for (int i = 0;i < 5;i ++) {

            stock = new Stock();

            stock.setId(UUIDUtil.getUUID());

            stockList.add(stock);

        }

        boolean result = false;
        try {
            result = stockService.addStock(stockList);
        } catch (DMLException e) {
            e.printStackTrace();
        }

        System.out.println(result);

    }

    @Test
    public void test02() {

        Stock stock = new Stock();
        stock.setParkId("869e9e3fb47141d5a5c56c885a08c4b5");


        List<Stock> stockList = stockDao.selectStockList(stock);

        for (Stock s : stockList) {

            System.out.println(s);

        }
    }

    @Test
    public void test03() {

        Stock stock = new Stock();
        stock.setParkId("869e9e3fb47141d5a5c56c885a08c4b5");


        int result = stockDao.selectTotal(stock);

        System.out.println(result);
    }
}
