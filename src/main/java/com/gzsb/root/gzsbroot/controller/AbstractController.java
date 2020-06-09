package com.gzsb.root.gzsbroot.controller;

import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.execution.RRException;
import org.apache.shiro.SecurityUtils;

/**
 * 公共controller
 * @author zouJunJie
 * @create 2019-11-15 10:51
 */
public abstract class AbstractController {

    /**
     * 获取当前登录用户信息
     * @return
     */
    protected SystemOperator getSystemOperator(){
        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        if(so == null){
            throw  new RRException("登录失效！请重新登录", 401, new Exception());
        }
        return so;
    }

}
