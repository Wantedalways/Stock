package com.qiheshengwu.stock.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Wantedalways
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 验证登录令牌
        String token = "user";

        if (request.getSession().getAttribute(token) == null) {

            response.sendRedirect(request.getContextPath() + "/login.jsp");

            return false;
        }

        return true;

    }

}
