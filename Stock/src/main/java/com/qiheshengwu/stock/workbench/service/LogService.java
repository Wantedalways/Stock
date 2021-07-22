package com.qiheshengwu.stock.workbench.service;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.workbench.entity.LogStock;
import com.qiheshengwu.stock.workbench.entity.Stock;

import java.util.List;
import java.util.Map;

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


    /** 日志列表
     * @param pageNo 页码
     * @param pageSize 每页数据条数
     * @param parkName 园区名
     * @param editTime 修改时间
     * @return 日志集合
     */
    List<LogStock> logList(Integer pageNo, Integer pageSize, String parkName, String editTime);


    /** 日志总条数
     * @param parkName 园区名
     * @param editTime 修改时间
     * @return 数据总条数
     */
    Integer totalByCondition(String parkName, String editTime);


    /** 通过id获取日志信息
     * @param id 日志主键
     * @return 日志信息
     */
    Map<String,Object> getById(String id);


    /** 删除日志
     * @param id 日志id
     */
    void delById(String id) throws DMLException;


    /** 批量删除日志
     * @param id 日志主键
     * @return 删除操作结果
     * @throws DMLException 事务
     */
    boolean delBatch(String[] id) throws DMLException;
}
