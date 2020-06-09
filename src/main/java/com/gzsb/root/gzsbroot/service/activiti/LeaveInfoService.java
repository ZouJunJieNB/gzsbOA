package com.gzsb.root.gzsbroot.service.activiti;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-23 11:05
 */
public interface LeaveInfoService {

    /**
     * 新增请假单
     * @param leaveInfo
     */
    void insert(LeaveInfo leaveInfo);

    /**
     * 更改请假单状态
     * @param leaveInfo
     */
    void update(LeaveInfo leaveInfo);

    /**
     * 根据id查询请假单信息
     * @param id
     * @return
     */
    LeaveInfo QueryByUserId(String id);

    /**
     * 根据当前登录用户查询请假记录
     * @param code
     * @return
     */
    PageInfo<LeaveInfo> findByCode(String code,Integer pageIndex,Integer limit);

    /**
     * 根据账号查询出所有通过审核的请假记录
     * @param operator
     * @return
     */
    List<LeaveInfo> findPassByOperator(String operator);

    /**
     * 填写请假申请以及启动流程实例
     * @param leaveInfo
     */
    void startProcessInstance(LeaveInfo leaveInfo);



    /**
     * 查看自己的待办任务
     * @param operator
     */
    List<List> findCandidateTask(String operator, Integer pageIndex, Integer limit);

    /**
     * 认领任务
     * @param taskId
     * @param operator
     */
    void claimTask(String taskId,String operator);

    /**
     * 查看已认领的任务
     * @param operator
     * @return
     */
    List<List> findClaimTask(String operator,Integer pageIndex,Integer limit);

    /**
     * 审批任务
     * @param taskId 任务ID
     * @param judge 是否同意
     * @param msg 备注
     */
    void completeTask(String taskId,String judge,String msg);

    /**
     * 归还组任务，或者重新指定任务负责人
     * @param taskId
     * @param operator
     */
    void returnGroup(String taskId,String operator);


}
