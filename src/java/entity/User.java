package entity;

/**
 *
 * @author Joacim
 */
public class User {
    String username; 
    int id;
    int balance;

    public User(String username,  int balance, int id) {
        this.username = username;     
        this.balance = balance;
        this.id = id;
    }
    public User(String username,  int balance) {
        this.username = username;     
        this.balance = balance;        
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }
 
    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
    
    @Override
    public String toString(){
        return username;
    }
    
}
