package com.gzsb.root.gzsbroot.service.rabc.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.*;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapper.OperatorMapper;
import com.gzsb.root.gzsbroot.dao.mapper.OperatorRoleMapper;
import com.gzsb.root.gzsbroot.dao.mapper.RolePermissionMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorPositionMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorRoleX;
import com.gzsb.root.gzsbroot.dao.mapperX.RolePermissionMapperX;
import com.gzsb.root.gzsbroot.service.rabc.OperatorRoleService;
import com.gzsb.root.gzsbroot.service.rabc.OperatorService;
import com.gzsb.root.gzsbroot.utils.GsonUtil;
import com.gzsb.root.gzsbroot.utils.RedisUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author KW-NLL,Pig Xue
 * @date 2019/10/10.
 */
@Service
public class OperatorServiceImpl implements OperatorService {


    @Autowired
    private OperatorMapperX operatorMapperX;

    @Autowired
    private OperatorMapper operatorMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Autowired
    private OperatorRoleMapper operatorRoleMapper;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private OperatorRoleService operatorRoleService;

    @Autowired
    private OperatorPositionMapperX operatorPositionMapperX;

    @Autowired
    private OperatorRoleX operatorRoleX;

    @Override
    public SystemOperator selectOperatorByUsername(String username) {

        SystemOperator so = operatorMapperX.selectOperatorByUsername(username);
        if(so == null){
            return null;
        }
        OperatorRoleExample oe = new OperatorRoleExample();
        oe.createCriteria().andOperatorEqualTo(username);
        List<OperatorRole> operatorRoles = operatorRoleMapper.selectByExample(oe);

        List<String> roles = operatorRoles.stream().map(OperatorRole::getRoleCode).collect(Collectors.toList());
        so.setRoles(roles);
        if (so.getRoles() == null || so.getRoles().isEmpty()) return so;
        RolePermissionExample e = new RolePermissionExample();
        e.createCriteria().andRoleCodeIn(so.getRoles());
        List<RolePermission> rolePermissions = rolePermissionMapper.selectByExample(e);
        //第一种lambda
        /*List<String> list = new ArrayList<>();
        rolePermissions.stream().forEach(item -> {
            list.add(item.getPermissionCode());
        });*/

        //第二种
        List<String> list = rolePermissions.stream().map(RolePermission::getPermissionCode).collect(Collectors.toList());

        so.setPermissions(list);
        return so;
    }

    @Override
    public PageInfo<Operator> selectOperatorFindAll(String departmentCode,
                                                    String realName,
                                                    String planStatusCode,Integer pageNum, Integer limt) {
        PageHelper.startPage(pageNum,limt);
        return new PageInfo<>(operatorMapperX.selectOperatorFindAll(departmentCode,realName,planStatusCode));
    }

    @Override
    public SystemOperator findByToken(String token) {

        //如果缓存中存在token,返回根据token查询到的用户信息
        if(redisUtils.hasKey(token)){
            // 每次访问重新定义过期时间
            redisUtils.expire(token, 60*60);
            // 查询redis出来实现反序列化
            return GsonUtil.GsonToBean(redisUtils.get(token).toString(),SystemOperator.class);
        }

        //否则返回空,realm接收空 抛出异常
        return null;
    }

    @Override
    public int updatePassword(String password, String passwordTow,String operator) {
        return operatorMapperX.updatePassword(DigestUtils.md5Hex(password),DigestUtils.md5Hex(passwordTow),operator);
    }

    @Override
    public Operator findOperatorByCode(String operator) {
        return operatorMapperX.findOperatorByCode(operator);
    }

    @Override
    public int addOperator(Operator operator) {
        // 创建用户时间
        operator.setCreateTime(new Date());
        // 密码加密
        operator.setPassword(DigestUtils.md5Hex(operator.getPassword()));
        // 给用户增加角色
        for(String code:operator.getRoleCodes()){
            operatorRoleService.addOperatorRole(operator.getOperator(),code);
        }

        // 给用户添加部门职位
        operatorPositionMapperX.addOperatorPosition(operator.getPositionId(),operator.getOperator());
        return operatorMapper.insert(operator);
    }

    @Override
    public int updateOperator(Operator operator) {

        // 更新用户角色之前先删除之前的角色
        operatorRoleX.deleteOperatorRole(operator.getOperator());
        // 更新用户职位
        operatorPositionMapperX.updateOperatorPosition(operator.getOperator(),operator.getPositionId());

        // 更新用户角色
        for(String code:operator.getRoleCodes()){
            operatorRoleService.addOperatorRole(operator.getOperator(),code);
        }
        return operatorMapper.updateByPrimaryKey(operator);
    }

    @Override
    public int deleteOperator(String operator) {
        // 删除用户角色
        operatorRoleX.deleteOperatorRole(operator);
        // 删除员工职位
        operatorPositionMapperX.deleteOperatorPosition(operator);
        // 删除用户信息
        return operatorMapper.deleteByPrimaryKey(operator);
    }

    @Override
    public List<Operator> findAll() {
        return operatorMapperX.selectOperatorFindAll(null,null,null);
    }

    @Override
    public int findOperatorByJobNum(String jobNum) {
        return operatorMapperX.findOperatorByJobNum(jobNum);
    }
}
