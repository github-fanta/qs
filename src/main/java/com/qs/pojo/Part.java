package com.qs.pojo;

/**
 * Created by liq on 2018/5/21.
 */
public class Part {

    private String partId;
    private String partName;
    private String partRemark;
    private int partNum;
    private String remark;
    private int partNumLimit;

    public String getPartId() {
        return partId;
    }

    public void setPartId(String partId) {
        this.partId = partId;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getPartRemark() {
        return partRemark;
    }

    public void setPartRemark(String partRemark) {
        this.partRemark = partRemark;
    }

    public int getPartNum() {
        return partNum;
    }

    public void setPartNum(int partNum) {
        this.partNum = partNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getPartNumLimit() {
        return partNumLimit;
    }

    public void setPartNumLimit(int partNumLimit) {
        this.partNumLimit = partNumLimit;
    }
}
