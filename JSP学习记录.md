### [JSP教程](https://www.runoob.com/jsp/jsp-tutorial.html)

1. JSP 与 PHP、ASP、ASP.NET 等语言类似，运行在服务端的语言。 JSP（全称Java Server Pages）是由 Sun Microsystems 公司倡导和许多公司参与共同创建的一种使软件开发者可以响应客户端请求，而动态生成 HTML、XML 或其他格式文档的Web网页的技术标准。 JSP 技术是以 Java 语言作为脚本语言的，JSP 网页为整个服务器端的 Java 库单元提供了一个接口来服务于HTTP的应用程序。 JSP文件后缀名为 *.jsp 。 JSP开发的WEB应用可以跨平台使用，既可以运行在 Linux 上也能运行在 Windows 上。
2. JSP全称Java Server Pages，是一种动态网页开发技术。它使用JSP标签在HTML网页中插入Java代码。标签通常以<%开头以%>结束。 JSP是一种Java servlet，主要用于实现Java web应用程序的用户界面部分。网页开发者们通过结合HTML代码、XHTML代码、XML元素以及嵌入JSP操作和命令来编写JSP。 JSP通过网页表单获取用户输入数据、访问数据库及其他数据源，然后动态地创建网页。 JSP标签有多种功能，比如访问数据库、记录用户选择信息、访问JavaBeans组件等，还可以在不同的网页中传递控制信息和共享信息。
3. [社区版IDEA配置JSP开发环境](https://www.cnblogs.com/Luquan/p/12273595.html)
4. Apache与Tomcat都是Apache开源组织开发的用于处理HTTP服务的项目，两者都是免费的，都可以做为独立的Web服务器运行。Apache是Web服务器而Tomcat是Java应用服务器。Apache服务器 只处理 静态HTML；tomcat服务器 静态HTML 动态 JSP Servlet 都能处理。一般是把 Apache服务器与tomcat服务器 搭配在一起用。 Apache服务器负责处理所有 静态的页面/图片等信息。Tomcat只处理动态的部分。
5. Tomcat运行在JVM之上，它和HTTP服务器一样，绑定IP地址并监听TCP端口，同时还包含以下指责：
    * 管理Servlet程序的生命周期
    * 将URL映射到指定的Servlet进行处理
    * 与Servlet程序合作处理HTTP请求——根据HTTP请求生成HttpServletResponse对象并传递给Servlet进行处理，将Servlet中的HttpServletResponse对象生成的内容返回给浏览器
6. 虽然Tomcat也可以认为是HTTP服务器，但通常它仍然会和Nginx配合在一起使用：
    * 动静态资源分离——运用Nginx的反向代理功能分发请求：所有动态资源的请求交给Tomcat，而静态资源的请求（例如图片、视频、CSS、JavaScript文件等）则直接由Nginx返回到浏览器，这样能大大减轻Tomcat的压力。
    * 负载均衡，当业务压力增大时，可能一个Tomcat的实例不足以处理，那么这时可以启动多个Tomcat实例进行水平扩展，而Nginx的负载均衡功能可以把请求通过算法分发到各个不同的实例进行处理
7. Java Servlet 是运行在 Web 服务器或应用服务器上的程序，它是作为来自 Web 浏览器或其他 HTTP 客户端的请求和 HTTP 服务器上的数据库或应用程序之间的中间层。
8. JSP生命周期就是从创建到销毁的整个过程，类似于servlet生命周期，区别在于JSP生命周期还包括将JSP文件编译成servlet。
   * 编译阶段： servlet容器编译servlet源文件，生成servlet类
   * 初始化阶段： 加载与JSP对应的servlet类，创建其实例，并调用它的初始化方法
   * 执行阶段： 调用与JSP对应的servlet实例的服务方法
   * 销毁阶段： 调用与JSP对应的servlet实例的销毁方法，然后销毁servlet实例
9. 基本语法
   * 脚本，任何文本、HTML 标签、JSP 元素必须写在脚本程序的外面
       <%
        //在这里编写你的Java代码
       %>
   * 声明，用于声明变量、方法，要写函数只能在这里面，必须先声明才可以使用
       <%!
        //Java
       %>
   * 表达式，表达式里面的代码可以不写分号
       <%= //Java %>
   * 注释
       <%-- 该部分注释在网页中不会被显示 --%>
       <!-- 该部分注释在网页源代码中会被显示 --> 
   * 指令
       <%@ page 页面属性 %>
       <%@ include 包含文件 %>
       <%@ taglib 标签 %>
10. 