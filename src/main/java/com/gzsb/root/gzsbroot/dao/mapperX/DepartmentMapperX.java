package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 16:06
 */
public interface DepartmentMapperX {

    /**
     * 根据操作员查询用户职位和所属部门名称
     * @param operator
     * @return
     */
    OperatorPosition findByOperator(@Param("operator")String operator);

    /**
     * 查询所有部门
     * 根据部门名称
     * 根据父级编码
     * @param departmentName
     * @param fatherCode
     * @return
     */
    List<Department> findAllDepartment(@Param("departmentName")String departmentName,
                             @Param("fatherCode")String fatherCode);
    /**
     * 添加部门
     * @param department
     */
    void addDepartment(Department department);

    /**
     * 更新部门信息
     * @param department
     */
    void updateDepartment(Department department);

    /**
     * 根据部门编码查询部门信息
     * @param departmentCode
     * @return
     */
    Department findDepartmentByCode(@Param("departmentCode")String departmentCode);

    /**
     * 根据部门编码查询该部门所有职位信息以及对应人员
     * @param departmentCode
     * @return
     */
    List<OperatorPosition> findOperatorPositionByDepartmentCode(@Param("departmentCode")String departmentCode);

    /**
     * 根据操作员查询当前部门信息
     * @param operator
     * @return
     */
    Department findDepartmentByOperator(@Param("operator") String operator);
}
