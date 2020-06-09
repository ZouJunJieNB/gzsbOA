package com.gzsb.root.gzsbroot.service.rabc.impl;

import com.gzsb.root.gzsbroot.dao.mapperX.OperatorRoleX;
import com.gzsb.root.gzsbroot.service.rabc.OperatorRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zouJunJie
 * @create 2019-11-27 15:47
 */
@Service
public class OperatorRoleServiceImpl implements OperatorRoleService {

    @Autowired
    private OperatorRoleX operatorRoleX;

    @Override
    public void addOperatorRole(String operator, String roleCode) {
        operatorRoleX.addOperatorRole(operator,roleCode);
    }
}
