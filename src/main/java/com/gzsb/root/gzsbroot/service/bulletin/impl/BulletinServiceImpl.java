package com.gzsb.root.gzsbroot.service.bulletin.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Bulletin;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.BulletinMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.service.bulletin.BulletinService;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zouJunJie
 * @create 2019-10-31 9:44
 */
@Service
public class BulletinServiceImpl implements BulletinService {

    @Autowired
    private BulletinMapperX bulletinMapperX;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    /**
     * 1111
     * @param planStatusCode
     * @param departmentCode
     * @param typeCode
     * @param pageIndex
     * @param limit
     * @return
     */
    @Override
    public PageInfo<Bulletin> findAllBulletin(String planStatusCode,
                                              String departmentCode,
                                              String typeCode,
                                              Integer pageIndex,
                                              Integer limit) {
        // 如果类型为公司公告则查询所有部门的公告 否则查询自己当前部门的公告
        if(!"company".equals(typeCode)){
            // 查询当前登录账号部门
            SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
            OperatorPosition byOperator = departmentMapperX.findByOperator(so.getOperator());
            departmentCode = byOperator.getDepartmentCode();
            typeCode = "department";
        }
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(bulletinMapperX.findAllBulletin(planStatusCode,departmentCode,typeCode));
    }

    @Override
    public void addBulletin(Bulletin bulletin) {
        OperatorPosition byOperator = departmentMapperX.findByOperator(bulletin.getOperator());
        bulletin.setDepartmentCode(byOperator.getDepartmentCode());
        bulletinMapperX.addBulletin(bulletin);
    }

    @Override
    public void updateBulletin(Bulletin bulletin) {
        bulletinMapperX.updateBulletin(bulletin);
    }

    @Override
    public void deleteBylletin(Integer bulletinId) {
        bulletinMapperX.deleteBylletin(bulletinId);
    }
}
