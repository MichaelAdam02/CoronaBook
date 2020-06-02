package at.michaeladam.coronabook.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Michael ADAM
 */
public class PasswordManager {
    private static final int SALT_LENGTH = 16; 

    public static String createSalt(){
        char[] bytes = new char[SALT_LENGTH];
        Random r = new Random();        
        for (int i = 0; i < bytes.length; i++) {
            
            if(r.nextBoolean())
                  bytes[i] = (char) (r.nextInt(26) + 'a');
             else
                  bytes[i] = (char) (r.nextInt(9)  + '1');
        }
        return String.copyValueOf(bytes);
    }   
    
    public static String getPasswordString(String salt, String password){
        return salt+"."+hashString(salt+password);
    }
        
    public static boolean checkPassword(String passwordHash,String password){
        String salt = passwordHash.substring(0, passwordHash.indexOf("."));
        return passwordHash.equals(getPasswordString(salt, password)); 
    }
    
    
    public static String hashString(String toHash) { 
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(toHash.getBytes());
            byte[] digest = md.digest();
            String myHash = DatatypeConverter
                    .printHexBinary(digest).toUpperCase();
            return myHash.toLowerCase();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
