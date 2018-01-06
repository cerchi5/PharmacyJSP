package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;

@WebServlet(name = "CartPageServlet", urlPatterns = "/CartPageServlet")
public class CartPageServlet extends HttpServlet {
    RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("checkoutButton") != null){
            Cart.checkout();
            rd = request.getRequestDispatcher("/client/Home.jsp");
            rd.forward(request,response);
        }else
            {
            String aux;
            Drug x;
            Iterator<Drug> iterator = Cart.getDrugs().iterator();
            while (iterator.hasNext()) {
                x = iterator.next();
                aux = x.getName() + "button";
                if (request.getParameter(aux) != null) {
                    Cart.removeDrug(x);
                }
            }
            rd = request.getRequestDispatcher("/client/CartPage.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
