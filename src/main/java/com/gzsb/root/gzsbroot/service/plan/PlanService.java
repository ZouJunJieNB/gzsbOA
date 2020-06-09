package com.gzsb.root.gzsbroot.service.plan;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Plan;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 14:58
 */
public interface PlanService {

    /**
     * 新增计划
     * @param plan
     */
    void addPlan(Plan plan);

    /**
     * 更新计划状态
     * @param planStatusCode
     */
    void updatePlan(String planStatusCode,Integer planId);

    /**
     * 删除计划
     * @param planId
     */
    void deletePlan(Integer planId);

    /**
     * 查询计划
     * 根据部门编码
     * 根据操作员账号
     * 根据状态
     * 根据类型
     * @param departmentCode
     * @param operator
     * @param planStatusCode
     * @param typeCode
     * @return
     */
    PageInfo<Plan> findAllPlan(String departmentCode,
                               String operator,
                               String planStatusCode,
                               String typeCode,
                               Integer pageIndex,
                               Integer limit);
    /**
     * 更改计划时间
     * @param planTime
     * @param planId
     */
    void updateTime(Date planTime,Integer planId);

    /**
     * 根据planId查询计划
     * @param planId
     * @return
     */
    Plan findById(Integer planId);


    /**
     * 更新延期天数
     * @param delayDays
     */
    void updateDelayDays(int delayDays,
                    Integer planId);

    /**
     * 更新超时天数
     * @param overtimeDays
     */
    void updateOvertimeDays(int overtimeDays,
                    Integer planId);
}
