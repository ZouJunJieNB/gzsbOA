package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-21 16:50
 */

public interface LeaveInfoMapperX {

    /**
     * 新增请假单
     * @param leaveInfo
     */
    void insert(LeaveInfo leaveInfo);

    /**
     * 更改请假单状态
     * @param status
     */
    void updateStatus(@Param("status") String status,@Param("id") String id);

    /**
     * 人事添加备注
     * @param hrRemarks
     */
    void updateHrRemarks(@Param("hrRemarks") String hrRemarks,@Param("id") String id);
    /**
     * 项目经理添加备注
     * @param projectRemarks
     */
    void updateProjectRemarks(@Param("projectRemarks") String projectRemarks,@Param("id") String id);


    /**
     * 根据id查询请假单信息
     * @param id
     * @return
     */
    LeaveInfo QueryByUserId(@Param("id") String id);

    /**
     * 根据当前登录用户查询请假记录
     * @param code
     * @return
     */
    List<LeaveInfo> findByCode(@Param("code") String code);

    /**
     * 根据账号查询出所有通过审核的请假记录
     * @param operator
     * @return
     */
    List<LeaveInfo> findPassByOperator(@Param("operator")String operator);

    /**
     * 根据当前登录人和状态查询查询
     * @param operator
     * @param status
     * @return
     */
    List<LeaveInfo> findByOperatorAndStatus(@Param("operator")String operator
            ,@Param("status")String status);




}
