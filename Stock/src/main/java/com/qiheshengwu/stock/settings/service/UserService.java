package com.qiheshengwu.stock.settings.service;


import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.exception.LoginException;
import com.qiheshengwu.stock.settings.entity.User;

/**
 * @author Wantedalways
 */
public interface UserService {

    /** 验证用户登录合法性的方法
     * @param username 用户名
     * @param password 密码
     * @throws LoginException 登录验证异常
     * @return 返回登录的用户对象
     */
    User login(String username, String password) throws LoginException;

    /** 修改密码
     * @param newPwd 新密码
     * @return 修改结果
     */
    boolean editPwd(String newPwd,String id) throws DMLException;

}
