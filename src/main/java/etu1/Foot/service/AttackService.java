package etu1.Foot.service;

import etu1.Foot.conn.Connexion;
import etu1.Foot.stat.Attack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Service
public class AttackService {
    @Autowired
    Connexion co;

    public List<Attack> getAll(String type){
        List<Attack> stats = new ArrayList<>();
        try {
            Connection conn = co.connect();
            int tab = switch (type) {
                case "Home" -> 0;
                case "Away" -> 1;
                case "Overall" -> 2;
                default -> 3;
            };

            String table = switch (type) {
                case "Home" -> "OffensiveHome";
                case "Away" -> "OffensiveAway";
                case "Overall" -> "OffensiveOverall";
                default -> "";
            };

            String sql = "select * from " + table;
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Attack temp = new Attack(rs.getString(1),rs.getDouble(2),rs.getDouble(3),rs.getDouble(4),rs.getDouble(5),rs.getDouble(6),tab);
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
