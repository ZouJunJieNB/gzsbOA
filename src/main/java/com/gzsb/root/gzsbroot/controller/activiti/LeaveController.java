package com.gzsb.root.gzsbroot.controller.activiti;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.activiti.LeaveInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author zouJunJie
 * @create 2020-01-19 14:57
 */
@RestController
@RequestMapping("/leave")
public class LeaveController extends AbstractController {

    @Autowired
    private LeaveInfoService leaveInfoService;

    /**
     * 查询自己的请假记录
     * @param pageIndex
     * @param limit
     * @return
     */
    @GetMapping("/findByCode/{pageIndex}/{limit}")
    public Message findByCode(@PathVariable Integer pageIndex,
                              @PathVariable Integer limit){
        return Message.success(leaveInfoService.findByCode(getSystemOperator().getOperator(),pageIndex,limit));
    }

    /**
     * 填入请假单,启动流程实例
     * @param leaveInfo
     * @return
     */
    @PostMapping("/startProcessInstance")
    public Message startProcessInstance(@RequestBody LeaveInfo leaveInfo){
        leaveInfo.setUserCode(getSystemOperator().getOperator());
        leaveInfo.setRealName(getSystemOperator().getRealName());
        leaveInfoService.startProcessInstance(leaveInfo);
        return Message.success();
    }

    /**
     * 查看自己的待办任务
     * @return
     */
    @GetMapping("/findCandidateTask/{pageIndex}/{limit}")
    public Message findCandidateTask(@PathVariable Integer pageIndex,
                                     @PathVariable Integer limit){
        return Message.success(leaveInfoService.findCandidateTask(getSystemOperator().getOperator(),pageIndex,limit));
    }

    /**
     * 认领任务
     * @param taskId
     * @return
     */
    @GetMapping("/claimTask/{taskId}")
    public Message claimTask(@PathVariable String taskId){
        leaveInfoService.claimTask(taskId,getSystemOperator().getOperator());
        return Message.success();
    }

    /**
     * 查看自己认领的任务
     * @return
     */
    @GetMapping("/findClaimTask/{pageIndex}/{limit}")
    public Message findClaimTask(@PathVariable Integer pageIndex,
                                 @PathVariable Integer limit){
        return Message.success(leaveInfoService.findClaimTask(getSystemOperator().getOperator(),pageIndex,limit));
    }

    /**
     * 完成任务
     * @param taskId
     * @param judge
     * @param msg
     * @return
     */
    @PostMapping("/completeTask")
    public Message completeTask(@RequestParam String taskId,
                                @RequestParam String judge,
                                @RequestParam String msg){
        leaveInfoService.completeTask(taskId,judge,msg);
        return Message.success();
    }

    /**
     * 归还组任务
     * @param taskId
     * @return
     */
    @PostMapping("/returnGroup")
    public Message returnGroup(@RequestParam String taskId){
        leaveInfoService.returnGroup(taskId,null);
        return Message.success();
    }




}
