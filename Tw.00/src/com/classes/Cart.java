package com.classes;

import com.classes.Drug;
import com.intellij.vcs.log.Hash;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart {
    private static ArrayList<Drug> drugs;
    private static int total;

    public static void checkout(){
        // generate email
        //
        //
        //
        resetDrugs();
        resetTotal();
    }

    public static ArrayList<Drug> getDrugs() {
        return drugs;
    }

    public static void resetDrugs(){
        drugs = new ArrayList<Drug>();
    }

    public static void addDrug(Drug drug) {
        drugs.add(drug);

    }

    public static int getTotal() {
        return total;
    }

    public static void resetTotal(){
        total = 0;
    }

    public static void addTotal(int totalAux) {
        total += totalAux;
    }
}
