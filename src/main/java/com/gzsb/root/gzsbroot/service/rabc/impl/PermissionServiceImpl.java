package com.gzsb.root.gzsbroot.service.rabc.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Permission;
import com.gzsb.root.gzsbroot.dao.entity.PermissionExample;
import com.gzsb.root.gzsbroot.dao.entityX.RolePermissionX;
import com.gzsb.root.gzsbroot.dao.mapper.PermissionMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.PermissionMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.RolePermissionMapperX;
import com.gzsb.root.gzsbroot.service.rabc.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/21 15:10
 * description:
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    public PermissionMapper permissionMapper;

    @Autowired
    public RolePermissionMapperX rolePermissionMapperX;

    @Autowired
    private PermissionMapperX permissionMapperX;

    @Override
    public PageInfo<Permission> findAll(Integer pageNum,Integer limit) {
       PermissionExample permissionExample = new PermissionExample();
        PageHelper.startPage(pageNum,limit);
        return new PageInfo<Permission>(permissionMapper.selectByExample(permissionExample));
    }

    @Override
    public PageInfo<RolePermissionX> findUserAll(Integer pageNum, Integer limit) {
        PageHelper.startPage(pageNum,limit);
        return new PageInfo<RolePermissionX>(rolePermissionMapperX.selectFindAll());
    }

    @Override
    public int insertPermission(Permission permission) {
        return permissionMapper.insert(permission);
    }

    @Override
    public int deletePermission(String permissionCode) {
        // 删除权限前先删除角色权限表的权限编码
        rolePermissionMapperX.deleteRolePermissionBypermissionCode(permissionCode);
        return permissionMapperX.delete(permissionCode);
    }

    @Override
    public List<Permission> findAllPermission() {
        return permissionMapperX.findAllPermission();
    }

}
