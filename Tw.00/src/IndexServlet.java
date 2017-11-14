import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IndexServlet",urlPatterns ="/IndexServlet")
public class IndexServlet extends HttpServlet {

    Database db = new Database();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");

        if(request.getParameter("loginButton") != null){
            String user = request.getParameter("usernameLogin"), pass = request.getParameter("passwordLogin");
            System.out.println(user + "   " + pass);

            if(db.verifyUser(user,pass)){

                CurrentUser.setCurrentUser(user);
                System.out.println(CurrentUser.username);
                //rd.forward(request, response);
                // forward next page
            }
        } else if(request.getParameter("registerButton") != null){

            String email = request.getParameter("emailRegister");

            if(db.searchEmail(email)){
                request.setAttribute("errorMessage", "Email already exists");
                request.setAttribute("active"," active open");
                rd.forward(request, response);
            }else {
                if (request.getParameter("passwordRegister").compareTo(request.getParameter("confirmPasswordRegister")) != 0){
                    request.setAttribute("errorMessage", "Passwords aren't the same");
                    request.setAttribute("active"," open");
                    rd.forward(request, response);
                }
                else{
                    //ok register

                    db.addUser(email,request.getParameter("passwordRegister"));
                    CurrentUser.setCurrentUser(email);
                    request.setAttribute("active",null);
                    //forward new page !!!!!!!!
                }
            }
            System.out.println(request.getAttribute("errorMessage"));
        }


    }
}
