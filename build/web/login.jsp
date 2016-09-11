<%-- 
    Document   : login
    Created on : 08-09-2016, 15:15:46
    Author     : Joacim
--%>

<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
List u = (List<User>) session.getAttribute("user");
//check in database for user
if(!(u==null)){
 response.sendRedirect("shop.jsp");
 System.out.println("redirected user from login");
 System.out.println(u);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" href="css/signin.css" >

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Velkommen</title>
    </head>
    <body>
        <div class="container">
                <h2 class="form-signin-heading"></h2>               
            <form action="Front" method="GET" class="form-signin">
                <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Brugernavn" required autofocus>               
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Kode" required>              
                <button class="btn btn-lg btn-primary btn-block" type="submit">Log ind</button>
            </form>
        </div>
    </body>
</html>
