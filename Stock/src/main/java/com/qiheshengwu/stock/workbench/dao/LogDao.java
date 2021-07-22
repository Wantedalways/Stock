package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface LogDao {

    /** 添加库存修改日志
     * @param logStock 日志对象
     * @return 插入操作返回值
     */
    int insertEditStockLog(LogStock logStock);


    /** 日志列表
     * @param parkName 园区名
     * @param editTime 修改时间
     * @return 日志集合
     */
    List<LogStock> logList(@Param("parkName") String parkName, @Param("editTime") String editTime);


    /** 日志总条数
     * @param parkName 园区名
     * @param editTime 修改时间
     * @return 数据总条数
     */
    Integer totalByCondition(@Param("parkName") String parkName, @Param("editTime") String editTime);

    /** 通过id获取日志信息
     * @param id 日志主键
     * @return 日志信息
     */
    LogStock selectById(String id);

    /** 删除日志
     * @param id 日志id
     * @return 删除操作结果
     */
    int deleteById(String id);

    /** 批量删除日志
     * @param id 日志主键
     * @return 删除操作结果
     */
    int deleteBatch(String[] id);
}
