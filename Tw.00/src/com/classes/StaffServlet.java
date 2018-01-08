package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StaffServlet", urlPatterns = "/StaffServlet")
public class StaffServlet extends HttpServlet {
    RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Drug> drugs = Database.getDrugs();
        int auxQ;
        String auxName;
        System.out.println(drugs);

        for(Drug x : drugs){
            auxName = x.getName() + "quantity";
            if(request.getParameter(auxName) != null) {
                System.out.println(auxName + "     " + request.getParameter(auxName));
                auxQ = Integer.parseInt(request.getParameter(auxName));
                if (auxQ != 0) {
                    x.setQuantity(auxQ);
                    Cart.addDrug(x);
                }
            }else System.out.println("MUIE " + auxName);
        }

        if(request.getParameter("addToCart") != null){
            System.out.println(Cart.getDrugs());
            rd = request.getRequestDispatcher("/staff/staff.jsp");
            rd.forward(request,response);
        }
        if(request.getParameter("checkoutButton") != null){
            drugs = Cart.getDrugs();
            System.out.println(drugs);
            for(Drug x : drugs){
                Database.checkoutDrug(x);
            }

            // redirect to bill page

            rd = request.getRequestDispatcher("/staff/staff.jsp");
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
