package com.example.flower.filter;

import com.example.flower.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@Order(1) // 在 LoginFilter 之后执行
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI();

        // 仅拦截 /admin/ 路径
        if (!path.startsWith(req.getContextPath() + "/admin/")) {
            chain.doFilter(request, response);
            return;
        }

        // 检查用户是否是管理员
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null && user.isIsadmin()) {
                chain.doFilter(request, response);
                return;
            }
        }

        res.sendRedirect(req.getContextPath() + "/user_login?error=admin_required");
    }
}