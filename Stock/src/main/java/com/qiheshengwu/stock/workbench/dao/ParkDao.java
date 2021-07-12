package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.workbench.entity.Park;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface ParkDao {

    /** 查询所有园区
     * @return 返回所有的园区
     */
    List<Park> selectAll();
}
