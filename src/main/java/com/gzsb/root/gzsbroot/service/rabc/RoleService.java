package com.gzsb.root.gzsbroot.service.rabc;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Role;
import com.gzsb.root.gzsbroot.dao.entityX.OperatorRolePositionX;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/28 14:19
 * description:
 */
public interface RoleService {
    /**
     * 查询所有用户
     * @param pageNum
     * @param limt
     * @return
     */
    PageInfo<OperatorRolePositionX> findRoleUserAll(Integer pageNum,Integer limt);

    /**
     *
     * @param role
     * @return
     */
    int addRole(Role role);

    /**
     * 查询全部角色
     * @param pageNum
     * @param limit
     * @return
     */
    PageInfo<Role> findRoleAll(Integer pageNum,Integer limit);

    /**
     * 删除角色
     * @param role
     * @return
     */
    int deleteRole(String role);

    /**
     * 修改角色
     * @param role
     * @return
     */
    int updateRole(Role role);

}
