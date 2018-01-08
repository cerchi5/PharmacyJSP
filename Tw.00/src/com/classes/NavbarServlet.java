package com.classes;

import com.classes.CurrentUser;
import com.classes.Database;
import com.classes.Drug;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "com.classes.NavbarServlet", urlPatterns = "/NavBarServlet")
public class NavbarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd;

        //Search Drugs client
        if(request.getParameter("searchDrugs") != null){
            rd = request.getRequestDispatcher("/client/SearchClient.jsp");
            //System.out.println("Go to SearchClient.jsp");
            request.setAttribute("currentUser", CurrentUser.getCurrentUser());
            String field = request.getParameter("searchField");

            if(field.compareTo("") != 0){
                String aux = request.getParameter("searchField").toLowerCase();
                if(Database.verifyDrug(aux) != null) {
                    ArrayList<Drug> x = Database.verifyDrug(aux);
                    //System.out.println(x);
                    request.setAttribute("resultList",x);
                }
            }else{
                rd = request.getRequestDispatcher("/client/Home.jsp");
                rd.forward(request,response);
            }

            rd.forward(request,response);
        }

        //Search Drugs Staff
        if(request.getParameter("searchDrugsStaff") != null){
            rd = request.getRequestDispatcher("/staff/staff.jsp");
            String field = request.getParameter("searchFieldStaff");

            if(field.compareTo("") != 0){
                String aux = request.getParameter("searchFieldStaff").toLowerCase();
                if(Database.verifyDrug(aux) != null) {
                    ArrayList<Drug> x = Database.verifyDrug(aux);
                    //System.out.println(x);
                    request.setAttribute("resultList",x);
                }
            }else{
                request.setAttribute("resultList",null);
                rd.forward(request,response);
            }

            rd.forward(request,response);
        }

        // Verify code
        if(request.getParameter("verifyCode") != null){
            rd = request.getRequestDispatcher("/client/VerifyCode.jsp");
            rd.forward(request,response);
        }

        // Verify code staff
        if(request.getParameter("verifyCodeStaff") != null){
            rd = request.getRequestDispatcher("/staff/CheckoutCode.jsp");
            rd.forward(request,response);
        }

        // Order drugs
        if(request.getParameter("orderDrugs") != null){
            rd = request.getRequestDispatcher("/staff/OrderDrugs.jsp");
            rd.forward(request,response);
        }

        // Discounts
        if(request.getParameter("discountButton") != null){
            rd = request.getRequestDispatcher("/staff/discounts.jsp");
            rd.forward(request,response);
        }

        // Cart
        if(request.getParameter("cartButton") != null){
            rd = request.getRequestDispatcher("/client/CartPage.jsp");
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
