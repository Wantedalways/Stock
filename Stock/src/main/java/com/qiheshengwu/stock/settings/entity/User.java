package com.qiheshengwu.stock.settings.entity;

import org.springframework.stereotype.Component;

/**
 * @author Wantedalways
 */
@Component
public class User {

    private String id;
    private String name;
    private String password;
    private String parkId;

    public User() {
    }

    public User(String id, String name, String password, String parkId) {
        this.id = id;
        this.name = name;
        this.password = password;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getParkId() {
        return parkId;
    }

    public void setParkId(String parkId) {
        this.parkId = parkId;
    }
}
