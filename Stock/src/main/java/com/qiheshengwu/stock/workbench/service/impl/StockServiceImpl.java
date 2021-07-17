package com.qiheshengwu.stock.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.dao.LogDao;
import com.qiheshengwu.stock.workbench.dao.StockDao;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.entity.Stock;
import com.qiheshengwu.stock.workbench.service.StockService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wantedalways
 */
@Service
public class StockServiceImpl implements StockService {

    @Resource
    private StockDao stockDao;

    @Resource
    private LogDao logDao;

    @Override
    public boolean addStock(List<Stock> stockList) throws DMLException {

        int result = stockDao.insertStock(stockList);

        if (stockList.size() != result) {

            throw new DMLException("库存录入失败！");

        }

        return true;
    }

    @Override
    public List<Stock> stockList(Integer pageNo, Integer pageSize, Stock stock) {

        PageHelper.startPage(pageNo,pageSize);

        return stockDao.selectStockList(stock);

    }

    @Override
    public Integer totalByCondition(Stock stock) {

        return stockDao.selectTotal(stock);
    }

    @Override
    public boolean delStock(String[] id) throws DMLException {

        int result = stockDao.deleteById(id);

        if (result != id.length) {

            throw new DMLException("删除失败！");

        }

        return true;
    }

    @Override
    public Stock getStockById(String id) {

        return stockDao.selectById(id);
    }

    @Override
    public void updateStock(Stock newStock, LogStock logStock) throws DMLException {

        // 修改库存信息
        int resultStock = stockDao.updateStock(newStock);

        if (resultStock != 1) {

            throw new DMLException("修改库存信息失败！");

        }

        // 添加日志
        int resultLog = logDao.insertEditStockLog(logStock);

        if (resultLog != 1) {

            throw new DMLException("库存日志保存失败！");

        }

    }


}
