<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>life.jsp</title>
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
</body>
</html>
