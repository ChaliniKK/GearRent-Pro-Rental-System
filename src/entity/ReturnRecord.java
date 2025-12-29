package entity;

import java.time.LocalDate;
import java.util.Objects;

public class ReturnRecord {
    private int returnId;
    private int rentalId;
    private LocalDate actualReturnDate;
    private String damageDescription;
    private double damageCharge;
    private double lateFee;

    public ReturnRecord() {}

    // Getters and setters...
    public int getReturnId() { return returnId; }
    public void setReturnId(int returnId) { this.returnId = returnId; }

    public int getRentalId() { return rentalId; }
    public void setRentalId(int rentalId) { this.rentalId = rentalId; }

    public LocalDate getActualReturnDate() { return actualReturnDate; }
    public void setActualReturnDate(LocalDate actualReturnDate) { this.actualReturnDate = actualReturnDate; }

    public String getDamageDescription() { return damageDescription; }
    public void setDamageDescription(String damageDescription) { this.damageDescription = damageDescription; }

    public double getDamageCharge() { return damageCharge; }
    public void setDamageCharge(double damageCharge) { this.damageCharge = damageCharge; }

    public double getLateFee() { return lateFee; }
    public void setLateFee(double lateFee) { this.lateFee = lateFee; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReturnRecord that = (ReturnRecord) o;
        return returnId == that.returnId &&
                rentalId == that.rentalId &&
                Objects.equals(actualReturnDate, that.actualReturnDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(returnId, rentalId, actualReturnDate);
    }

    @Override
    public String toString() {
        return "Return #" + returnId + " (Rental: " + rentalId +
                ", Returned: " + actualReturnDate + ")";
    }
}