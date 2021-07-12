package com.qiheshengwu.stock.workbench.entity;

/**
 * @author Wantedalways
 */
public class Stock {

    private String id;
    private String parkId;
    private String freezerId;
    private String pile;
    private String dateTag;
    private String shed;
    private String bud;
    private String type;
    private String grade;
    private Integer amount;
    private String nature;
    private String peel;
    private String test;
    private String dateCurrent;
    private Integer accountAge;
    private String remark;

    public Stock() {
    }

    public Stock(String id, String parkId, String freezerId, String pile, String dateTag, String shed, String bud, String type, String grade, Integer amount, String nature, String peel, String test, String dateCurrent, Integer accountAge, String remark) {
        this.id = id;
        this.parkId = parkId;
        this.freezerId = freezerId;
        this.pile = pile;
        this.dateTag = dateTag;
        this.shed = shed;
        this.bud = bud;
        this.type = type;
        this.grade = grade;
        this.amount = amount;
        this.nature = nature;
        this.peel = peel;
        this.test = test;
        this.dateCurrent = dateCurrent;
        this.accountAge = accountAge;
        this.remark = remark;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParkId() {
        return parkId;
    }

    public void setParkId(String parkId) {
        this.parkId = parkId;
    }

    public String getFreezerId() {
        return freezerId;
    }

    public void setFreezerId(String freezerId) {
        this.freezerId = freezerId;
    }

    public String getPile() {
        return pile;
    }

    public void setPile(String pile) {
        this.pile = pile;
    }

    public String getDateTag() {
        return dateTag;
    }

    public void setDateTag(String dateTag) {
        this.dateTag = dateTag;
    }

    public String getShed() {
        return shed;
    }

    public void setShed(String shed) {
        this.shed = shed;
    }

    public String getBud() {
        return bud;
    }

    public void setBud(String bud) {
        this.bud = bud;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getPeel() {
        return peel;
    }

    public void setPeel(String peel) {
        this.peel = peel;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getDateCurrent() {
        return dateCurrent;
    }

    public void setDateCurrent(String dateCurrent) {
        this.dateCurrent = dateCurrent;
    }

    public Integer getAccountAge() {
        return accountAge;
    }

    public void setAccountAge(Integer accountAge) {
        this.accountAge = accountAge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "id='" + id + '\'' +
                ", parkId='" + parkId + '\'' +
                ", freezerId='" + freezerId + '\'' +
                ", pile='" + pile + '\'' +
                ", dateTag='" + dateTag + '\'' +
                ", shed='" + shed + '\'' +
                ", bud='" + bud + '\'' +
                ", type='" + type + '\'' +
                ", grade='" + grade + '\'' +
                ", amount=" + amount +
                ", nature='" + nature + '\'' +
                ", peel='" + peel + '\'' +
                ", test='" + test + '\'' +
                ", dateCurrent='" + dateCurrent + '\'' +
                ", accountAge=" + accountAge +
                ", remark='" + remark + '\'' +
                '}';
    }
}
