package com.classes;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class Database {
    private String url = "jdbc:mysql://localhost:3306/pharmacy?autoReconnect=true&useSSL=false";
    private String user = "cerchi";
    private String pass = "cerchi";

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
                System.out.println(rs.getString("idUsers") + " " + rs.getString("Email") + " " + rs.getString("Password"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static boolean verifyUser(String mail, String pass){
        try{

            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                //System.out.println(rs.getString("idUsers") + " " + rs.getString("Username") + " " + rs.getString("Password"));
                if(rs.getString("Email").compareTo(mail) == 0 && rs.getString("Password").compareTo(pass) == 0)
                    return true;
            }
            return false;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static boolean verifyStaff(String mail, String pass){
        try{

            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                //System.out.println(rs.getString("idUsers") + " " + rs.getString("Username") + " " + rs.getString("Password"));
                if(rs.getString("Email").compareTo(mail) == 0 && rs.getString("Password").compareTo(pass) == 0)
                    if(rs.getInt("Staff") == 1)
                        return true;
                    else return false;
            }
            return false;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static ArrayList<Drug> verifyDrug(String drugName){
        ArrayList<Drug> x = new ArrayList<Drug>();
        try{
            rs = st.executeQuery("select * from pharmacy.drugs;");
            while(rs.next()){
                if(rs.getString("drugName").toLowerCase().contains(drugName)){
                    int id = rs.getInt("idDrugs");
                    String name = rs.getString("drugName");
                    int rd = rs.getInt("drugRecommendedDose");
                    String category = rs.getString("drugCategory");
                    String specs = rs.getString("drugSpecs");
                    double price = rs.getDouble("drugPrice");
                    double ap = rs.getDouble("drugActualPrice");
                    int stock = rs.getInt("drugStock");
                    Date exp = rs.getDate("drugExp");
                    x.add(new Drug(id,name,rd,category,specs,price,ap,stock,exp));
                }
            }
            if(x.size() == 0)
                return null;
            else{
                return x;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static boolean searchEmail(String mail){
        try{
            rs = st.executeQuery("select * from pharmacy.users;");
            while(rs.next()) {
                if(rs.getString("Email").compareTo(mail) == 0)
                    return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public static ArrayList<Drug> getDrugs(){
        try{
            ArrayList<Drug> drugs = new ArrayList<Drug>();
            rs = st.executeQuery("select * from pharmacy.drugs;");
            int id,rd,stock;
            String name,category,specs;
            double price,ap;
            Date exp;
            while(rs.next()) {
                id = rs.getInt("iddrugs");
                name = rs.getString("drugName");
                rd = rs.getInt("drugRecommendedDose");
                category = rs.getString("drugCategory");
                specs = rs.getString("drugSpecs");
                price = rs.getDouble("drugPrice");
                ap = rs.getDouble("drugActualPrice");
                stock = rs.getInt("drugStock");
                exp = rs.getDate("drugExp");
                drugs.add(new Drug(id,name,rd,category,specs,price,ap,stock,exp));
            }
            return drugs;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void checkoutDrug(Drug drug){
        try{
            rs = st.executeQuery("select * from pharmacy.drugs;");
            while(rs.next()){
                if(rs.getString("drugName").compareTo(drug.getName()) == 0){
                    int auxStock = rs.getInt("drugStock") - drug.getQuantity();
                    Statement ss = conn.createStatement();
                    ss.execute("UPDATE pharmacy.drugs SET drugStock =" + auxStock +" WHERE drugName ='" + drug.getName() + "';");
                    System.out.println(auxStock);
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void addUser(String email, String password) {
        try {
            String a = "'" + email + "','" + password + "'";
            PreparedStatement ps = conn.prepareStatement("insert into pharmacy.users(Email,Password) values (" + a + ");");
            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
