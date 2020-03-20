package at.michaeladam.coronabook.DB;

import java.util.Properties;

/**
 *
 * @author Michael ADAM
 */
public class DBConfig {

    private static Properties properties;

    private static final String url = "rookie.ddns.net"; //Datenbank in meinem Keller :)
    
    private static final String userName = "schuluser";
    private static final String password = "schule123";

    public static Properties getProperties() {
        if (properties != null) {
            return properties;
        }
        
        properties = new Properties();
        
        properties.put("user", userName);
        properties.put("password", password);
        
        
        return properties;
    }

    public static String getConnectionString(){
       return "jdbc:postgresql://"+url+"/Schule";
    }
    
}
