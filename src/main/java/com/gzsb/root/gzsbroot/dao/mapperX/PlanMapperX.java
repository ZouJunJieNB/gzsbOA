package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Plan;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 14:18
 */
public interface PlanMapperX {

    /**
     * 新增计划
     * @param plan
     */
    void addPlan(Plan plan);

    /**
     * 更新计划状态
     * @param planStatusCode
     */
    void updatePlan(@Param("planStatusCode") String planStatusCode,@Param("planId") Integer planId);

    /**
     * 删除计划
     * @param planId
     */
    void deletePlan(@Param("planId") Integer planId);

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
    List<Plan> findAllPlan(@Param("departmentCode") String departmentCode,
                           @Param("operator") String operator,
                           @Param("planStatusCode") String planStatusCode,
                           @Param("typeCode") String typeCode);

    /**
     * 更改计划时间
     * @param planTime
     * @param planId
     */
    void updateTime(@Param("planTime")Date planTime,@Param("planId")Integer planId);

    /**
     * 根据planId查询计划
     * @param planId
     * @return
     */
    Plan findById(@Param("planId") Integer planId);

    /**
     * 更新延期天数或超时天数
     * @param delayDays
     * @param overtimeDays
     */
    void updateDays(@Param("delayDays")Integer delayDays,
                    @Param("overtimeDays")Integer overtimeDays,
                    @Param("planId")Integer planId);

}
