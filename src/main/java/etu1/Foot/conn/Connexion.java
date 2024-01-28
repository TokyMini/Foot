package etu1.Foot.conn;

import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Service
public class Connexion {
    public Connection connect() {
        String url = "jdbc:postgresql://monorail.proxy.rlwy.net:35982/railway";
        String user = "postgres";
        String password = "f3Ac2C5E1eCC6G224gEcF46e45ae21eA";

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }
}
