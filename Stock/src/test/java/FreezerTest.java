import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.workbench.dao.FreezerDao;
import com.qiheshengwu.stock.workbench.entity.Freezer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:conf/applicationContext.xml"})
public class FreezerTest {

    @Resource
    private FreezerDao freezerDao;

    @Test
    public void test01() {

        Freezer freezer ;

        for (int i = 1;i <= 6;i ++) {

            freezer = new Freezer(UUIDUtil.getUUID(),"文昌湖","e11e45f3c9394abf969a68305b472519");

            freezerDao.insertFreezer(freezer);

        }

    }
}
