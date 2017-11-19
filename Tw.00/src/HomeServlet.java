import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomeServlet",urlPatterns ="/HomeServlet")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd;

        if(request.getParameter("searchDrugs") != null){
            rd = request.getRequestDispatcher("/SearchClient.jsp");
            System.out.println("Go to SearchClient.jsp");
            request.setAttribute("currentUser",CurrentUser.getCurrentUser());
            rd.forward(request,response);
        }
        if(request.getParameter("verifyCode") != null){
            rd = request.getRequestDispatcher("/Verify.jsp");
            rd.forward(request,response);
        }
        if(request.getParameter("contact") != null){
            rd = request.getRequestDispatcher("/Contact.jsp");
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
