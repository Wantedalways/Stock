import com.qiheshengwu.stock.workbench.dao.LogDao;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.service.LogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:conf/applicationContext.xml"})
public class LogTest {

    @Resource
    private LogDao logDao;

    @Resource
    private LogService logService;

    @Test
    public void test01() {

        LogStock logStock = logDao.selectById("030bfac5a9cc4bc6b50bb91df3c99a9f");

        String[] split = logStock.getItem().split(";");
        String[] split1 = logStock.getOldData().split(";");
        String[] split2 = logStock.getNewData().split(";");

        for (int i = 0;i < split.length;i ++) {

            System.out.println(split[i] + ":" + split1[i] + "-->" + split2[i]);

        }
        List<String> strings = Arrays.asList(split);

        for (String string : strings) {
            System.out.println(string);
        }
    }

    @Test
    public void test02() {

        Map<String, Object> map = logService.getById("a2363c67637f4111aad9e81ab4a6d2dd");

        String[] names = (String[]) map.get("names");

        for (String name :names) {
            System.out.println(name);
        }
    }
}
