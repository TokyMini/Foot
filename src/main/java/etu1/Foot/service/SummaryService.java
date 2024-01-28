package etu1.Foot.service;

import etu1.Foot.conn.Connexion;
import etu1.Foot.stat.Summary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Service
public class SummaryService {
    @Autowired
    Connexion co;

    public List<Summary> getAll(String type) {
        List<Summary> stats = new ArrayList<>();
        try {
            Connection conn = co.connect();
            int tab = switch (type) {
                case "Home" -> 0;
                case "Away" -> 1;
                case "Overall" -> 2;
                default -> 3;
            };

            String table = switch (type) {
                case "Home" -> "SummaryHome";
                case "Away" -> "SummaryAway";
                case "Overall" -> "SummaryOverall";
                default -> "";
            };

            //String sql = String.format("SELECT * FROM %s", table);

            String sql = "select * from " + table;
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Summary temp = new Summary(rs.getString(1),rs.getInt(2),rs.getDouble(3),rs.getInt(4),rs.getInt(5),rs.getDouble(6),rs.getDouble(7),rs.getDouble(8),rs.getDouble(9),tab);
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
