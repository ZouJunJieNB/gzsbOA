package com.gzsb.root.gzsbroot;

import com.gzsb.root.gzsbroot.activiti.LeaveCandidate;
import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;
import com.gzsb.root.gzsbroot.dao.mapperX.LeaveInfoMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.OperatorRoleX;
import com.gzsb.root.gzsbroot.service.activiti.LeaveInfoService;
import com.gzsb.root.gzsbroot.service.rabc.OperatorService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import org.activiti.engine.*;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GzsbRootApplicationTests {

    @Resource
    TaskService taskService;

    @Resource
    private HistoryService historyService;

    @Autowired
    private OperatorService operatorService;

    @Test
    public void contextLoads() {
    }
    @Resource
    private LeaveInfoMapperX leaveInfoMapperX;



    @Resource
    private RepositoryService repositoryService;

    @Test
    public void test1() {
        //3.得到ProcessDefinitionQuery对象，可以认为这个对象就是个查询器，查询rs相关的表信息
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();

        //4.根据条件查询流程定义 这里根据流程定义的key来查询
        List<ProcessDefinition> definitionList = processDefinitionQuery.processDefinitionKey("leaveProcess")
                .list();

        //5.输出流程定义信息
        for (ProcessDefinition processDefinition : definitionList) {
            System.out.println("流程定义的ID: "+processDefinition.getId());
            System.out.println("流程定义的名称: "+processDefinition.getName());
            System.out.println("流程定义的Key: "+processDefinition.getKey());
            System.out.println("流程定义的版本号: "+processDefinition.getVersion());
            System.out.println("流程部署的ID: "+processDefinition.getDeploymentId());
            // 删除这个部署了的流程定义根据流程部署的ID，但是如果这个流程定义存在流程实例在启动的话就会报错！
            // 但是可以强制删除,第二个参数设置为true就会进行级联操作，会将当前流程定义所有相关的信息都删除。包括历史表信息
            repositoryService.deleteDeployment(processDefinition.getDeploymentId(),true);
//            repositoryService.deleteDeployment(processDefinition.getDeploymentId());
        }

    }
    @Resource
    private RuntimeService runtimeService;
    @Resource
    LeaveInfoService leaveInfoService;
    @Test
    public void test2(){
        LeaveInfo leaveInfo = new LeaveInfo();
        leaveInfo.setRealName("麻花疼");
        leaveInfo.setUserCode("Pony");
        leaveInfo.setEndTime(new Date());
        leaveInfo.setStartTime(new Date());
        leaveInfo.setStatus("hand");
        leaveInfo.setLeaveMsg("我就要请假");
        leaveInfoService.insert(leaveInfo);
        Map<String,Object> map = new HashMap<>();
        LeaveCandidate leaveCandidate = new LeaveCandidate();
        leaveCandidate.setDivisionManager(operatorRoleX.findProjectManager());
        leaveCandidate.setPersonnelManager(operatorRoleX.findHrManager());
        map.put("leaveCandidate",leaveCandidate);
        runtimeService.startProcessInstanceByKey("leaveProcess",leaveInfo.getId(),map);
    }
    @Resource
    private OperatorRoleX operatorRoleX;
    @Test
    public void test3(){
        Map map = new HashMap();
        map.put("judge","pass");
//        runtimeService.setVariable("85001","judge","pass");
        taskService.complete("135009");
    }
    @Test
    public void test4(){
        List<Task> xiaoxiong = taskService.createTaskQuery().taskCandidateUser("kunkun").list();
        for (Task task : xiaoxiong) {
            System.out.println(task.getName());
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
            System.out.println(processInstance.getBusinessKey());
            //认领
//            taskService.claim(task.getId(),"giao");
        }
    }
//
//
//
//    //启动一个请假流程(新增一个请假单)
//    @Test
//    public void startProc(){
//        LeaveInfo leaveInfo = new LeaveInfo();
//        leaveInfo.setId("20");
//        leaveInfo.setLeave_msg("生病");
//        leaveInfo.setDays("1");
//        leaveInfo.setUser_code("张大炮"); //这里模拟当前登录用户名
//        leaveInfoMapperX.insert(leaveInfo);
//        ProcessInst-、ance processInstance = leaveService.startProcess(leaveInfo.getId());
//        Task task = taskService.createTaskQuery()
//                .processInstanceId(processInstance.getId())
//                .singleResult();
//        System.out.println(task);
//        taskService.setVariable(task.getId(),"id",leaveInfo.getId());
//        taskService.setVariable(task.getId(),"leave_msg",leaveInfo.getLeave_msg());
//        taskService.setVariable(task.getId(),"days",leaveInfo.getDays());
//        taskService.setVariable(task.getId(),"user_code",leaveInfo.getUser_code());
//    }
//
//
//    //项目经理查询自己的待办任务
//    @Test
//    public void queryTestProjectManager(){
//        //这里传入的一般是id,即key
//        List<Task> project1 =
//                leaveService.findTaskByUserId("jj");
//        for(Task task : project1) {
//            System.out.println(task);
//            System.out.println("请假天数:"+taskService.getVariable(task.getId(),"days"));
//            System.out.println("原因:"+taskService.getVariable(task.getId(),"leave_msg"));
//            System.out.println("用户:"+taskService.getVariable(task.getId(),"user_code"));
//            System.out.println("id:"+taskService.getVariable(task.getId(),"id"));
//
//        }
//
//
//    }
//
//    //项目经理完成审批
//    @Test
//    public void auditByProjectManager(){
//        leaveService.completeTaskByUser("82506","jj","pass");
//    }
//
//    //人事经理查询自己的待办任务
//    @Test
//    public void queryTestHrManager(){
//        //这里传入的一般是id,即key
//        List<Task> project1 = leaveService.findTaskByUserId("dajiji");
//        for(Task task : project1){
//            System.out.println(task);
//            System.out.println("请假天数:"+taskService.getVariable(task.getId(),"days"));
//            System.out.println("原因:"+taskService.getVariable(task.getId(),"leave_msg"));
//            System.out.println("用户:"+taskService.getVariable(task.getId(),"user_code"));
//            System.out.println("id:"+taskService.getVariable(task.getId(),"id"));
//        }
//
//    }
//
//    //人事经理完成审批
//    @Test
//    public void auditByHrManager(){
//        leaveService.completeTaskByUser("75004","dajiji","pass");
//    }
    @Test
    public void date(){
        String s = DateUtil.addDateMinut(new Date(), 1,"HH:mm");
        System.out.println(s);
    }
    @Test
    public void test5(){
        LeaveInfo leaveInfo = new LeaveInfo();
        leaveInfo.setLeaveMsg("456456");
        leaveInfoService.startProcessInstance(leaveInfo);
    }

    @Test
    public void test6(){
        List<List> list = leaveInfoService.findCandidateTask("kunkun", 1, 6);
        List list1 = (List<LeaveInfo>) list.get(0);
        System.out.println(list.get(1));

        for (Object leaveInfo : list1) {
            LeaveInfo leaveInfo1 = (LeaveInfo)leaveInfo;
            System.out.println(leaveInfo);
            leaveInfoService.claimTask(leaveInfo1.getTaskId(),"kunkun");


        }
    }
    @Test
    public void test7(){
        List<List> list = leaveInfoService.findClaimTask("kunkun",1,2);
        List list1 = (List<LeaveInfo>) list.get(0);
        for (Object leaveInfo : list1) {
            System.out.println(leaveInfo);
            System.out.println(leaveInfo);
//            leaveInfoService.completeTask(leaveInfo.getTaskId(),"pass","好，我看好你，我同意");

        }
    }
    @Test
    public void test8(){
        leaveInfoService.returnGroup("172508",null);
    }

}
