package com.gzsb.root.gzsbroot.service.email;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Emal;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-31 20:06
 */
public interface EmailService {

    /**
     * 发送邮件
     * @param emal
     */
    void addEmail(Emal emal);

    /**
     * 查询自己收件
     * @param planStatusCode
     * @param pageIndex
     * @param limit
     * @return
     */
    PageInfo<Emal> findEmail(String planStatusCode,Integer pageIndex,Integer limit);

    /**
     * 查询自己发件
     * @param pageIndex
     * @param limit
     * @return
     */
    PageInfo<Emal> findSendEmail(Integer pageIndex,Integer limit);
    /**
     * 更新邮件状态
     * @param planStatusCode
     * @param emailId
     */
    void updateStatus(String planStatusCode,Integer emailId);
    /**
     * 删除邮件根据邮件Id
     * @param emailId
     */
    void deleteEmail(Integer emailId);

    /**
     * 查看自己未读的邮件个数
     * @param receive
     * @return
     */
    int findEmailCount(String receive);

    /**
     * 更改状态为已读根据emailId
     * @param emailId
     */
    void updateStatusById(Integer emailId);
}
