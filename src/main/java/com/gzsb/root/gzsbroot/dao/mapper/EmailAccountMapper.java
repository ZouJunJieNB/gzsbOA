package com.gzsb.root.gzsbroot.dao.mapper;

import com.gzsb.root.gzsbroot.dao.entity.EmailAccount;
import com.gzsb.root.gzsbroot.dao.entity.EmailAccountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmailAccountMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    long countByExample(EmailAccountExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int deleteByExample(EmailAccountExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer accountId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int insert(EmailAccount record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int insertSelective(EmailAccount record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    List<EmailAccount> selectByExample(EmailAccountExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    EmailAccount selectByPrimaryKey(Integer accountId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") EmailAccount record, @Param("example") EmailAccountExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") EmailAccount record, @Param("example") EmailAccountExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(EmailAccount record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_email_account
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(EmailAccount record);
}