package etu1.Foot.service;

import etu1.Foot.conn.Connexion;
import etu1.Foot.stat.Deffense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Service
public class DeffenseService {
    @Autowired
    Connexion co;

    public List<Deffense> getAll(String type){
        List<Deffense> stats = new ArrayList<>();
        try {
            Connection conn = co.connect();
            int tab = switch (type) {
                case "Home" -> 0;
                case "Away" -> 1;
                case "Overall" -> 2;
                default -> 3;
            };

            String table = switch (type) {
                case "Home" -> "DefensiveHome";
                case "Away" -> "DefensiveAway";
                case "Overall" -> "DefensiveOverall";
                default -> "";
            };

            String sql = "select * from " + table;
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Deffense temp = new Deffense(rs.getString(1),rs.getDouble(2),rs.getDouble(3),rs.getDouble(4),rs.getDouble(5),rs.getDouble(6),rs.getDouble(7),tab);
                stats.add(temp);
            }

            rs.close();
            stmt.close();
            conn.close();

        }catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }
}
