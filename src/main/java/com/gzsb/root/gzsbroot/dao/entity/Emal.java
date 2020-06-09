package com.gzsb.root.gzsbroot.dao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Emal   {

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.EMAIL_ID
     *
     * @mbg.generated
     */
    private Integer emailId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.TYPE_CODE
     *
     * @mbg.generated
     */
    private String typeCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.ACCOUNT_ID
     *
     * @mbg.generated
     */

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.OPERATOR
     *
     * @mbg.generated
     */
    private String operator;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.PLAN_STATUS_CODE
     *
     * @mbg.generated
     */
    private String planStatusCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.THEME
     *
     * @mbg.generated
     */
    private String theme;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.CONTETNT
     *
     * @mbg.generated
     */
    private String contetnt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.SEND_TIME
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date sendTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column gzsb_emal.RECEIVE
     *
     * @mbg.generated
     */
    private String receive;

    private String statusDescription;

    private String typeDescription;

    private List<String> receiveList;

    private String status;

}