package com.example.flower.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@Order(1) // 最高优先级
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI();
        String contextPath = req.getContextPath();

        // 放行无需登录的路径
        if (path.equals("/") ||
                path.equals(contextPath + "/index") ||
                path.equals(contextPath + "/user_login") ||
                path.equals(contextPath + "/user_register") ||
                path.equals(contextPath + "/flowersrecommend_list") ||
                path.equals(contextPath + "/flowers_detail") ||
                path.equals(contextPath + "/flowers_search") ||
                path.equals(contextPath + "/flowers_list") ||
                path.startsWith(contextPath + "/user_check/") ||
                path.startsWith(contextPath + "/static/") ||
                path.startsWith(contextPath + "/css/") ||
                path.startsWith(contextPath + "/js/") ||
                path.startsWith(contextPath + "/picture/") ||
                path.startsWith(contextPath + "/fonts/") ||
                path.startsWith(contextPath + "/favicon.ico") ||
                path.startsWith(contextPath + "/layer/") ||
                path.startsWith(contextPath + "/images/")) {
            chain.doFilter(request, response);
            return;
        }

        // 检查是否已登录
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/user_login");
            return;
        }

        chain.doFilter(request, response);
    }
}