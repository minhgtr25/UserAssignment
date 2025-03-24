package model;

import java.sql.Date;
import java.sql.Timestamp;

public class LeaveRequest {
    private int requestId;
    private String title;
    private String reason;
    private Date fromDate;
    private Date toDate;
    private String status;
    private int createdBy;
    private Integer processedBy;
    private String processedReason;
    private Timestamp createdAt;
    
    public LeaveRequest() {
}


    public LeaveRequest(int requestId, String title, String reason, Date fromDate, Date toDate, String status, int createdBy, Integer processedBy, String processedReason, Timestamp createdAt) {
        this.requestId = requestId;
        this.title = title;
        this.reason = reason;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.status = status;
        this.createdBy = createdBy;
        this.processedBy = processedBy;
        this.processedReason = processedReason;
        this.createdAt = createdAt;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(Integer processedBy) {
        this.processedBy = processedBy;
    }

    public String getProcessedReason() {
        return processedReason;
    }

    public void setProcessedReason(String processedReason) {
        this.processedReason = processedReason;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
