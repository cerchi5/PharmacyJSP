package com.classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "VerifyCodeServlet" , urlPatterns = "/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {

    RequestDispatcher rd;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("submitCode") != null) {
            String code = request.getParameter("textVerifyCode");
            if (!JSONcreator.verifyCode(code)) {
                // array in request
                request.setAttribute("resultList", JSONcreator.readFile(code));
                rd = request.getRequestDispatcher("/client/VerifyCode2.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("errorCode", "INVALID CODE");
                rd = request.getRequestDispatcher("/client/VerifyCode.jsp");
                rd.forward(request, response);
            }
        }

        if(request.getParameter("submitCodeStaff") != null) {
            String code = request.getParameter("textVerifyCodeStaff");
            if (!JSONcreator.verifyCode(code)) {
                // array in request
                request.setAttribute("resultList", JSONcreator.readFile(code));
                rd = request.getRequestDispatcher("/staff/CheckoutCode2.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("errorCode", "INVALID CODE");
                rd = request.getRequestDispatcher("/staff/CheckoutCode.jsp");
                rd.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
