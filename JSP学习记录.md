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
        //Java代码片段
       %>
   * 声明，用于声明变量、方法，必须先声明才可以使用
       <%!
        //声明Java变量
       %>
   * 表达式，先被转化成String，然后插入到表达式出现的地方，表达式里面的代码可以不写分号
       <%= //Java表达式 %>
   * 注释
       <%-- JSP注释，该部分注释在不会被编译 --%>
       <!-- HTML注释，该部分注释在网页源代码中可以查看 --> 
   * 指令，用来设置整个JSP页面相关的属性，如网页的编码方式和脚本语言。
       <%@ page 定义页面的依赖属性 %>
       <%@ include 包含文件 %>
       <%@ taglib 引入标签库的定义，可以是自定义标签 %>
   * 行为，使用XML语法控制servlet引擎，在请求处理阶段起作用
       <jsp:include 用于在当前页面中包含静态或动态文件 />
       <jsp:useBean 寻找和初始化一个JavaBean组件 />
       <jsp:setProperty 设置 JavaBean组件的值 />
       <jsp:getProperty 将 JavaBean组件的值插入到 output中 />
       <jsp:forward 从一个JSP文件向另一个文件传递一个包含用户请求的request对象 />
       <jsp:plugin 用于在生成的HTML页面中包含Applet和JavaBean对象 />
       <jsp:element 动态创建一个XML元素 />
       <jsp:attribute 定义动态创建的XML元素的属性 />
       <jsp:body 定义动态创建的XML元素的主体 />
       <jsp:text 用于封装模板数据 />
   * JSP隐含对象，支持9个自动定义的变量
       request	HttpServletRequest类的实例
       response	HttpServletResponse类的实例
       out	PrintWriter类的实例，用于把结果输出至网页上
       session	HttpSession类的实例
       application	ServletContext类的实例，与应用上下文有关
       config	ServletConfig类的实例
       pageContext	PageContext类的实例，提供对JSP页面所有对象以及命名空间的访问
       page	类似于Java类中的this关键字
       exception	exception 类的对象，代表发生错误的 JSP 页面中对应的异常对象
10. 中文显示乱码问题，需要在JSP文件头部添加代码：
    `<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>`
11. JSP 和 Servlet 中的过滤器都是 Java 类。过滤器可以动态地拦截请求和响应，以变换或使用包含在请求或响应中的信息。可以将一个或多个过滤器附加到一个 Servlet 或一组 Servlet。过滤器也可以附加到 JavaServer Pages (JSP) 文件和 HTML 页面。过滤器通过 Web 部署描述符（web.xml）中的 XML 标签来声明，然后映射到您的应用程序的部署描述符中的 Servlet 名称或 URL 模式。
12. 过滤器是一个实现了 javax.servlet.Filter 接口的 Java 类。javax.servlet.Filter 接口定义了三个方法：public void doFilter (ServletRequest, ServletResponse, FilterChain)；public void init(FilterConfig filterConfig)；public void destroy()；
13. web.xml配置节点，<filter>指定一个过滤器；<filter-mapping>元素用于设置一个 Filter 所负责拦截的资源。一个Filter拦截的资源可通过两种方式来指定：Servlet 名称和资源访问的请求路径；<servlet-name>指定过滤器所拦截的Servlet名称；
14. JSP设置cookie，1创建cookie对象，2设置有效期，3将cookie发送值HTTP响应头中；想要读取 cookie，您就需要调用 request.getCookies() 方法来获得一个 javax.servlet.http.Cookie 对象的数组，然后遍历这个数组，使用 getName() 方法和 getValue() 方法来获取每一个 cookie 的名称和值；想要删除 cookie，1获取一个已经存在的 cookie 然后存储在 Cookie 对象中，2将 cookie 的有效期设置为 0，3将这个 cookie 重新添加进响应头中；
15. [Cookie、Session、Token、JWT区别](https://zhuanlan.zhihu.com/p/164696755)；
    * HTTP 是无状态的协议（对于事务处理没有记忆能力，每次客户端和服务端会话完成时，服务端不会保存任何会话信息）：每个请求都是完全独立的，服务端无法确认当前访问者的身份信息，无法分辨上一次的请求发送者和这一次的发送者是不是同一个人。所以服务器与浏览器为了进行会话跟踪（知道是谁在访问我），就必须主动的去维护一个状态，这个状态用于告知服务端前后两个请求是否来自同一浏览器。而这个状态需要通过 cookie 或者 session 去实现。
    * cookie 存储在客户端： cookie 是服务器发送到用户浏览器并保存在本地的一小块数据，它会在浏览器下次向同一服务器再发起请求时被携带并发送到服务器上。cookie 是不可跨域的： 每个 cookie 都会绑定单一的域名，无法在别的域名下获取使用，一级域名和二级域名之间是允许共享使用的（靠的是 domain）。
    * session 是另一种记录服务器和客户端会话状态的机制，session 是基于 cookie 实现的，session 存储在服务器端，sessionId 会被存储到客户端的cookie 中，SessionID 是连接 Cookie 和 Session 的一道桥梁，大部分系统也是根据此原理来验证用户登录状态。
    * 每一次请求都需要携带 token，需要把 token 放到 HTTP 的 Header 里；基于 token 的用户认证是一种服务端无状态的认证方式，服务端不用存放 token 数据；用解析 token 的计算时间换取 session 的存储空间，从而减轻服务器的压力，减少频繁的查询数据库；token 完全由应用管理，所以它可以避开同源策略。
    * Session 是一种记录服务器和客户端会话状态的机制，使服务端有状态化，可以记录会话信息。而 Token 是令牌，访问资源接口（API）时所需要的资源凭证。Token 使服务端无状态化，不会存储会话信息。 Session 和 Token 并不矛盾，作为身份认证 Token 安全性比 Session 好，因为每一个请求都有签名还能防止监听以及重放攻击，而 Session 就必须依赖链路层来保障通讯安全了。如果你需要实现有状态的会话，仍然可以增加 Session 来在服务器端保存一些状态。
16. 