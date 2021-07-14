import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.workbench.dao.StockDao;
import com.qiheshengwu.stock.workbench.entity.Stock;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:conf/applicationContext.xml"})
public class SqlTest {

    @Resource
    private StockDao stockDao;

    @Test
    public void test01() {

        List<Stock> sources = stockDao.selectSources();

        for (Stock stock : sources) {

            stock.setId(UUIDUtil.getUUID());

        }

        int result = stockDao.insertStock(sources);

        System.out.println(result);


    }

    @Test
    public void test02() {

        int result = stockDao.updateSources("文昌湖三车间","e11e45f3c9394abf969a68305b472519");

        System.out.println(result);

    }
}
