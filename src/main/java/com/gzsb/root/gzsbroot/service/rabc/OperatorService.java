package com.gzsb.root.gzsbroot.service.rabc;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Operator;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.RolePermissionMapperX;

import java.util.List;

/**
 * @author KW-NLL
 * @date 2019/10/10.
 */
public interface OperatorService {


    /**
     * 查询用户是否存在
     * @param username
     * @return
     */
    SystemOperator selectOperatorByUsername(String username);

    /**
     * 查询当前角色所有信息
     * @param pageNum
     * @param limt
     * @return
     */
    PageInfo<Operator> selectOperatorFindAll(String departmentCode,
                                             String realName,
                                             String planStatusCode,
                                             Integer pageNum,
                                             Integer limt);

    /**
     * 查询缓存是否存在token
     * @param token
     * @return
     */
    SystemOperator findByToken(String token);

    /**
     * 修改密码
     * @param password
     * @param passwordTow
     * @return
     */
    int updatePassword(String password,String passwordTow,String operator);

    /**
     * 根据账号查询用户信息
     * @param operator
     * @return
     */
    Operator findOperatorByCode(String operator);

    /**
     * 添加操作员
     * @param operator
     * @return
     */
    int addOperator(Operator operator);

    /**
     * 更新操作员
     * @param operator
     * @return
     */
    int updateOperator(Operator operator);

    /**
     * 删除操作员
     * @param operator
     * @return
     */
    int deleteOperator(String operator);

    /**
     * 查询所有用户
     * @return
     */
    List<Operator> findAll();

    /**
     * 根据工号查询用户是否存在
     * @param jobNum
     * @return
     */
    int findOperatorByJobNum(String jobNum);

}
