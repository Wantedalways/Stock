package com.qiheshengwu.stock.settings.dao;

import com.qiheshengwu.stock.settings.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author Wantedalways
 */
public interface UserDao {

    /**
     * 通过用户名查询，判断用户是否存在
     * @param username  用户名
     * @return  用户名唯一，返回查找到的用户
     */
    User selectUserByUsername(String username);

    /** 更新用户密码
     * @param newPwd 新密码
     * @return 更新结果
     */
    int updatePwd(@Param("password") String newPwd,@Param("id") String id);

}
