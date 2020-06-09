package com.gzsb.root.gzsbroot.service.rabc;

import com.gzsb.root.gzsbroot.dao.entity.Permission;
import com.gzsb.root.gzsbroot.dao.entity.RolePermission;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/1 11:01
 * description:
 */
public interface RolePermissionService {

    /**
     *
     * @param rolePermission
     * @return
     */
    int addRoleAndPermission(RolePermission rolePermission);

    /**
     *
     * @param rolePermission
     * @return
     */
    int updateRolePermission(Permission rolePermission);

    /**
     * 根据角色编码查询该角色的所有权限
     * @param roleCode
     * @return
     */
    List<String> findAllRolePermission(String roleCode);
    /**
     * 添加角色权限
     * @param permissionCodes
     * @param roleCode
     */
    void addRolePermission( RolePermission rolePermission);
}
