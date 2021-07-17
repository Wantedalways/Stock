package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.workbench.entity.LogStock;

/**
 * @author Wantedalways
 */
public interface LogDao {

    /** 添加库存修改日志
     * @param logStock 日志对象
     * @return 插入操作返回值
     */
    int insertEditStockLog(LogStock logStock);
}
