/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;


/**
 *
 * @author Joacim
 */
public class Order {
    User user;
    List<Cupcake> cupcake;
 

    public Order(User user, List<Cupcake> cupcake) {
        this.user = user;
        this.cupcake = cupcake;
    }           
    public List getList(){
        return this.cupcake;
    }  
    @Override
    public String toString(){
        return user.getUsername();
    }
}
