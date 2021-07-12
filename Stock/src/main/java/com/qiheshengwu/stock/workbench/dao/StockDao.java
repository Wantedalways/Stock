package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.workbench.entity.Stock;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface StockDao {

    /** 添加库存记录
     * @return 返回插入的记录条数
     * @param list 库存集合
     */
    int insertStock(List<Stock> list);

    /** 条件查询库存信息
     * @param stock 查询条件
     * @return 库存列表
     */
    List<Stock> selectStockList(Stock stock);

    /** 条件查询库存总条数
     * @param stock 查询条件
     * @return 符合条件的库存总条数
     */
    int selectTotal(Stock stock);
}
