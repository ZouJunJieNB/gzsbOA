package com.gzsb.root.gzsbroot.service.rabc.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Role;
import com.gzsb.root.gzsbroot.dao.entityX.OperatorRolePositionX;
import com.gzsb.root.gzsbroot.dao.mapper.RoleMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorRoleX;
import com.gzsb.root.gzsbroot.dao.mapperX.RolePermissionMapperX;
import com.gzsb.root.gzsbroot.service.rabc.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/28 14:21
 * description:
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RolePermissionMapperX rolePermissionMapperX;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private OperatorRoleX operatorRoleX;

    @Override
    public PageInfo<OperatorRolePositionX> findRoleUserAll(Integer pageNum, Integer limit) {
        PageHelper.startPage(pageNum,limit);
        return new PageInfo<>(rolePermissionMapperX.selectRoleFindAll());
    }

    @Override
    public int addRole(Role role) {
        return roleMapper.insert(role);
    }

    @Override
    public PageInfo<Role> findRoleAll(Integer pageNum, Integer limit) {
        PageHelper.startPage(pageNum,limit);
        return new PageInfo<>(roleMapper.selectByExample(null));
    }

    @Override
    public int deleteRole(String role) {
        // 删除角色之前先删除用户角色表
        operatorRoleX.deleteOperatorRoleByRoleCode(role);
        return roleMapper.deleteByPrimaryKey(role);
    }

    @Override
    public int updateRole(Role role) {
        return roleMapper.updateByPrimaryKey(role);
    }

}
