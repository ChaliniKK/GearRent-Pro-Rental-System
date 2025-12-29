package entity;

import java.util.Objects;

public class Category {
    private int categoryId;
    private String name;
    private String description;
    private double basePriceFactor;
    private double weekendMultiplier;
    private double lateFeePerDay;

    public Category() {}

    public Category(int categoryId, String name, String description,
                    double basePriceFactor, double weekendMultiplier, double lateFeePerDay) {
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.basePriceFactor = basePriceFactor;
        this.weekendMultiplier = weekendMultiplier;
        this.lateFeePerDay = lateFeePerDay;
    }

    // Getters and setters...
    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getBasePriceFactor() { return basePriceFactor; }
    public void setBasePriceFactor(double basePriceFactor) { this.basePriceFactor = basePriceFactor; }

    public double getWeekendMultiplier() { return weekendMultiplier; }
    public void setWeekendMultiplier(double weekendMultiplier) { this.weekendMultiplier = weekendMultiplier; }

    public double getLateFeePerDay() { return lateFeePerDay; }
    public void setLateFeePerDay(double lateFeePerDay) { this.lateFeePerDay = lateFeePerDay; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return categoryId == category.categoryId &&
                Objects.equals(name, category.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(categoryId, name);
    }

    @Override
    public String toString() {
        return name;
    }
}