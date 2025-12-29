package entity;

import java.util.Objects;

public class Membership {
    private int membershipId;
    private String level;
    private double discountPercentage;

    public Membership() {}

    public Membership(int membershipId, String level, double discountPercentage) {
        this.membershipId = membershipId;
        this.level = level;
        this.discountPercentage = discountPercentage;
    }

    // Getters and setters...
    public int getMembershipId() { return membershipId; }
    public void setMembershipId(int membershipId) { this.membershipId = membershipId; }

    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }

    public double getDiscountPercentage() { return discountPercentage; }
    public void setDiscountPercentage(double discountPercentage) { this.discountPercentage = discountPercentage; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Membership that = (Membership) o;
        return membershipId == that.membershipId &&
                Objects.equals(level, that.level);
    }

    @Override
    public int hashCode() {
        return Objects.hash(membershipId, level);
    }

    @Override
    public String toString() {
        return level + " (" + discountPercentage + "% discount)";
    }
}