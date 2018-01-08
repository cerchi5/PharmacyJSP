package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by cerch on 08-Jan-18.
 */
@WebServlet(name = "OrderDrugsServlet", urlPatterns = "/OrderDrugsServlet")
public class OrderDrugsServlet extends HttpServlet {
    RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("orderDrugs") != null){
            ArrayList<Drug> drugs = Database.getDrugs();
            ArrayList<Drug> order = new ArrayList<Drug>();

            for(Drug x : drugs){
                int auxQ = Integer.parseInt(request.getParameter(x.getName() + "quantity"));
                if(auxQ != 0){
                    x.setQuantity(auxQ);
                    order.add(x);
                }
            }

            // send email with order and increment stock in db
        }
        rd = request.getRequestDispatcher("/staff/staff.jsp");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
