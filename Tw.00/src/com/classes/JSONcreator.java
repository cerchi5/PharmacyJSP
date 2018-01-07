package com.classes;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.Random;

public class JSONcreator {
    private static Random random = new Random();

    private static JSONObject drugToJSONObejct(Drug drug){
        return null;
    }

    public static void createFile(ArrayList<Drug> drugs){

        int code = random.nextInt(100000);
        File file = new File(code + ".txt");

        JSONArray array = new JSONArray();
        /*
        for(Drug x : drugs){
            array.add(drugToJSONObejct(x));
        }*/
    }
}
