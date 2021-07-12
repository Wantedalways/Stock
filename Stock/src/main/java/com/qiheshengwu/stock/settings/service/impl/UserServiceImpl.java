package com.qiheshengwu.stock.settings.service.impl;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.exception.LoginException;
import com.qiheshengwu.stock.settings.dao.UserDao;
import com.qiheshengwu.stock.settings.entity.User;
import com.qiheshengwu.stock.settings.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Wantedalways
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User login(String username, String password) throws LoginException {

        // 查询用户是否存在
        User user = userDao.selectUserByUsername(username);

        if (user == null) {

            throw new LoginException("用户不存在！");

        }

        if (!password.equals(user.getPassword())) {

            throw new LoginException("密码错误！");

        }

        return user;

    }

    @Override
    public boolean editPwd(String newPwd,String id) throws DMLException {

        int result = userDao.updatePwd(newPwd,id);

        if (result != 1) {

            throw new DMLException("修改失败，请再次尝试或联系管理员！");

        }

        return true;
    }
}
