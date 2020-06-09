package com.gzsb.root.gzsbroot.dao.entity;

import java.io.Serializable;

public class EmailAccount   {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.ACCOUNT_ID
     *
     * @mbg.generated
     */
    private Integer accountId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.USERNAME
     *
     * @mbg.generated
     */
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.PASSWORD
     *
     * @mbg.generated
     */
    private String password;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.SENDER
     *
     * @mbg.generated
     */
    private String sender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.SMTP_ADDRESS
     *
     * @mbg.generated
     */
    private String smtpAddress;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.SMTP_PORT
     *
     * @mbg.generated
     */
    private String smtpPort;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_email_account.REMARK
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.ACCOUNT_ID
     *
     * @return the value of gzsb_email_account.ACCOUNT_ID
     *
     * @mbg.generated
     */
    public Integer getAccountId() {
        return accountId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.ACCOUNT_ID
     *
     * @param accountId the value for gzsb_email_account.ACCOUNT_ID
     *
     * @mbg.generated
     */
    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.USERNAME
     *
     * @return the value of gzsb_email_account.USERNAME
     *
     * @mbg.generated
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.USERNAME
     *
     * @param username the value for gzsb_email_account.USERNAME
     *
     * @mbg.generated
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.PASSWORD
     *
     * @return the value of gzsb_email_account.PASSWORD
     *
     * @mbg.generated
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.PASSWORD
     *
     * @param password the value for gzsb_email_account.PASSWORD
     *
     * @mbg.generated
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.SENDER
     *
     * @return the value of gzsb_email_account.SENDER
     *
     * @mbg.generated
     */
    public String getSender() {
        return sender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.SENDER
     *
     * @param sender the value for gzsb_email_account.SENDER
     *
     * @mbg.generated
     */
    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.SMTP_ADDRESS
     *
     * @return the value of gzsb_email_account.SMTP_ADDRESS
     *
     * @mbg.generated
     */
    public String getSmtpAddress() {
        return smtpAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.SMTP_ADDRESS
     *
     * @param smtpAddress the value for gzsb_email_account.SMTP_ADDRESS
     *
     * @mbg.generated
     */
    public void setSmtpAddress(String smtpAddress) {
        this.smtpAddress = smtpAddress == null ? null : smtpAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.SMTP_PORT
     *
     * @return the value of gzsb_email_account.SMTP_PORT
     *
     * @mbg.generated
     */
    public String getSmtpPort() {
        return smtpPort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.SMTP_PORT
     *
     * @param smtpPort the value for gzsb_email_account.SMTP_PORT
     *
     * @mbg.generated
     */
    public void setSmtpPort(String smtpPort) {
        this.smtpPort = smtpPort == null ? null : smtpPort.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_email_account.REMARK
     *
     * @return the value of gzsb_email_account.REMARK
     *
     * @mbg.generated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_email_account.REMARK
     *
     * @param remark the value for gzsb_email_account.REMARK
     *
     * @mbg.generated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}