package com.gzsb.root.gzsbroot.service.department.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.dao.entity.DepartmentPosition;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentPositionMapperX;
import com.gzsb.root.gzsbroot.service.department.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zouJunJie
 * @create 2019-11-01 16:17
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapperX departmentMapperX;

    @Autowired
    private DepartmentPositionMapperX departmentPositionMapperX;

    @Override
    public OperatorPosition findByOperator(String operator) {
        return departmentMapperX.findByOperator(operator);
    }

    @Override
    public PageInfo<Department> findAllDepartment(String departmentName, String fatherCode,
                                                  Integer pageIndex, Integer limit) {
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(departmentMapperX.findAllDepartment(departmentName,fatherCode));
    }

    @Override
    public void addDepartment(Department department) {
        departmentMapperX.addDepartment(department);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentMapperX.updateDepartment(department);
    }

    @Override
    public Department findDepartmentByCode(String departmentCode) {
        return departmentMapperX.findDepartmentByCode(departmentCode);
    }

    @Override
    public PageInfo<OperatorPosition> findOperatorPositionByDepartmentCode(String departmentCode,
                                                                           Integer pageIndex,
                                                                           Integer limit) {
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(departmentMapperX.findOperatorPositionByDepartmentCode(departmentCode));
    }

    @Override
    public Department findDepartmentByOperator(String operator) {
        return departmentMapperX.findDepartmentByOperator(operator);
    }

}
