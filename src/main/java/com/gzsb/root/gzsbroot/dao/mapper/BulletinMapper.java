package com.gzsb.root.gzsbroot.dao.mapper;

import com.gzsb.root.gzsbroot.dao.entity.Bulletin;
import com.gzsb.root.gzsbroot.dao.entity.BulletinExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BulletinMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    long countByExample(BulletinExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int deleteByExample(BulletinExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer bulletinId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int insert(Bulletin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int insertSelective(Bulletin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    List<Bulletin> selectByExample(BulletinExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    Bulletin selectByPrimaryKey(Integer bulletinId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Bulletin record, @Param("example") BulletinExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Bulletin record, @Param("example") BulletinExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Bulletin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_bulletin
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Bulletin record);
}