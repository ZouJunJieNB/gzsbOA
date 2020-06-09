package com.gzsb.root.gzsbroot.service.plan.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entity.Plan;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.PlanMapperX;
import com.gzsb.root.gzsbroot.service.plan.PlanService;
import com.gzsb.root.gzsbroot.utils.Status;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 14:59
 */
@Service
public class PlanServiceImpl implements PlanService {

    @Autowired
    private PlanMapperX planMapperX;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    @Override
    public void addPlan(Plan plan) {
        // 查询当前登录账号
        SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        // 根据当前登录操作员查询部门信息
        OperatorPosition byOperator = departmentMapperX.findByOperator(so.getOperator());

        plan.setPlanStatusCode(Status.PLAN_0);
        plan.setOperator(so.getOperator());
        plan.setDepartmentCode(byOperator.getDepartmentCode());
        planMapperX.addPlan(plan);
    }

    @Override
    public void updatePlan(String planStatusCode,Integer planId) {
        planMapperX.updatePlan(planStatusCode,planId);
    }

    @Override
    public void deletePlan(Integer planId) {
        planMapperX.deletePlan(planId);
    }

    @Override
    public PageInfo<Plan> findAllPlan(String departmentCode,
                                      String operator,
                                      String planStatusCode,
                                      String typeCode,
                                      Integer pageIndex,
                                      Integer limit) {
        PageHelper.startPage(pageIndex,limit);
        return new PageInfo<>(planMapperX.findAllPlan(departmentCode,operator,planStatusCode,typeCode));
    }

    @Override
    public void updateTime(Date planTime, Integer planId) {
        planMapperX.updateTime(planTime,planId);
    }

    @Override
    public Plan findById(Integer planId) {
        return planMapperX.findById(planId);
    }

    @Override
    public void updateDelayDays(int delayDays, Integer planId) {
        System.out.println("delayDaysdelayDaysdelayDaysdelayDaysdelayDaysdelayDaysv:    "+delayDays);
        planMapperX.updateDays(delayDays,0,planId);
    }

    @Override
    public void updateOvertimeDays(int overtimeDays, Integer planId) {
        planMapperX.updateDays(0,overtimeDays,planId);
    }
}
