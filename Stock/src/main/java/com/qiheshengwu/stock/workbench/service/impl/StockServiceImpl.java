package com.qiheshengwu.stock.workbench.service.impl;

import com.github.pagehelper.PageHelper;
import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.dao.StockDao;
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


}
