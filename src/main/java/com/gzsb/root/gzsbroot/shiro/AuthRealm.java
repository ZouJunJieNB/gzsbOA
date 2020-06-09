package com.gzsb.root.gzsbroot.shiro;

import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.service.rabc.OperatorService;
import com.gzsb.root.gzsbroot.shiro.OAuth2Token;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

/**
 * @author KW-NLL
 * @date 2019/10/10.
 */
public class AuthRealm extends AuthorizingRealm {

    @Resource
    private OperatorService operatorService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof OAuth2Token;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {


        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addStringPermissions(so.getPermissions());
        simpleAuthorizationInfo.addRoles(so.getRoles());

        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        // 这里的authenticationToken 不再是登录时的账号密码,而是自定义拦截器传入token
        String token = (String) authenticationToken.getPrincipal();

        // 判断缓存是否存在token而返回用户信息
        SystemOperator byToken = operatorService.findByToken(token);
        // 为空失效
        if(byToken==null){
            throw new IncorrectCredentialsException("token失效，请重新登录");
        }

        return new SimpleAuthenticationInfo(byToken,token, this.getName());
    }
}
