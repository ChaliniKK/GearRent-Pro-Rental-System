package dao;

import entity.Reservation;
import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

public class ReservationDAO {

    public boolean hasOverlappingReservation(int equipmentId, LocalDate start, LocalDate end) {
        String sql = """
            SELECT COUNT(*) FROM reservations r
            WHERE r.equipment_id = ?
            AND r.status = 'ACTIVE'
            AND NOT (r.end_date < ? OR r.start_date > ?)
            UNION ALL
            SELECT COUNT(*) FROM rentals rent
            WHERE rent.equipment_id = ?
            AND rent.rental_status IN ('ACTIVE', 'RESERVED')
            AND NOT (rent.end_date < ? OR rent.start_date > ?)
            """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, equipmentId);
            ps.setDate(2, java.sql.Date.valueOf(start));
            ps.setDate(3, java.sql.Date.valueOf(end));
            ps.setInt(4, equipmentId);
            ps.setDate(5, java.sql.Date.valueOf(start));
            ps.setDate(6, java.sql.Date.valueOf(end));

            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total += rs.getInt(1);
            }

            return total > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    public void createReservation(Reservation reservation) {
        String sql = """
            INSERT INTO reservations (equipment_id, customer_id, start_date, end_date, status)
            VALUES (?, ?, ?, ?, ?)
            """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reservation.getEquipmentId());
            ps.setInt(2, reservation.getCustomerId());
            ps.setDate(3, java.sql.Date.valueOf(reservation.getStartDate()));
            ps.setDate(4, java.sql.Date.valueOf(reservation.getEndDate()));
            ps.setString(5, reservation.getStatus());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}