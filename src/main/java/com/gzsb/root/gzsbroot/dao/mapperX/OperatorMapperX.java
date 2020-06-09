package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Operator;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OperatorMapperX {

    SystemOperator selectOperatorByUsername(@Param("username") String username);

    /**
     * 修改密码
     * @param password
     * @param passwordTow
     * @return
     */
    int updatePassword(String password,String passwordTow,String operator);

    /**
     * 查询全部
     * @return
     */
    List<Operator> selectOperatorFindAll(@Param("departmentCode")String departmentCode,
                                         @Param("realName")String realName,
                                         @Param("planStatusCode")String planStatusCode);

    /**
     * 根据账号查询用户信息
     * @param operator
     * @return
     */
    Operator findOperatorByCode(@Param("operator")String operator);

    /**
     * 根据工号查询用户是否存在
     * @param jobNum
     * @return
     */
    int findOperatorByJobNum(@Param("jobNum") String jobNum);

}