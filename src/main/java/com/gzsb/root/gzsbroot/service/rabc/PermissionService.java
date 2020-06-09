package com.gzsb.root.gzsbroot.service.rabc;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Permission;
import com.gzsb.root.gzsbroot.dao.entityX.RolePermissionX;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/21 15:10
 * description:
 */
public interface PermissionService {
      /**
       * 分页查询所有权限
       * @param pageNum
       * @param limit
       * @return
       */
      PageInfo<Permission> findAll(Integer pageNum, Integer limit);

      /**
       * 分页查询所有角色权限
       * @param pageNum
       * @param limit
       * @return
       */
      PageInfo<RolePermissionX> findUserAll(Integer pageNum, Integer limit);

      /**
       * 添加权限
       * @param permission
       */
      int insertPermission(Permission permission);

      /**
       * 删除权限
       * @param permissionCode
       * @return
       */
      int deletePermission(String permissionCode);

      /**
       * 不分页查询所有权限
       * @return
       */
      List<Permission> findAllPermission();

}
