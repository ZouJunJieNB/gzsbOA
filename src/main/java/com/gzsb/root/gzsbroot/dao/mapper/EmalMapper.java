package com.gzsb.root.gzsbroot.dao.mapper;

import com.gzsb.root.gzsbroot.dao.entity.Emal;
import com.gzsb.root.gzsbroot.dao.entity.EmalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmalMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    long countByExample(EmalExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int deleteByExample(EmalExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer emailId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int insert(Emal record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int insertSelective(Emal record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    List<Emal> selectByExample(EmalExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    Emal selectByPrimaryKey(Integer emailId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Emal record, @Param("example") EmalExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Emal record, @Param("example") EmalExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Emal record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_emal
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Emal record);
}