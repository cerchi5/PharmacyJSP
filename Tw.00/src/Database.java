import java.sql.*;
import java.util.ArrayList;

public class Database {
    private String url = "jdbc:mysql://localhost:3306/pharmacy?autoReconnect=true&useSSL=false";
    private String user = "public";
    private String pass = "public";

    private static Connection conn;
    private static Statement st;
    private static ResultSet rs;

    public Database() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, pass);
            st = conn.createStatement();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getUsers(){
        try{

            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                System.out.println(rs.getString("idUsers") + " " + rs.getString("Username") + " " + rs.getString("Password"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static boolean verifyUser(String user, String pass){
        try{

            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                //System.out.println(rs.getString("idUsers") + " " + rs.getString("Username") + " " + rs.getString("Password"));
                if(rs.getString("Username").compareTo(user) == 0 && rs.getString("Password").compareTo(pass) == 0)
                    return true;
            }
            return false;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static boolean searchEmail(String mail){
        try{
            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                if(rs.getString("Username").compareTo(mail) == 0)
                    return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static void addUser(String email, String password) {
        try {
            String a = "'" + email + "','" + password + "'";
            PreparedStatement ps = conn.prepareStatement("insert into pharmacy.users(Username,Password) values (" + a + ");");
            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
