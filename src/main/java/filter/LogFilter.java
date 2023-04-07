package filter;
import javax.servlet.*;
import java.io.IOException;
import java.util.*;

public class LogFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
        String site = config.getInitParameter("Site");
        System.out.println("网站名称：" + site);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("站点网址：https://www.runoob.com");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
