package at.michaeladam.coronabook.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Michael ADAM
 */
public class DBAccess {

    private Connection c;

    public PreparedStatement prepareStatement(String sql) throws SQLException {
        return c.prepareStatement(sql);
    }

    private DBAccess() {
        try {
            Class.forName("org.postgresql.Driver");

            c = DriverManager.getConnection(DBConfig.getConnectionString(), DBConfig.getProperties());

        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Beim Connecten der Datenbank ist ein FEHLER aufgetreten!");
            ex.printStackTrace();
        }

    }

    public static DBAccess getInstance() {
        return DBConnectionHolder.INSTANCE;
    }

    private static class DBConnectionHolder {

        private static final DBAccess INSTANCE = new DBAccess();
    }
}
