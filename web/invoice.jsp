<%-- 
    Document   : invoice
    Created on : 11-09-2016, 18:51:30
    Author     : Joacim
--%>

<%@page import="entity.Cupcake"%>
<%@page import="entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%List<Order> ul = (List<Order>) session.getAttribute("orderList");  
        int id = (Integer) session.getAttribute("id");
        List<Cupcake> cList = ul.get(0).getList();
        System.out.println(id);
        out.println("User: " + ul.get(0).toString());
        %><br><%
        for(Cupcake cake : cList){
            out.println("Cupcake");
            %><br><%
            out.println(cake);
            %><br><%
        }
       ; %>
    </body>
</html>
