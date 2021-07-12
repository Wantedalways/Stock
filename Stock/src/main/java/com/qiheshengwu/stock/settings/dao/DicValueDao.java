package com.qiheshengwu.stock.settings.dao;

import com.qiheshengwu.stock.settings.entity.DicValue;

import java.util.List;

/**
 * @author Wantedalways
 */
public interface DicValueDao {

    /** 查找对应类型的数据字典值
     * @param code 数据字典类型代码
     * @return 对象类型的数据字典值
     */
    List<DicValue> selectByCode(String code);
}
