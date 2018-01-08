package com.classes;

import com.classes.Drug;
import com.intellij.vcs.log.Hash;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart {
    private static ArrayList<Drug> drugs = new ArrayList<Drug>();
    private static double total = 0;
    private static int numberOfProducts = 0;
    public static String code = "";

    public static void checkout(ArrayList<Drug> drugs){
        // generate email


        // create json
        //
        //
        JSONcreator.createFile(drugs);
        System.out.println(JSONcreator.readFile(code));
        JSONcreator.verifyCode(code);

        resetDrugs();
        resetTotal();
        resetNumberOfProducts();
    }

    public static ArrayList<Drug> getDrugs() {
        return drugs;
    }

    public static void setDrugs (ArrayList<Drug> drugs){
        Cart.drugs = drugs;
    }

    public static void resetDrugs(){
        drugs = new ArrayList<Drug>();
    }

    public static void addDrug(Drug drug) {
        drugs.add(drug);
        incrementTotal(drug.getActualPrice() * drug.getQuantity());
        incrementNumberOfProducts();
    }

    public static void removeDrug(Drug drug){
        decrementTotal(drug.getActualPrice() * drug.getQuantity());
        decrementNumberOfProducts();
        drugs.remove(drug);
    }
    public static void decrementTotal(double totalAux){
        total -= totalAux;
    }

    public static double getTotal() {
        return total;
    }

    public static void resetTotal(){
        total = 0;
    }

    public static void incrementTotal(double totalAux) {
        total += totalAux;
    }

    public static int getNumberOfProducts() {
        return numberOfProducts;
    }

    public static void incrementNumberOfProducts() {
        Cart.numberOfProducts++;
    }

    public static void decrementNumberOfProducts() {
        Cart.numberOfProducts--;
    }

    public static void resetNumberOfProducts(){ Cart.numberOfProducts = 0; }
}
