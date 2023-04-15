<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*, javax.mail.*" %>
<%@ page import="javax.mail.internet.*, javax.activation.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String result;
    String to = "805331263@qq.com";
    String from = "a@139.com";
    String server = "smtp.139.com";
    String password = "";
    Properties properties = System.getProperties();
    properties.setProperty("mail.transport.protocol", "smtp");
    properties.setProperty("mail.smtp.host", server);
    properties.setProperty("mail.smtp.auth", "true");
    Session mailSession = Session.getDefaultInstance(properties);

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("This is the Subject Line!");
        message.setText("This is actual message");

        Transport transport = mailSession.getTransport("smtp");
        transport.connect(server, from, password);
        Transport.send(message);
        result = "Sent message successfully...";
    } catch (MessagingException e) {
        e.printStackTrace();
        result = "Error: unable tot send message...";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<%
    out.println("Result: " + result + "\n");
%>
</body>
</html>