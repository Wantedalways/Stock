package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.workbench.entity.Stock;
import org.apache.ibatis.annotations.Param;

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

    /** 修改园区关联
     * @param park 园区名
     * @param parkId 园区id
     * @return 更新记录条数
     */

    int updateSources(@Param("park") String park, @Param("parkId") String parkId);

    /** 查询汇总数据
     * @return 数据源
     */
    List<Stock> selectSources();

    /**
     * 删除库存信息
     * @param ids 库存主键
     * @return 删除记录条数
     */
    int deleteById(String[] ids);

    /** 查询单条库存记录
     * @param id 库存主键
     * @return 对应的库存记录
     */
    Stock selectById(String id);

    /** 通过id查询单条库存，不替换园区id
     * @param id 库存id
     * @return 库存信息
     */
    Stock selectSingle(String id);


    /** 修改库存信息
     * @param newStock 修改后数据
     * @return 修改操作返回值
     */
    int updateStock(Stock newStock);
}
