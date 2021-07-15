package com.qiheshengwu.stock.workbench.service;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.entity.Stock;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface StockService {

    /**库存信息录入
     * @param stockList 库存信息列表
     * @return 返回录入结果
     * @throws DMLException 插入失败则抛出异常，回滚事务
     */
    boolean addStock(List<Stock> stockList) throws DMLException;

    /** 条件查询库存信息
     *
     * @param pageNo 页码
     * @param pageSize 每页数据数量
     * @param stock 查询条件
     * @return 返回库存列表
     */
    List<Stock> stockList(Integer pageNo,Integer pageSize,Stock stock);

    /** 条件查询库存总条数
     * @param stock 查询条件
     * @return 符合条件的库存总条数
     */
    Integer totalByCondition(Stock stock);

    /**
     * 删除库存信息
     * @param id 库存主键
     * @return 删除执行结果
     */
    boolean delStock(String[] id) throws DMLException;
}
