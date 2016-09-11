package servlets;

import data.DB;
import entity.Bottom;
import entity.Order;
import entity.Topping;
import entity.Cupcake;
import entity.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joacim
 */
@WebServlet(name = "Front", urlPatterns = {"/Front"})
public class Front extends HttpServlet {

    DB db = new DB();
    String userName;
    String passWord;
    

    List<Order> orderList = new ArrayList();
    List<Cupcake> cupList = new ArrayList();
    List<User> bruger = new ArrayList();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        orderList = new ArrayList();
        cupList = new ArrayList();
        bruger = new ArrayList();
        List<String> usernames = new ArrayList();
        List<Topping> topping = new ArrayList();
        ArrayList<Bottom> bottom = new ArrayList();
        Boolean notLoggedIn = true;
        try {
            //TOPPING LIST
            ResultSet rsT = DB.getConnection().prepareStatement("SELECT * FROM topping").executeQuery();
            while (rsT.next()) {
                String top = rsT.getString(2);
                int price = rsT.getInt(3);
                topping.add(new Topping(top, price));
                request.getSession().setAttribute("topping", topping);
            }

            // BOTTOM LIST
            ResultSet rsB = DB.getConnection().prepareStatement("SELECT * FROM bottom").executeQuery();
            while (rsB.next()) {               
                String bottoms = rsB.getString(2);
                int price = rsB.getInt(3);
                bottom.add(new Bottom(bottoms, price));
                request.getSession().setAttribute("bottom", bottom);
            }

            userName = request.getParameter("username");
            passWord = request.getParameter("password");
            ResultSet rs = DB.getConnection().prepareStatement("SELECT username FROM login").executeQuery();
            while (rs.next()) {
                usernames.add(rs.getString("username"));
            }
            for (String user : usernames) {
                if (user.equalsIgnoreCase(userName)) {
                    ResultSet rs1 = DB.getConnection().prepareStatement("SELECT * FROM login WHERE username = " + "'" + userName + "'").executeQuery();
                    if (rs1.next()) {
                        int balance = rs1.getInt(4);
                        id = rs1.getInt(1);
                        userName = rs1.getString(2);
                        bruger.add(new User(userName, balance, id));
                        if (rs1.getString(3).equals(passWord)) {
                            request.getSession().setAttribute("user", bruger);
                            request.getSession().setAttribute("id", id);
                            request.getSession().setAttribute("balance", balance);
                            response.sendRedirect("shop.jsp");
                            notLoggedIn = false;
                        }
                    }
                }
            }
            if (notLoggedIn) {
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String buy = request.getParameter("buy");
        int topPrice = Integer.parseInt(request.getParameter("topPrice"));
        String topName = request.getParameter("topName");
        int botPrice = Integer.parseInt(request.getParameter("botPrice"));
        String botName = request.getParameter("botName");
        String username = request.getParameter("username");
        int i;
        int total = 0;
        for (i = 0; i < cupList.size(); i++) {
            total += cupList.get(i).getPrice();
        }
        if (buy.equals("true")) {
            orderList.add(new Order(bruger.get(0), cupList));
            request.getSession().setAttribute("orderList", orderList);
            Connection conn = db.getConnection();
            Statement stmt = null;
            try {
                stmt = conn.createStatement();
                String Balance = bruger.get(0).getBalance() - total + "";
                String sql = "UPDATE login SET balance = " + "'" + Balance + "'" + " WHERE username = " + "'" + username + "'";
                stmt.executeUpdate(sql);
                sql = "INSERT INTO invoice(user, items,price) VALUES('" + username + "', '" + cupList.toString() + "','" + total + "')";
                stmt.executeUpdate(sql);
            } catch (SQLException ex) {
                Logger.getLogger(Front.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("invoice.jsp");

        } else {
            Topping top = new Topping(topName, topPrice);
            Bottom bot = new Bottom(botName, botPrice);
            Cupcake cup = new Cupcake(top, bot, (bot.getPrice() + top.getPrice()));
            cupList.add(cup);
            response.sendRedirect("shop.jsp");
            request.getSession().setAttribute("size", i);
            request.getSession().setAttribute("total", total);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
