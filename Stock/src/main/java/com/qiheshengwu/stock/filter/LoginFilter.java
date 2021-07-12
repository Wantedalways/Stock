package com.qiheshengwu.stock.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Wantedalways
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // 获取访问路径
        String path = request.getServletPath();

        // 对登录界面放行
        String loginPath = "/login.jsp";

        if (loginPath.equals(path)) {

            filterChain.doFilter(request,response);

        } else {

            // 验证登录令牌
            String token = "user";

            if (request.getSession().getAttribute(token) == null) {

                response.sendRedirect(request.getContextPath() + loginPath);

            } else {

                filterChain.doFilter(request,response);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
