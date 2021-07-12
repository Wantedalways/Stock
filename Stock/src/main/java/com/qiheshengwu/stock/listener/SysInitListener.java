package com.qiheshengwu.stock.listener;

import com.qiheshengwu.stock.settings.service.DicService;
import javafx.scene.effect.SepiaTone;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Map;
import java.util.Set;

/**Spring容器监听器
 * @author Wantedalways
 */
public class SysInitListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        /*
            添加数据字典
        */
        // 获取全局作用域对象
        ServletContext application = servletContextEvent.getServletContext();

        // 通过spring容器对象获取DicService对象
        DicService dicService = WebApplicationContextUtils.getRequiredWebApplicationContext(application).getBean(DicService.class);

        Map<String,Object> dicMap = dicService.getDic();

        // 遍历添加
        Set<Map.Entry<String, Object>> dicSet = dicMap.entrySet();
        for (Map.Entry<String,Object> node : dicSet) {

            application.setAttribute(node.getKey(),node.getValue());

        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
