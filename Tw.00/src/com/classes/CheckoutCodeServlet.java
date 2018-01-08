package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CheckoutCodeServlet", urlPatterns = "/CheckoutCodeServlet")
public class CheckoutCodeServlet extends HttpServlet {
    RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("checkoutCode") != null){
            ArrayList<Drug> drugs = Cart.getDrugs();
            System.out.println(drugs);
            for(Drug x : drugs){
                Database.checkoutDrug(x);
            }

            //delete file JSON
            JSONcreator.deleteJSON();
            // inca nu

            //print bill

            request.setAttribute("resultList",null);
            rd = request.getRequestDispatcher("/staff/staff.jsp");
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
