/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Joacim
 */
public class Topping {
   
    String topping;
    int price;

    public Topping(String topping, int price) {
        
        this.topping = topping;
        this.price = price;        
    }

    public String getTopping() {
        return topping;
    }

    public int getPrice() {
        return price;
    }
    
    public String toString(){
        return topping;
    }
    
    
}
