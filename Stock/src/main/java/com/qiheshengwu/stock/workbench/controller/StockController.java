package com.qiheshengwu.stock.workbench.controller;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.settings.entity.User;
import com.qiheshengwu.stock.util.DateUtil;
import com.qiheshengwu.stock.util.UUIDUtil;
import com.qiheshengwu.stock.vo.PageListVo;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.entity.Stock;
import com.qiheshengwu.stock.workbench.service.LogService;
import com.qiheshengwu.stock.workbench.service.StockService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Wantedalways
 */
@Controller
@RequestMapping(value = "/workbench/stock")
public class StockController {

    @Resource
    private StockService stockService;

    @Resource
    private LogService logService;

    /**
     * 添加库存信息
     * @param stocks 库存批量数据
     * @return 返回录入成功的信息
     * @throws ParseException 日期转换异常
     * @throws DMLException 抛出DML语句异常，事务回滚
     */
    @RequestMapping(value = "/add.do")
    @ResponseBody
    public Map<String,Object> addStock(@RequestBody List<Stock> stocks) throws ParseException, DMLException {

        for (Stock stock : stocks) {

            stock.setId(UUIDUtil.getUUID());
            stock.setDateCurrent(DateUtil.getSimpleDate());
            stock.setAccountAge(DateUtil.getSubtractDate(stock.getDateTag(),stock.getDateCurrent()));

        }

        boolean result = stockService.addStock(stocks);

        Map<String,Object> resultMap = new HashMap<>(2);

        resultMap.put("success",result);
        resultMap.put("message","库存录入成功，共" + stocks.size() + "条数据");

        return resultMap;
    }

    /**
     * 库存信息列表
     * @param pageNo 页码
     * @param pageSize 每页数据数量
     * @param stock 查询条件
     * @return 返回条件查询的库存列表和总数据量
     */
    @RequestMapping(value = "/list.do")
    @ResponseBody
    public PageListVo<Stock> stockList(Integer pageNo, Integer pageSize, Stock stock) throws ParseException {

        List<Stock> stockList = stockService.stockList(pageNo,pageSize,stock);

        for (Stock s : stockList) {

            s.setDateCurrent(DateUtil.getSimpleDate());
            s.setAccountAge(DateUtil.getSubtractDate(s.getDateTag(),s.getDateCurrent()));

        }

        Integer total = stockService.totalByCondition(stock);

        PageListVo<Stock> result = new PageListVo<>();
        result.setTotal(total);
        result.setDataList(stockList);

        return result;
    }

    /**
     * 删除库存信息
     * @param id 库存主键
     * @return 删除执行结果和通知
     */
    @RequestMapping(value = "/del.do")
    @ResponseBody
    public Map<String, Object> delStock(String[] id) throws DMLException {

        boolean result = stockService.delStock(id);

        Map<String,Object> resultMap = new HashMap<>(2);
        resultMap.put("success",result);
        resultMap.put("message","删除成功，共" + id.length + "条数据！");

        return resultMap;
    }

    /**
     * 查询单条库存记录
     * @param id 库存主键
     * @return 对应的库存记录
     */
    @RequestMapping(value = "/get.do")
    @ResponseBody
    public Stock getStockById(String id) {

        return stockService.getStockById(id);

    }

    /**
     * 修改库存信息
     * @param newStock 修改后数据
     * @return 返回修改结果
     */
    @RequestMapping(value = "/update.do")
    @ResponseBody
    public Map<String,Object> updateStock(Stock newStock, HttpServletRequest request) throws IllegalAccessException, DMLException, ParseException {

        newStock.setDateCurrent(DateUtil.getSimpleDate());
        newStock.setAccountAge(DateUtil.getSubtractDate(newStock.getDateTag(),newStock.getDateCurrent()));
        // 形成修改日志
        LogStock logStock = logService.stockEditLog(newStock);

        User user = (User) request.getSession().getAttribute("user");

        Map<String,Object> resultMap = new HashMap<>(2);

        // 判断数据是否更改
        if (logStock != null) {

            // 填充日志数据
            logStock.setEditBy(user.getId() + "-" + user.getName() + "-" + user.getParkId());
            logStock.setEditTime(DateUtil.getDate());

            // 修改数据并添加日志
            stockService.updateStock(newStock,logStock);

            resultMap.put("success",true);
            resultMap.put("message","库存信息修改成功！");

        } else {

            resultMap.put("success",false);
            resultMap.put("message","库存信息未修改！");

        }

        return resultMap;
    }
}
