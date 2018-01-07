package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "com.classes.SearchClientServlet", urlPatterns = "/SearchClientServlet")
public class SearchClientServlet extends HttpServlet {
    RequestDispatcher rd;
    Database db;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //inca nu !!!!
        if(request.getParameter("addButton") != null){
            // add products to cart
            //ArrayList<Drug> drugs = (ArrayList<Drug>) request.getAttribute("resultList");
            String auxName;
            int auxInt;
            HttpSession session = request.getSession();
            ArrayList<Drug> drugs = (ArrayList<Drug>) session.getAttribute("resultList");
            //System.out.println(drugs);
            for(Drug x : drugs){
                auxName = x.getName() + "quantity";
                //System.out.println(auxName + "     " + request.getParameter(auxName));
                auxInt = Integer.parseInt(request.getParameter(auxName));
                if(auxInt != 0){
                    x.setQuantity(auxInt);
                    Cart.addDrug(x);
                }
            }

            rd = request.getRequestDispatcher("/client/Home.jsp");
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
