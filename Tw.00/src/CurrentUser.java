
class CurrentUser {

    static String username = "";

    static String getCurrentUser(){
        return username;
    }

    static void setCurrentUser(String user){
        username = user;
    }
}
