package com.gzsb.root.gzsbroot.service.rabc.impl;

import com.gzsb.root.gzsbroot.dao.entity.Permission;
import com.gzsb.root.gzsbroot.dao.entity.RolePermission;
import com.gzsb.root.gzsbroot.dao.mapper.PermissionMapper;
import com.gzsb.root.gzsbroot.dao.mapper.RolePermissionMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.RolePermissionMapperX;
import com.gzsb.root.gzsbroot.service.rabc.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/1 11:02
 * description:
 */
@Service
public class RolePermissionServiceImpl implements RolePermissionService {

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RolePermissionMapperX rolePermissionMapperX;

    @Override
    public int addRoleAndPermission(RolePermission rolePermission) {
        return rolePermissionMapper.insert(rolePermission);
    }

    @Override
    public int updateRolePermission(Permission rolePermission) {
        return permissionMapper.updateByPrimaryKey(rolePermission);
    }

    @Override
    public List<String> findAllRolePermission(String roleCode) {
        return rolePermissionMapperX.findAllRolePermission(roleCode);
    }

    @Override
    public void addRolePermission( RolePermission rolePermission) {
        // 添加角色权限之前先删除该角色所有的权限
        rolePermissionMapperX.deleteRolePermissionByRoleCode(rolePermission.getRoleCode());
        // 循环添加角色权限集合
        for(String permissionCode:rolePermission.getPermissionCodes()){
            rolePermissionMapperX.addRolePermission(permissionCode,rolePermission.getRoleCode());
        }

    }
}
