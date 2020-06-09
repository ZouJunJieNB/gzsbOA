package com.gzsb.root.gzsbroot.service.departmentPosition.impl;

import com.gzsb.root.gzsbroot.dao.entity.DepartmentPosition;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentPositionMapperX;
import com.gzsb.root.gzsbroot.service.departmentPosition.DepartmentPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-27 15:01
 */
@Service
public class DepartmentPositionServiceImpl implements DepartmentPositionService {

    @Autowired
    private DepartmentPositionMapperX departmentPositionMapperX;

    @Override
    public List<DepartmentPosition> findByDepartmentCode(String departmentCode) {
        return departmentPositionMapperX.findByDepartmentCode(departmentCode);
    }

    @Override
    public void addDepartmentPosition(String departmentCode, String positionName) {
        departmentPositionMapperX.addDepartmentPosition(departmentCode,positionName);
    }
}
