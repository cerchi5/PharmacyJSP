import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by cerch on 19-Nov-17.
 */
@WebServlet(name = "specialServlet",urlPatterns = "/specialServlet")
public class specialServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String x = request.getAttribute("searchField").toString();
        System.out.println(x);
        ArrayList<String> strings = new ArrayList<String>();
        for(int i = 0; i < 10; i++){
            strings.add(x + i);
        }
        request.setAttribute("array",strings);
        //request.getRequestDispatcher("/SearchClient.jsp").forward(request,response);
    }
}
