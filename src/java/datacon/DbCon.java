/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package datacon;
import com.mysql.jdbc.Connection;
import static java.lang.System.out;
import java.math.BigInteger;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbCon
{
    public Connection con;
  
    public DbCon()
    {       
            try
            {               
                  Class.forName("com.mysql.jdbc.Driver");
                  System.out.println("MySql Driver Loaded");
//                 con = DriverManager.getConnection("jdbc:mysql://mysql125046-CloudBookEnv.j.layershift.co.uk/cloudbook","root","IKFqvf76696");
            }catch(Exception e)
            {   out.println(e);
            }
    }
    
    public Connection getConnection()
    {
        Connection con=null;
            try{
                   if(con==null){ 
                    con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning","root","root");   
                   }
                  System.out.println("My Sql Connection is Established");
            }catch(Exception e){
            }    
        return con;
    }
    Double score;
    public void setScore(Double sc){
    score = sc;
    }
    public Double getScore()
    {
    return score;
    }
}
 
    
    
