package com.gzsb.root.gzsbroot.dao.mapper;

import com.gzsb.root.gzsbroot.dao.entity.DepartmentPosition;
import com.gzsb.root.gzsbroot.dao.entity.DepartmentPositionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentPositionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    long countByExample(DepartmentPositionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int deleteByExample(DepartmentPositionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer positionId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int insert(DepartmentPosition record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int insertSelective(DepartmentPosition record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    List<DepartmentPosition> selectByExample(DepartmentPositionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    DepartmentPosition selectByPrimaryKey(Integer positionId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") DepartmentPosition record, @Param("example") DepartmentPositionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") DepartmentPosition record, @Param("example") DepartmentPositionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(DepartmentPosition record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_department_position
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(DepartmentPosition record);
}