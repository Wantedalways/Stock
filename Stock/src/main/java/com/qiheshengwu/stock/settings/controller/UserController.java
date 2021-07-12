package com.qiheshengwu.stock.settings.controller;

import com.qiheshengwu.stock.exception.DMLException;
import com.qiheshengwu.stock.exception.LoginException;
import com.qiheshengwu.stock.settings.entity.User;
import com.qiheshengwu.stock.settings.service.UserService;
import com.qiheshengwu.stock.util.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Wantedalways
 */
@Controller
@RequestMapping(value = "/settings/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/login.do")
    @ResponseBody
    public Map<String,Boolean> login(String username, String password, HttpSession session) throws LoginException {

        // 验证用户名和密码
        User user = userService.login(username,MD5Util.getMD5(password));

        session.setAttribute("user",user);

        Map<String,Boolean> resultMap = new HashMap<>(1);
        resultMap.put("success",true);

        return resultMap;

    }

    @RequestMapping(value = "/password.do")
    @ResponseBody
    public Map<String,Boolean> password(String oldPwd, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        String password = user.getPassword();

        oldPwd = MD5Util.getMD5(oldPwd);

        boolean result = password.equals(oldPwd);

        Map<String,Boolean> resultMap = new HashMap<>(1);
        resultMap.put("success",result);

        return resultMap;

    }

    @RequestMapping(value = "/editPwd.do")
    @ResponseBody
    public Map<String,Boolean> editPwd(String newPwd,HttpServletRequest request) throws DMLException {

        User user = (User) request.getSession().getAttribute("user");
        String id = user.getId();

        newPwd = MD5Util.getMD5(newPwd);

        boolean result = userService.editPwd(newPwd,id);

        Map<String,Boolean> resultMap = new HashMap<>(1);
        resultMap.put("success",result);

        return resultMap;

    }
}
