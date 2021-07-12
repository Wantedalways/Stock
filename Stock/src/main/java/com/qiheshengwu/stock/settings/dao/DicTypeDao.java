package com.qiheshengwu.stock.settings.dao;

import com.qiheshengwu.stock.settings.entity.DicType;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface DicTypeDao {

    /** 查询数据字典类型
     * @return 返回所有的数据字典类型
     */
    List<DicType> selectAll();

}
