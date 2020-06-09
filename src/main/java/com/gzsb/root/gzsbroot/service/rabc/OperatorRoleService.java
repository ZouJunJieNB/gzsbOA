package com.gzsb.root.gzsbroot.service.rabc;

/**
 * @author zouJunJie
 * @create 2019-11-27 15:47
 */
public interface OperatorRoleService {

    /**
     * 新增用户角色
     * @param operator
     * @param roleCode
     */
    void addOperatorRole(String operator,String roleCode);
}
