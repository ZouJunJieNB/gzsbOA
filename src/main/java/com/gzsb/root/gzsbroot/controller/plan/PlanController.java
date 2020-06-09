package com.gzsb.root.gzsbroot.controller.plan;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entity.Plan;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.PlanMapperX;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.department.DepartmentService;
import com.gzsb.root.gzsbroot.service.plan.PlanService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import com.gzsb.root.gzsbroot.utils.Status;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @author zouJunJie
 * @create 2019-11-01 15:05
 */
@RestController
@RequestMapping("/plan")
public class PlanController extends AbstractController {

    @Autowired
    private PlanService planService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private TypeService typeService;

    /**
     * 查询计划
     * 根据部门code
     * 根据状态
     * 根据类型
     * @param departmentCode
     * @param planStatusCode
     * @param typeCode
     * @param pageIndex
     * @param limit
     * @return
     */
    @PostMapping("/findAllLeader")
    public Message findAllLeader(@RequestParam("departmentCode")String departmentCode,
                                 @RequestParam("planStatusCode")String planStatusCode,
                                 @RequestParam("typeCode")String typeCode,
                                 @RequestParam("pageIndex")Integer pageIndex,
                                 @RequestParam("limit")Integer limit){

        return Message.success(planService.findAllPlan(departmentCode,null,planStatusCode,typeCode,pageIndex,limit));
    }

    /**
     * 查询个人发布的计划
     * @return
     */
    @GetMapping("/findByOperator/{pageIndex}/{limit}")
    public Message findByOperator(@PathVariable("pageIndex")Integer pageIndex,
                                  @PathVariable("limit")Integer limit){
        // 查询当前登录账号
        SystemOperator so =  getSystemOperator();
        System.out.println(so.getOperator());
        return Message.success(planService.findAllPlan(null,so.getOperator(),null,null,pageIndex,limit));
    }

    /**
     * 查询当前部门发布的工作计划
     * 根据已完成或未完成
     * @param planStatusCode
     * @return
     */
    @PostMapping("/findBydepartmentCode")
    public Message findBydepartmentCode(@RequestParam String planStatusCode,
                                        @RequestParam("pageIndex")Integer pageIndex,
                                        @RequestParam("limit")Integer limit){

        // 查询当前登录账号
        SystemOperator so =  getSystemOperator();
        // 根据当前登录操作员查询部门信息
        OperatorPosition byOperator = departmentService.findByOperator(so.getOperator());
        System.out.println(byOperator);
        return Message.success(planService.findAllPlan(byOperator.getDepartmentCode(),null,planStatusCode,TypeFinal.WORKPLAN,pageIndex,limit));
    }

    /**
     * 新增计划
     * @param plan
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Plan plan){

        planService.addPlan(plan);
        return Message.success();
    }

    /**
     * 异步查询计划类型
     * @return
     */
    @GetMapping("/findPlanType")
    public Message findPlanType(){
        return Message.success(typeService.findByFatherCode(TypeFinal.PLAN));
    }


    /**
     * 根据planId删除计划
     * @param planId
     * @return
     */
    @DeleteMapping("/delete/{planId}")
    public Message delete(@PathVariable Integer planId){
        planService.deletePlan(planId);
        return Message.success();
    }

    /**
     * 计划完成提交
     * @param planId
     * @return
     */
    @GetMapping("/commitPlan/{planId}")
    public Message commitPlan(@PathVariable Integer planId){
        planService.updatePlan(Status.PLAN_1,planId);
        return Message.success();
    }

    /**
     * 根据planId查询计划
     * @param planId
     * @return
     */
    @GetMapping("/findById/{planId}")
    public Message findById(@PathVariable Integer planId){
        return Message.success(planService.findById(planId));
    }

    /**
     * 计划延期
     * @param planTime 更新计划时间
     * @param planId
     * @param oldTime 原计划时间
     * @param delayDays 原延期天数
     * @return
     */
    @PutMapping("/updateTime")
    public Message updateTime(@RequestParam("planTime")String planTime,
                              @RequestParam("planId") Integer planId,
                              @RequestParam("oldTime")String oldTime,
                              @RequestParam("delayDays")Integer delayDays){
        Date date = DateUtil.stringToDate(planTime, "yyyy-MM-dd");
        planService.updateTime(date,planId);
        // 计算原日期和更新的日期之间的天数
        int day = DateUtil.daysBetween(DateUtil.stringToDate(oldTime,"yyyy-MM-dd"), date, "yyyy-MM-dd");
        // 更新延期日期
        planService.updateDelayDays(day+delayDays,planId);
        return Message.success();
    }



}
