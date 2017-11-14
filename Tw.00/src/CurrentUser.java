
public class CurrentUser {

    public static String username = "";

    public static String getCurrentUser(){
        return username;
    }

    public static void setCurrentUser(String user){
        username = user;
    }
}
