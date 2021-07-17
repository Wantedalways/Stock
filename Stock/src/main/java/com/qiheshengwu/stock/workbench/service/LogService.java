package com.qiheshengwu.stock.workbench.service;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.entity.Stock;

/**
 * @author Wantedalways
 */
public interface LogService {

    /** 修改库存数据的日志
     * @param newStock 新修改数据
     * @return 日志类
     * @throws IllegalAccessException 反射获取对象field
     */
    LogStock stockEditLog(Stock newStock) throws IllegalAccessException;

    /** 添加库存修改日志
     * @param logStock 日志对象
     * @return 添加结果
     * @throws DMLException 插入操作异常
     */
    boolean addLogStock(LogStock logStock) throws DMLException;

}
