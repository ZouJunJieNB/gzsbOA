package com.gzsb.root.gzsbroot.dao.mapperX;


import com.gzsb.root.gzsbroot.dao.entity.OperatorRole;
import com.gzsb.root.gzsbroot.dao.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-23 10:22
 */
public interface OperatorRoleX {
    /**
     * 查询所有项目经理
     * @return
     */
    List<String> findProjectManager();

    /**
     * 查询所有人事经理
     * @return
     */
    List<String> findHrManager();

    /**
     * 查询所有角色
     * @return
     */
    List<Role> findAllRole();

    /**
     * 新增用户角色
     * @param operator
     * @param roleCode
     */
    void addOperatorRole(@Param("operator")String operator,@Param("roleCode")String roleCode);

    /**
     * 删除用户角色根据用户名
     * @param operator
     */
    void deleteOperatorRole(@Param("operator")String operator);

    /**
     * 删除用户角色根据角色code
     * @param roleCode
     */
    void deleteOperatorRoleByRoleCode(@Param("roleCode")String roleCode);

}
