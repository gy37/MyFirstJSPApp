<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<html>
<head>
<title>index.jsp</title>
</head>
<body>

<%!
    private int initVar = 0;
    private int serviceVar = 0;
    private int destroyVar = 0;
    int today = -1;
    int fontSize;
%>

<%!
    public void jspInit() {
        initVar ++;
        System.out.println("jspInit(): JSP被初始化了" + initVar + "次");
    }
    public void jspDestroy() {
        destroyVar ++;
        System.out.println("jspDestroy(): JSP被销毁了" + destroyVar + "次");
    }
%>

<%
    serviceVar ++;
    System.out.println("_jspService(): JSP共响应了" + serviceVar + "次请求");
    String content1 = "初始化次数 ：" + initVar;
    String content2 = "响应客户端请求次数：" + serviceVar;
    String content3 = "销毁次数：" + destroyVar;
%>

<h2>Hello World!</h2>
<p><%=content1 %></p>
<p><%=content2 %></p>
<p><%=content3 %></p>

<%
    out.println("你的 IP 地址 " + request.getRemoteAddr());
%>
<p>
    今天的日期是：<%= (new java.util.Date()).toLocaleString() %>
</p>

<%
    java.util.Calendar cal = java.util.Calendar.getInstance();
    today = cal.get(java.util.Calendar.DAY_OF_WEEK) - 1;
    out.println(today);
%>
<% if (today == 1 || today == 7) { %>
    <p>今天是周末</p>
<% } else { %>
    <p>今天不是周末</p>
<% } %>

<%
    switch(today) {
    case 0:
       out.println("星期日");
       break;
    case 1:
       out.println("星期一");
       break;
    case 2:
       out.println("星期二");
       break;
    case 3:
       out.println("星期三");
       break;
    case 4:
       out.println("星期四");
       break;
    case 5:
       out.println("星期五");
       break;
    case 6:
       out.println("星期六");
       break;
    default:
       out.println("未知");
    }
%>
<br />
<% for(fontSize = 1; fontSize <= 3; fontSize ++) { %>
    <font color="green" size="<%= fontSize %>">
    菜鸟教程
    </font>
    <br />
<% } %>

<jsp:useBean id="test" class="bean.TestBean" />
<jsp:setProperty name="test" property="message" value="菜鸟教程" />
<p>获取TestBean的值：</p>
<jsp:getProperty name="test" property="message" />

<%-- <jsp:forward page="test.jsp" /> --%>
<%--
<jsp:plugin type="applet" codebase="dirname" code="MyApplet.class" width="60" height="80">
    <jsp:param name="fontcolor" value="red" />
    <jsp:param name="background" value="black" />
    <jsp:fallback>Unable to initialize Java Plugin</jsp:fallback>
</jsp:plugin>
--%>

<br />
<jsp:element name="XMLElement">
    <jsp:attribute name="xmlElementAttr">
        属性值
    </jsp:attribute>
    <jsp:body>
        XML 元素的主体
    </jsp:body>
</jsp:element>

<jsp:text>Welcome to JSP Programming</jsp:text>

<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>Header Name</th><th>Header Value(s)</th>
</tr>
<%
    Enumeration headerNames = request.getHeaderNames();
    while (headerNames.hasMoreElements()) {
        String paramName = (String)headerNames.nextElement();
        out.print("<tr><td>" + paramName + "</td>\n");
        String paramValue = request.getHeader(paramName);
        out.print("<td>" + paramValue + "</td></tr>\n");
    }
%>
</table>

    <%-- response.setIntHeader("Refresh", 3); --%>
<%
    Calendar calendar = new GregorianCalendar();
    String am_pm;
    int hour = calendar.get(Calendar.HOUR);
    int minute = calendar.get(Calendar.MINUTE);
    int second = calendar.get(Calendar.SECOND);
    if (calendar.get(Calendar.AM_PM) == 0) {
        am_pm = "AM";
    } else {
        am_pm = "PM";
    }
    String CT = hour + ":" + minute + ":" + second + " " + am_pm;
    out.println("当前时间：" + CT + "\n");
%>

<%--
    response.sendError(404, "Not Found");
--%>
<ul>
    <li>
        <p><b>站点名：</b><%= request.getParameter("name") %></p>
    </li>
    <li>
        <p><b>网址：</b><%= request.getParameter("url") %></p>
    </li>
</ul>

<ul>
    <li>
        <p><b>Google是否选中：</b><%= request.getParameter("google") %></p>
    </li>
    <li>
        <p><b>菜鸟教程是否选中：</b><%= request.getParameter("runoob") %></p>
    </li>
    <li>
        <p><b>淘宝是否选中：</b><%= request.getParameter("taobao") %></p>
    </li>
</ul>

<%
    String str = URLEncoder.encode(request.getParameter("name"), "utf-8");
    Cookie name = new Cookie("name", str);
    Cookie url = new Cookie("url", request.getParameter("url"));
    name.setMaxAge(60*60*24);
    url.setMaxAge(60*60*24);

    response.addCookie(name);
    response.addCookie(url);
%>

<%
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies = request.getCookies();
    if (cookies != null) {
        out.println("<h2>查找Cookie名称和值</h2>");
        for(int i = 0; i < cookies.length; i ++) {
            cookie = cookies[i];
            if ((cookie.getName()).compareTo("name") == 0) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                out.print("删除 Cookie：" + cookie.getName() + "<br/>");
            }
            out.print("参数名：" + cookie.getName());
            out.print("<br>");
            out.print("参数值：" + URLDecoder.decode(cookie.getValue(), "utf-8") + " <br>");
            out.print("---------------------<br>");
        }
    } else {
        out.println("<h2>没有发现 Cookie</h2>");
    }
%>

<%
    Date createTime = new Date(session.getCreationTime());
    Date lastAccessTime = new Date(session.getLastAccessedTime());
    String title = "再次访问菜鸟教程示例";
    Integer visitCount = new Integer(0);
    String visitCountKey = new String("visitCount");
    String userIDKey = new String("userID");
    String userID = new String("ABCD");
    if (session.isNew()) {
        title = "访问菜鸟教程示例";
        session.setAttribute(userIDKey, userID);
        session.setAttribute(visitCountKey, visitCount);
    } else {
        visitCount = (Integer)session.getAttribute(visitCountKey);
        visitCount += 1;
        userID = (String)session.getAttribute(userIDKey);
        session.setAttribute(visitCountKey, visitCount);
    }
%>
<h1>Session 跟踪</h1>
<table border="1">
    <tr bgcolor="#949494">
        <th>Session 信息</th>
        <th>值</th>
    </tr>
    <tr>
        <td>id</td>
        <td><% out.print(session.getId()); %></td>
    </tr>
    <tr>
        <td>创建时间</td>
        <td><% out.print(createTime); %></td>
    </tr>
    <tr>
        <td>最后访问时间</td>
        <td><% out.print(lastAccessTime); %></td>
    </tr>
    <tr>
        <td>用户 ID</td>
        <td><% out.print(userID); %></td>
    </tr>
    <tr>
        <td>访问次数</td>
        <td><% out.print(visitCount); %></td>
    </tr>
</table>
<%
    session.invalidate();
%>
<%
    Date now = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    out.print("<h2 align=\"center\">" + format.format(now) + "</h2>");
%>
<%--
    String site = new String("http://www.runoob.com");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
--%>
<%
    Integer hitsCount = (Integer)application.getAttribute("hitCount");
    if (hitsCount == null || hitsCount == 0) {
        out.println("欢迎访问菜鸟教程！");
        hitsCount = 1;
    } else {
        out.println("欢迎再次访问菜鸟教程！");
        hitsCount += 1;
    }
    application.setAttribute("hitCount", hitsCount);
%>
<p>页面访问量为：<%= hitsCount %></p>
</body>
</html>
