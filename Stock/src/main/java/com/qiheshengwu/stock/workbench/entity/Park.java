package com.qiheshengwu.stock.workbench.entity;

import org.springframework.stereotype.Component;

/**
 * @author Wantedalways
 */
@Component
public class Park {

    private String id;
    private String name;
    private String code;

    public Park() {
    }

    public Park(String id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
