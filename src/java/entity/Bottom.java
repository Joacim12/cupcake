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
public class Bottom {
    String bottom;
    int price;

    public Bottom(String bottom, int price) {
        this.bottom = bottom;
        this.price = price;
    }    
    
    public int getPrice(){
        return this.price;
    }
    
    public String getBottom(){
        return this.bottom;
    }
    
    @Override
    public String toString() {
        return bottom;
    }
    
}
