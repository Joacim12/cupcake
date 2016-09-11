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
public class Cupcake {
    Topping topping;
    Bottom bottom;
    int price;

    public Cupcake(Topping topping, Bottom bottom, int price) {
        this.topping = topping;
        this.bottom = bottom;
        this.price = price;
    }
    
    public int getPrice(){
        return price;
    }
    
    @Override
    public String toString(){
        return "Topping: " + topping + ", Bottom: "+ bottom + " Price: " + price;
    } 
}
