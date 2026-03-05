package com.example.flower.listener;

import com.example.flower.dao.TypeDao;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebListener
@Component
public class ApplicationListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    private TypeDao typeDao;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
        this.typeDao = context.getBean(TypeDao.class);
        sce.getServletContext().setAttribute("typeList", typeDao.getAllType());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 清理资源
    }

    // ------------------- HttpSessionListener 实现 -------------------
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* 保留空实现以兼容原有结构 */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* 保留空实现以兼容原有结构 */
    }

    // ------------------- HttpSessionAttributeListener 实现 -------------------
    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* 保留空实现以兼容原有结构 */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* 保留空实现以兼容原有结构 */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* 保留空实现以兼容原有结构 */
    }
}