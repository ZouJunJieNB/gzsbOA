package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Emal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-31 20:01
 */
public interface EmailMapperX {

    /**
     * 发送邮件
     * @param emal
     */
    void addEmail(Emal emal);

    /**
     * 根据条件查询邮件
     * @param planStatusCode
     * @param receive
     * @return
     */
    List<Emal> findEmail(@Param("planStatusCode") String planStatusCode,
                         @Param("receive") String receive,
                         @Param("operator") String operator);



    /**
     * 更新邮件状态
     * @param planStatusCode
     * @param emailId
     */
    void updateStatus(@Param("planStatusCode") String planStatusCode,@Param("emailId") Integer emailId);

    /**
     * 删除邮件根据邮件Id
     * @param emailId
     */
    void deleteEmail(@Param("emailId")Integer emailId);

    /**
     * 查看自己未读的邮件个数
     * @param receive
     * @return
     */
    int findEmailCount(@Param("receive")String receive);

    /**
     * 更改状态为已读根据emailId
     * @param emailId
     */
    void updateStatusById(@Param("emailId")Integer emailId);

}
