package com.gzsb.root.gzsbroot.dao.entity;

import java.io.Serializable;

public class ConcatBook  {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_concat_book.CONCAT_ID
     *
     * @mbg.generated
     */
    private Integer concatId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_concat_book.CONCAT_NAME
     *
     * @mbg.generated
     */
    private String concatName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_concat_book.EMAIL_ACCOUNT
     *
     * @mbg.generated
     */
    private String emailAccount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_concat_book.SENDER
     *
     * @mbg.generated
     */
    private String sender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_concat_book.REMARK
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_concat_book.CONCAT_ID
     *
     * @return the value of gzsb_concat_book.CONCAT_ID
     *
     * @mbg.generated
     */
    public Integer getConcatId() {
        return concatId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_concat_book.CONCAT_ID
     *
     * @param concatId the value for gzsb_concat_book.CONCAT_ID
     *
     * @mbg.generated
     */
    public void setConcatId(Integer concatId) {
        this.concatId = concatId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_concat_book.CONCAT_NAME
     *
     * @return the value of gzsb_concat_book.CONCAT_NAME
     *
     * @mbg.generated
     */
    public String getConcatName() {
        return concatName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_concat_book.CONCAT_NAME
     *
     * @param concatName the value for gzsb_concat_book.CONCAT_NAME
     *
     * @mbg.generated
     */
    public void setConcatName(String concatName) {
        this.concatName = concatName == null ? null : concatName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_concat_book.EMAIL_ACCOUNT
     *
     * @return the value of gzsb_concat_book.EMAIL_ACCOUNT
     *
     * @mbg.generated
     */
    public String getEmailAccount() {
        return emailAccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_concat_book.EMAIL_ACCOUNT
     *
     * @param emailAccount the value for gzsb_concat_book.EMAIL_ACCOUNT
     *
     * @mbg.generated
     */
    public void setEmailAccount(String emailAccount) {
        this.emailAccount = emailAccount == null ? null : emailAccount.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_concat_book.SENDER
     *
     * @return the value of gzsb_concat_book.SENDER
     *
     * @mbg.generated
     */
    public String getSender() {
        return sender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_concat_book.SENDER
     *
     * @param sender the value for gzsb_concat_book.SENDER
     *
     * @mbg.generated
     */
    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column gzsb_concat_book.REMARK
     *
     * @return the value of gzsb_concat_book.REMARK
     *
     * @mbg.generated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column gzsb_concat_book.REMARK
     *
     * @param remark the value for gzsb_concat_book.REMARK
     *
     * @mbg.generated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}