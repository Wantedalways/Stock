package com.qiheshengwu.stock.workbench.entity;

/**
 * @author Wantedalways
 */
public class Freezer {

    private String id;
    private String name;
    private String parkId;

    public Freezer() {
    }

    public Freezer(String id, String name, String parkId) {
        this.id = id;
        this.name = name;
        this.parkId = parkId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParkId() {
        return parkId;
    }

    public void setParkId(String parkId) {
        this.parkId = parkId;
    }

    @Override
    public String toString() {
        return "Freezer{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", parkId='" + parkId + '\'' +
                '}';
    }
}
