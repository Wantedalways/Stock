package com.qiheshengwu.stock.workbench.dao;

import com.qiheshengwu.stock.workbench.entity.Freezer;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface FreezerDao {

    /** 添加冷库数据
     * @param freezer 冷库对象
     * @return insert操作的返回值
     */
    int insertFreezer(Freezer freezer);

    /** 查询所有冷库信息
     * @return 所有的冷库数据
     */
    List<Freezer> selectAll();

}
