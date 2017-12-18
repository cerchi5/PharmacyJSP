package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "com.classes.IndexServlet",urlPatterns ="/IndexServlet")
public class IndexServlet extends HttpServlet {

    Database db = new Database();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rdStay = request.getRequestDispatcher("/index.jsp");
        RequestDispatcher rdGo = request.getRequestDispatcher("/Home.jsp");

        if(request.getParameter("loginButton") != null){

            Cart.resetDrugs();
            Cart.resetTotal();

            String user = request.getParameter("emailLogin"), pass = request.getParameter("passwordLogin");
            //System.out.println(user + "   " + pass);

            if(db.verifyUser(user,pass)){

                CurrentUser.setCurrentUser(user);
                //System.out.println(CurrentUser.username);
                if(db.verifyStaff(user,pass)) {
                    request.setAttribute("currentUser", CurrentUser.getCurrentUser());
                    rdGo = request.getRequestDispatcher("/staff.jsp");
                    rdGo.forward(request, response);
                }
                request.setAttribute("currentUser",CurrentUser.getCurrentUser());
                rdGo.forward(request, response);
                // forward next page
            }else{
                request.setAttribute("active",null);
                rdStay.forward(request,response);
            }

        } else if(request.getParameter("registerButton") != null){

            String email = request.getParameter("emailRegister");

            if(db.searchEmail(email)){
                request.setAttribute("errorMessage", "Email already exists");
                request.setAttribute("active"," active open");
                rdStay.forward(request, response);
            }else {
                if (request.getParameter("passwordRegister").compareTo(request.getParameter("confirmPasswordRegister")) != 0){
                    request.setAttribute("errorMessage", "Passwords aren't the same");
                    request.setAttribute("active"," open");
                    rdStay.forward(request, response);
                }
                else{
                    //ok register

                    db.addUser(email,request.getParameter("passwordRegister"));
                    CurrentUser.setCurrentUser(email);
                    request.setAttribute("active",null);
                    //forward new page !!!!!!!!
                    request.setAttribute("currentUser",CurrentUser.getCurrentUser());
                    rdGo.forward(request, response);
                }
            }
            //System.out.println(request.getAttribute("errorMessage"));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }
}
