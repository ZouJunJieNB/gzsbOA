package com.gzsb.root.gzsbroot.service.email.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Emal;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.EmailMapperX;
import com.gzsb.root.gzsbroot.service.email.EmailService;
import com.gzsb.root.gzsbroot.utils.Status;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-31 20:06
 */
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailMapperX emailMapperX;

    @Override
    public void addEmail(Emal emal) {
        // 获取当前用户名
        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        System.out.println("Operator: "+so.getOperator());
        emal.setOperator(so.getOperator());

        // 判断时间是否在当前时间之后添加状态
        if(emal.getSendTime().after(new Date())){
            emal.setPlanStatusCode(Status.EMAIL_0);
        }else{
            emal.setPlanStatusCode(Status.EMAIL_1);
        }
        // 根据收件人循环发送邮件
        for(String reaName : emal.getReceiveList()){
            emal.setReceive(reaName);
            System.out.println(emal);
            emailMapperX.addEmail(emal);
        }
    }

    @Override
    public PageInfo<Emal> findEmail(String planStatusCode, Integer pageIndex, Integer limit) {
        // 获取当前登录用户名
        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(emailMapperX.findEmail(planStatusCode,so.getOperator(),null));
    }

    @Override
    public PageInfo<Emal> findSendEmail(Integer pageIndex, Integer limit) {
        // 获取当前登录用户名
        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(emailMapperX.findEmail(null,null,so.getOperator()));
    }

    @Override
    public void updateStatus(String planStatusCode, Integer emailId) {
        emailMapperX.updateStatus(planStatusCode,emailId);
    }

    @Override
    public void deleteEmail(Integer emailId) {
        emailMapperX.deleteEmail(emailId);
    }

    @Override
    public int findEmailCount(String receive) {
        return emailMapperX.findEmailCount(receive);
    }

    @Override
    public void updateStatusById(Integer emailId) {
        emailMapperX.updateStatusById(emailId);
    }
}
