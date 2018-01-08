package com.classes;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class JSONcreator {

    private static Random random = new Random();

    public static boolean verifyCode(String code){
        try{

            String auxCode = code + ".txt";

            File file = new File("E:/STOP");
            for(final File fileEntry : file.listFiles()){
                //System.out.println(fileEntry.getName());
                if(auxCode.compareTo(fileEntry.getName()) == 0)
                    return false;
            }
            return true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    private static JSONObject drugToJSONObject(Drug drug){
        try {
            JSONObject drugAux = new JSONObject();

            drugAux.put("id", drug.getId());
            drugAux.put("name", drug.getName());
            drugAux.put("recommendeddose", drug.getRecommendedDose());
            drugAux.put("category", drug.getCategory());
            drugAux.put("specification", drug.getSpecs());
            drugAux.put("price", drug.getActualPrice());
            drugAux.put("quantity", drug.getQuantity());
            return drugAux;

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    private static Drug JSONObjectToDrug(JSONObject obj){
        try{
            Drug auxDrug = new Drug();
            auxDrug.setId(Integer.parseInt(obj.get("id").toString()) );
            auxDrug.setName(obj.get("name").toString());
            auxDrug.setQuantity(Integer.parseInt(obj.get("quantity").toString()));
            auxDrug.setRecommendedDose(Integer.parseInt(obj.get("recommendeddose").toString()));
            auxDrug.setSpecs(obj.get("specification").toString());
            auxDrug.setCategory(obj.get("category").toString());
            auxDrug.setActualPrice(Double.parseDouble(obj.get("price").toString()));

            return auxDrug;

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void createFile(ArrayList<Drug> drugs){

        try{

            int code = random.nextInt(10000000);
            Cart.code = Integer.toString(code);
            File file = new File("E:/STOP/" + code + ".txt");

            JSONObject root = new JSONObject();
            JSONArray array = new JSONArray();
            for(Drug x : drugs){
                array.add(drugToJSONObject(x));
            }

            root.put("drugs",array);

            PrintWriter pw = new PrintWriter(file);
            pw.print(array);
            pw.flush();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Drug> readFile(String code){
        try{
            ArrayList<Drug> drugs = new ArrayList<Drug>();
            File file = new File("E:/STOP/" + code + ".txt");
            Scanner input = new Scanner(file);
            StringBuilder jsonIn = new StringBuilder();

            while(input.hasNextLine()){
                jsonIn.append(input.nextLine());
            }

            //System.out.println(jsonIn.toString());

            JSONParser parser = new JSONParser();
            //JSONObject objRoot = (JSONObject) parser.parse(jsonIn.toString());

            JSONArray array = (JSONArray) parser.parse(jsonIn.toString());

            for(int i = 0; i < array.size(); i++){
                if(JSONObjectToDrug( (JSONObject) array.get(i) ) != null){
                    drugs.add( JSONObjectToDrug( (JSONObject) array.get(i) ) );
                }
            }

            if(drugs.size() != 0)
                return drugs;
            else return null;

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
