package com.gzsb.root.gzsbroot.service.department;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 16:17
 */
public interface DepartmentService {


    /**
     * 根据操作员查询用户职位和所属部门名称
     * @param operator
     * @return
     */
    OperatorPosition findByOperator(String operator);

    /**
     * 查询所有部门
     * 根据部门名称
     * 根据父级编码
     * @param departmentName
     * @param fatherCode
     * @return
     */
    PageInfo<Department> findAllDepartment(String departmentName,
                                           String fatherCode,
                                           Integer pageIndex,
                                           Integer limit);
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
    Department findDepartmentByCode(String departmentCode);

    /**
     * 根据部门编码查询该部门所有职位信息以及对应人员
     * @param departmentCode
     * @return
     */
    PageInfo<OperatorPosition> findOperatorPositionByDepartmentCode(String departmentCode,
                                                                    Integer pageIndex,
                                                                    Integer limit);

    /**
     * 根据操作员查询当前部门信息
     * @param operator
     * @return
     */
    Department findDepartmentByOperator(String operator);




}
