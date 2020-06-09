package com.gzsb.root.gzsbroot.service.departmentPosition;

import com.gzsb.root.gzsbroot.dao.entity.DepartmentPosition;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-27 15:01
 */
public interface DepartmentPositionService {
    /**
     * 根据部门编码查询部门职位信息
     * @param departmentCode
     * @return
     */
    List<DepartmentPosition> findByDepartmentCode(String departmentCode);
    /**
     * 新增职位信息
     * @param departmentCode
     * @param positionName
     */
    void addDepartmentPosition(String departmentCode,
                               String positionName);
}
