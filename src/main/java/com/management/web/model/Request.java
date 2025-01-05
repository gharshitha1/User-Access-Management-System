package com.management.web.model;

public class Request {
	private int userId;
    private int softwareId;
    private String accessType;
    private String reason;
    private String status;
    
    public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSoftwareId() {
        return softwareId;
    }
    public void setSoftwareId(int softwareId) {
        this.softwareId = softwareId;
    }
    public String getAccessType() {
        return accessType;
    }
    public void setAccessType(String accessType) {
        this.accessType = accessType;
    }
    public String getReason() {
        return reason;
    }
    public void setReason(String reason) {
        this.reason = reason;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
	@Override
	public String toString() {
		return "Request [userId=" + userId + ", softwareId=" + softwareId + ", accessType=" + accessType + ", reason="
				+ reason + ", status=" + status + "]";
	}
}
