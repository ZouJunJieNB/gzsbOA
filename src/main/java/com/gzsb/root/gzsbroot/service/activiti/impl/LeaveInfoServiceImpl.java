package com.gzsb.root.gzsbroot.service.activiti.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.activiti.LeaveCandidate;
import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;
import com.gzsb.root.gzsbroot.dao.mapperX.LeaveInfoMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorRoleX;
import com.gzsb.root.gzsbroot.service.activiti.LeaveInfoService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import com.gzsb.root.gzsbroot.utils.ListPageUtils;
import com.gzsb.root.gzsbroot.utils.Status;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author zouJunJie
 * @create 2019-10-23 11:06
 */
@Service
public class LeaveInfoServiceImpl implements LeaveInfoService {

    @Resource
    private LeaveInfoMapperX leaveInfoMapperX;

    @Resource
    private OperatorRoleX operatorRoleX;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Override
    public void insert(LeaveInfo leaveInfo) {
        leaveInfoMapperX.insert(leaveInfo);
    }

    @Override
    public void update(LeaveInfo leaveInfo) {

    }


    @Override
    public LeaveInfo QueryByUserId(String id) {
        return leaveInfoMapperX.QueryByUserId(id);
    }

    @Override
    public PageInfo<LeaveInfo> findByCode(String code, Integer pageIndex, Integer limit) {
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(leaveInfoMapperX.findByCode(code));
    }

    @Override
    public List<LeaveInfo> findPassByOperator(String operator) {
        return leaveInfoMapperX.findPassByOperator(operator);
    }

    @Override
    public void startProcessInstance(LeaveInfo leaveInfo) {
        //设置流程变量，将项目经理以及人事经理查询出来放入任务待办人
        Map<String,Object> var = new HashMap<>();
        LeaveCandidate leaveCandidate = new LeaveCandidate();
        leaveCandidate.setDivisionManager(operatorRoleX.findProjectManager());
        leaveCandidate.setPersonnelManager(operatorRoleX.findHrManager());
        var.put("leaveCandidate",leaveCandidate);

        // 一启动流程变量就创建一个对应的请假单，状态设置为待项目经理审核
        leaveInfo.setStatus(Status.LEAVE_0);
        leaveInfoMapperX.insert(leaveInfo);
        // 将请假单ID放入流程实例中
        runtimeService.startProcessInstanceByKey("leaveProcess", leaveInfo.getId(), var);
    }

    @Override
    public List<List> findCandidateTask(String operator, Integer pageIndex, Integer limit) {
        List<LeaveInfo> list = new ArrayList<>();
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(operator).list();
        for (Task task : taskList) {
            // 当前任务的流程实例ID
            String processInstanceId = task.getProcessInstanceId();
            // 根据流程实例ID获取流程实例对象
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            // 获取请假单ID根据ID查询请假信息
            LeaveInfo leaveInfo = leaveInfoMapperX.QueryByUserId(processInstance.getBusinessKey());
            // 将当前任务ID也传入leaveInfo
            leaveInfo.setTaskId(task.getId());
            list.add(leaveInfo);

        }
        //物理分页
        ListPageUtils listPageUtils = new ListPageUtils();
        listPageUtils.setPage(pageIndex);
        listPageUtils.setRow(limit);
        List newList = listPageUtils.listSplit(list);
        // 将总页数也传给前端方便前端分页
        List dataList = new ArrayList();
        dataList.add(newList);
        dataList.add(listPageUtils.getTotal());
        return dataList;
    }

    @Override
    public void claimTask(String taskId, String operator) {
        taskService.claim(taskId,operator);
    }

    @Override
    public List<List> findClaimTask(String operator,Integer pageIndex,Integer limit) {
        List<LeaveInfo> list = new ArrayList<>();
        List<Task> taskList = taskService.createTaskQuery().taskAssignee(operator).list();
        for (Task task : taskList) {
            // 当前任务的流程实例ID
            String processInstanceId = task.getProcessInstanceId();
            // 根据流程实例ID获取流程实例对象
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            // 获取请假单ID根据ID查询请假信息
            LeaveInfo leaveInfo = leaveInfoMapperX.QueryByUserId(processInstance.getBusinessKey());
            // 将当前任务ID也传入leaveInfo
            leaveInfo.setTaskId(task.getId());
            list.add(leaveInfo);

        }
        //物理分页
        ListPageUtils listPageUtils = new ListPageUtils();
        listPageUtils.setPage(pageIndex);
        listPageUtils.setRow(limit);
        List newList = listPageUtils.listSplit(list);
        // 将总页数也传给前端方便前端分页
        List dataList = new ArrayList();
        dataList.add(newList);
        dataList.add(listPageUtils.getTotal());
        return dataList;
    }

    @Override
    public void completeTask(String taskId,String judge,String msg) {
        msg = msg+'\n'+"审核时间："+ DateUtil.formatNormalDateString(new Date());
        // 根据taskId查询出Task，并且获取请假单ID
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(task.getProcessInstanceId()).singleResult();
        // 获取请假单ID
        String leaveId = processInstance.getBusinessKey();

            if(task.getName().equals("项目经理审批")){

                if(judge.equals("pass")){
                    // 如果同意修改状态为待人事审批
                    leaveInfoMapperX.updateStatus(Status.LEAVE_1,leaveId);
                }else{
                    // 不同意修改状态为已拒绝
                    leaveInfoMapperX.updateStatus(Status.LEAVE_3,leaveId);
                }
                leaveInfoMapperX.updateProjectRemarks(msg,leaveId);

            }else{

                if(judge.equals("pass")){
                    // 如果同意修改状态为同意
                    leaveInfoMapperX.updateStatus(Status.LEAVE_2,leaveId);
                }else{
                    // 否则拒绝
                    leaveInfoMapperX.updateStatus(Status.LEAVE_3,leaveId);
                }
                leaveInfoMapperX.updateHrRemarks(msg,leaveId);

            }
            Map map = new HashMap();
            map.put("judge",judge);
            taskService.complete(taskId,map);


    }

    @Override
    public void returnGroup(String taskId, String operator) {
        // 传入任务ID将此任务归还组任务，第二个参数可以直接指定负责人，如果为null则没负责人
        taskService.setAssignee(taskId,operator);
    }


}
