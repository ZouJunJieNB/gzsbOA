package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.DepartmentPosition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-27 14:53
 */
public interface DepartmentPositionMapperX {
    /**
     * 根据部门编码查询部门职位信息
     * @param departmentCode
     * @return
     */
    List<DepartmentPosition> findByDepartmentCode(@Param("departmentCode")String departmentCode);

    /**
     * 新增职位信息
     * @param departmentCode
     * @param positionName
     */
    void addDepartmentPosition(@Param("departmentCode")String departmentCode,
                               @Param("positionName")String positionName);

    /**
     * 删除整个部门的职位
     * @param departmentCode
     */
    void deleteDepartmentPosition(@Param("departmentCode")String departmentCode);
}
