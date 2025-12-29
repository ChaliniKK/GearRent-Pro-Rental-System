package dao;

import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReportDAO {

    public void getEquipmentUtilizationReport(int branchId) {
        String sql = """
            SELECT 
                e.equipment_id,
                e.brand,
                e.model,
                COUNT(r.rental_id) as rental_count,
                SUM(DATEDIFF(r.end_date, r.start_date) + 1) as rented_days
            FROM equipment e
            LEFT JOIN rentals r ON e.equipment_id = r.equipment_id
            WHERE e.branch_id = ?
            GROUP BY e.equipment_id, e.brand, e.model
            """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, branchId);
            ResultSet rs = ps.executeQuery();

            System.out.println("Equipment Utilization Report:");
            System.out.println("===============================");
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("equipment_id") +
                        ", Brand: " + rs.getString("brand") +
                        ", Model: " + rs.getString("model") +
                        ", Rentals: " + rs.getInt("rental_count") +
                        ", Rented Days: " + rs.getInt("rented_days"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}