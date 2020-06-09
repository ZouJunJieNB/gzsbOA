package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/1 10:01
 * description:
 */
public interface PermissionMapperX {
    /**
     * 根据权限编码删除权限
     * @param permissionCode
     * @return
     */
     int delete(@Param("permissionCode") String permissionCode);

    /**
     * 查询所有权限
     * @return
     */
     List<Permission> findAllPermission();
}
