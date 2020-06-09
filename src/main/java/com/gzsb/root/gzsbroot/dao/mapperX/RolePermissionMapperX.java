package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.RolePermission;
import com.gzsb.root.gzsbroot.dao.entityX.OperatorRolePositionX;
import com.gzsb.root.gzsbroot.dao.entityX.RolePermissionX;
import org.apache.ibatis.annotations.Param;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/23 8:45
 * description:
 */
public interface RolePermissionMapperX {

    /**
     *
     * @return
     */
    List<RolePermissionX> selectFindAll();

    /**
     *
     * @return
     */
    List<OperatorRolePositionX> selectRoleFindAll();

    /**
     * 根据角色编码查询该角色的所有权限
     * @param roleCode
     * @return
     */
    List<String> findAllRolePermission(@Param("roleCode")String roleCode);

    /**
     * 根据角色删除该角色所有权限
     */
    void deleteRolePermissionByRoleCode(@Param("roleCode")String roleCode);

    /**
     * 添加角色权限
     * @param permissionCode
     * @param roleCode
     */
    void addRolePermission(@Param("permissionCode")String permissionCode,
                           @Param("roleCode")String roleCode);

    /**
     * 根据权限编码删除该角色的该权限
     * @param permissionCode
     */
    void deleteRolePermissionBypermissionCode(@Param("permissionCode")String permissionCode);
}
