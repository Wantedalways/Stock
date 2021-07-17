package com.qiheshengwu.stock.workbench.entity;

/**
 * @author Wantedalways
 */
public class LogStock {

    private String id;
    private String stockId;
    private String item;
    private String oldData;
    private String newData;
    private String editBy;
    private String editTime;

    public LogStock() {
    }

    public LogStock(String id, String stockId, String item, String oldData, String newData, String editBy, String editTime) {
        this.id = id;
        this.stockId = stockId;
        this.item = item;
        this.oldData = oldData;
        this.newData = newData;
        this.editBy = editBy;
        this.editTime = editTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getOldData() {
        return oldData;
    }

    public void setOldData(String oldData) {
        this.oldData = oldData;
    }

    public String getNewData() {
        return newData;
    }

    public void setNewData(String newData) {
        this.newData = newData;
    }

    public String getEditBy() {
        return editBy;
    }

    public void setEditBy(String editBy) {
        this.editBy = editBy;
    }

    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
}
