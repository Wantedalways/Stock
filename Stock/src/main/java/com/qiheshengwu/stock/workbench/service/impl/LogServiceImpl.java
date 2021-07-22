package com.qiheshengwu.stock.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.settings.dao.DicTypeDao;
import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.workbench.dao.LogDao;
import com.qiheshengwu.stock.workbench.dao.StockDao;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.entity.Stock;
import com.qiheshengwu.stock.workbench.service.LogService;
import com.qiheshengwu.stock.workbench.service.StockService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Wantedalways
 */
@Service
public class LogServiceImpl implements LogService {

    @Resource
    private StockDao stockDao;

    @Resource
    private LogDao logDao;

    @Resource
    private DicTypeDao dicTypeDao;

    @Override
    public LogStock stockEditLog(Stock newStock) throws IllegalAccessException {

        // 获取修改前数据
        Stock oldStock = stockDao.selectSingle(newStock.getId());

        // 通过反射获取对象的field数组
        Class<? extends Stock> oldClass = oldStock.getClass();
        Class<? extends Stock> newClass = newStock.getClass();

        Field[] oldFields = oldClass.getDeclaredFields();
        Field[] newFields = newClass.getDeclaredFields();

        // 遍历field对比数据差异
        StringBuilder item = new StringBuilder(" ");
        StringBuilder oldData = new StringBuilder(" ");
        StringBuilder newDate = new StringBuilder(" ");

        // 布尔标记,false表示数据未修改，则返回空日志对象
        boolean flag = false;

        for (int i = 1;i < oldFields.length;i ++) {

            oldFields[i].setAccessible(true);
            newFields[i].setAccessible(true);

            Object oldField = "";
            if (oldFields[i].get(oldStock) != null) {

                oldField = oldFields[i].get(oldStock);

            }

            Object newField = "";
            if (newFields[i].get(newStock) != null) {

                newField = newFields[i].get(newStock);

            }

            // 前后数据不一致则形成字段和数据
            if (!oldField.equals(newField)) {

                // 布尔标记为true，则返回对应的日志对象
                flag = true;

                item.append(oldFields[i].getName()).append(" ;");
                oldData.append(oldField).append(" ;");
                newDate.append(newField).append(" ;");

            }

            oldFields[i].setAccessible(false);
            newFields[i].setAccessible(false);

        }

        if (flag) {

            // 去除字段和数据最后的;
            item.deleteCharAt(item.length() - 1);
            oldData.deleteCharAt(oldData.length() - 1);
            newDate.deleteCharAt(newDate.length() - 1);

            LogStock logStock = new LogStock();
            logStock.setId(UUIDUtil.getUUID());
            logStock.setStockId(newStock.getId());
            logStock.setItem(String.valueOf(item));
            logStock.setOldData(String.valueOf(oldData));
            logStock.setNewData(String.valueOf(newDate));

            return logStock;

        }

        return null;
    }

    @Override
    public boolean addLogStock(LogStock logStock) throws DMLException {

        int result = logDao.insertEditStockLog(logStock);

        if (result != 1) {

            throw new DMLException("添加修改日志失败！");

        }

        return true;
    }

    @Override
    public List<LogStock> logList(Integer pageNo, Integer pageSize, String parkName, String editTime) {

        PageHelper.startPage(pageNo,pageSize);

        return logDao.logList(parkName,editTime);
    }

    @Override
    public Integer totalByCondition(String parkName, String editTime) {

        return logDao.totalByCondition(parkName,editTime);

    }

    @Override
    public Map<String,Object> getById(String id) {

        LogStock logStock = logDao.selectById(id);
        Stock stock = stockDao.selectById(logStock.getStockId());

        String[] itemsTemp = logStock.getItem().split(";");

        String[] namesTemp = new String[itemsTemp.length];
        for (int i = 0;i < itemsTemp.length;i ++) {

            namesTemp[i] = dicTypeDao.selectName(itemsTemp[i].trim());

        }
        String[] oldDataTemp = logStock.getOldData().split(";");
        String[] newDataTemp = logStock.getNewData().split(";");

        Map<String,Object> resultMap = new HashMap<>(5);
        resultMap.put("logStock",logStock);
        resultMap.put("stock",stock);
        resultMap.put("names",Arrays.asList(namesTemp));
        resultMap.put("oldData",Arrays.asList(oldDataTemp));
        resultMap.put("newData",Arrays.asList(newDataTemp));

        return resultMap;
    }

    @Override
    public void delById(String id) throws DMLException {

        int result = logDao.deleteById(id);

        if (result != 1) {

            throw new DMLException("删除日志失败！");

        }
    }

    @Override
    public boolean delBatch(String[] id) throws DMLException {

        int result = logDao.deleteBatch(id);

        if (result != id.length) {

            throw new DMLException("删除失败！");

        }

        return true;
    }
}
