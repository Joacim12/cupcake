<%-- 
    Document   : shop
    Created on : 08-09-2016, 16:29:42
    Author     : Joacim
--%>


<%@page import="entity.Bottom"%>
<%@page import="entity.Topping"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List u = (List<User>) session.getAttribute("user");

//check in database for user
    if (u == null) {
        response.sendRedirect("login.jsp");
        System.out.println("redirected user from shop");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>The Cupcake shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Cupcake Shoppen</a>
                </div>
                <ul class="nav navbar-nav">


                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> 

                            <%
                                
                                if (!(u == null)) {
                                    int id = (Integer) session.getAttribute("id");
                                    System.out.println(id);
                                    out.print("Hej: ");
                                    List ul = (List<User>) session.getAttribute("user");
                                    out.println(ul.get(0).toString());
                                }

                            %>
                        </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon glyphicon-usd"></span>
                            <%                  out.print(": ");
                                out.println(session.getAttribute("balance"));
                            %>           
                        </a></li>
                </ul>
            </div>
        </nav>
        <br>        <br>        <br>        <br>        <br>        <br> 
        <div class="container">

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <img src="resources/cupcake.jpg" alt=""/>
                </div>

                <div class="col-sm-2">
                    <br>          <br     <br>      <br>        <br>   <br> 
                    Vælg topping:
                    <br>          <br>
                    Vælg bund:                  
                </div>
                <div class="col-sm-2">
                    <br>    <br>       <br>  <br>         <br>    
                    <form action="Front" method="POST" id="theForm">
                        <select name="topping" id="topping" onchange="updatePriceTable()">
                            <%  ArrayList<Topping> topping = (ArrayList<Topping>) session.getAttribute("topping");
                                for (int i = 0; i < topping.size(); i++) {%>
                            <option>
                                <%out.print(topping.get(i).getTopping());%>
                            </option>     
                            <% } %>
                        </select>

                        <br>                    <br>
                        <select name="Bund" id="bottom" onchange="updatePriceTable()">
                            <%  ArrayList<Bottom> bottom = (ArrayList<Bottom>) session.getAttribute("bottom");
                                for (int i = 0; i < bottom.size(); i++) {%>
                            <option>
                                <%out.print(bottom.get(i).getBottom());%>
                            </option>     
                            <% } %>        
                            <%
                                int[] tPrice = new int[topping.size()];
                                for (int i = 0; i < topping.size(); i++) {
                                    tPrice[i] = topping.get(i).getPrice();
                                }
                                int[] bPrice = new int[bottom.size()];
                                for (int i = 0; i < bottom.size(); i++) {
                                    bPrice[i] = bottom.get(i).getPrice();
                                }

                            %>
                        </select>
                    </form>
                </div> <div class="col-sm-2"></div>
            </div>
            <div class="row">
                <div class="col-sm-2"></div>    
                <div class="col-sm-4"></div>    
                <div class="col-sm-4">
                    
                    <table class="table table-bordered" id="theTable">
                        <thead>
                            <tr>
                                <th>Topping</th>
                                <th>Bottom</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id= "topId" >5</td>
                                <td id = "botId">5</td>
                                <td id = "total" name = "totalPrice">10</td>
                            </tr>      
                        </tbody>
                    </table>
                    <form action="Front" method="POST" id="Form2">
                        <input type="hidden" name="topPrice" id="topPrice" value = "5"/>
                        <input type="hidden" name="topName" id="topName" value = "Chocolate"/>
                        <input type="hidden" name="botPrice" id="botPrice" value = "5"/>
                        <input type="hidden" name="botName" id="botName" value="Chocolate"/>
                        <input type="hidden" name="username" value="<%List<User> ul = (List<User>) session.getAttribute("user");  out.println(ul.get(0).getUsername());%>" />
                        <input type="hidden" name="userId" value="<%out.print(ul.get(0).getId());%>" />                        
                        <input type="hidden" name="credit" value="<%out.println(session.getAttribute("balance"));%>" />             
                        <input type="hidden" name="buy" value="empty" id="buy"/>  
                                              
                                           
                   </form>
                     <button class="btn btn-info" type="submit" id="addToCart" onclick="checkBalance()">Add to cart</button>  
                     
                     <table class="table table-bordered" id="Table2">
                         <h3>Shopping Cart</h3>
                        <thead>
                            <tr>
                                <th>Cupcakes:</th>
                                <th>Total:</th>                                
                            </tr>
                        </thead>
                        <tbody>
                        <script>
                            var total = <%=session.getAttribute("total")%>;
                            var amount = <%=session.getAttribute("size")%>; 
                            var tableBody = document.getElementById("Table2");
                            var row = tableBody.insertRow(1);
                            row.insertCell(0).innerHTML = amount;
                            row.insertCell(1).innerHTML = total;
                                    
                        </script>
                        </tbody>
                     </table>
                     <form action="Front" method="POST" id="Form3">
                         <button class="btn btn-warning" type="submit"onclick="buy()">Checkout and pay</button>  
                         <input type="hidden" name="topPrice" id="topPrice" value = "5"/>
                         <input type="hidden" name="topName" id="topName" value = "Chocolate"/>
                         <input type="hidden" name="botPrice" id="botPrice" value = "5"/>
                         <input type="hidden" name="botName" id="botName" value="Chocolate"/>
                         <input type="hidden" name="username" value="<%out.print(ul.get(0).getUsername());%>" />
                         <input type="hidden" name="userId" value="<%out.println(ul.get(0).getId());%>" />                        
                         <input type="hidden" name="credit" value="<%out.println(session.getAttribute("balance"));%>" />
                         <input type="hidden" name="buy" value="true" id="buy"/>  
                     </form>

                </div>    
                <div class="col-sm-2"></div>    
            </div>
        </div>



                        
    </body>
    
    <script>
                        var balance = 100;                       
                        balance -=  total;                       
                        var startAmount = 1;
                        var startTotalAmount = 0;
                        var priceU = 0;
                        
                        var form = document.getElementById("theForm");
                        var tPrices = [<%
                               for (int i = 0; i < topping.size(); i++) {
                                   out.println(topping.get(i).getPrice() + ",");
                               }
                        %>];
                        var bPrices = [<%
                                for (int i = 0; i < bottom.size(); i++) {
                                    out.println(bottom.get(i).getPrice() + ",");
                                }
                        %>];
                            
                        var updatePriceTable = function(){
                            var topping = document.getElementById("topping");                                
                            var bottom = document.getElementById("bottom");
                            var botPrice = bottom[bottom.selectedIndex].index;
                            var topPrice = topping[topping.selectedIndex].index;  
                            document.getElementById("topId").innerHTML = tPrices[topPrice];                            
                            document.getElementById("botId").innerHTML = bPrices[botPrice];
                            document.getElementById("total").innerHTML = bPrices[botPrice]+tPrices[topPrice];
                            document.getElementById("topPrice").value = tPrices[topPrice];
                            document.getElementById("topName").value = topping.value;
                            document.getElementById("botPrice").value = bPrices[botPrice];
                            document.getElementById("botName").value = bottom.value;
                        };


                        var checkBalance = function () { 
                            var topping = document.getElementById("topping");
                            var bottom = document.getElementById("bottom");
                            var botPrice = bottom[bottom.selectedIndex].index;
                            var topPrice = topping[topping.selectedIndex].index;
                            var price = tPrices[topPrice] + bPrices[botPrice];
                            var h = document.createElement("H5");
                            var t = document.createTextNode("Not enough credits");                            
                            h.appendChild(t);            
                            console.log(balance);
                            if (balance >=   price) {
                                balance -= price;                                                                  
                                startAmount ++;
                                var form = document.getElementById("Form2");
                                form.submit();
                            }else {
                                var form2 = document.getElementById("theForm");
                                form2.appendChild(h);                            
                                document.getElementById("addToCart").style.display = "none";
                                }; 
                        };
                        
                        var buy = function(){            
                            var x = document.getElementById("buy");
                            x.value = "true";                            
                            var form = document.getElementById("Form3");
                            form.submit();
                        };
                    </script>                  
</html>