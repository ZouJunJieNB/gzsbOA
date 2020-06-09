package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Attendance;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zouJunJie
 * @create 2019-11-03 21:03
 */
public interface AttendanceMapperX {

    /**
     * 查询所有
     * 查询当前部门考勤
     * 根据类型
     * 根据状态
     * 根据当前操作员
     * 根据时间
     * @param attendance
     * @return
     */
    List<Attendance> findAllByCondition(@Param("attendance") Attendance attendance,
                                        @Param("startTime") Date startTime,
                                        @Param("endTime") Date endTime);

    /**
     * 打卡签到
     * @param attendance
     */
    void addAttendance(Attendance attendance);

    /**
     * 查询当天自己的考勤
     * @param toDay
     * @param tomorrow
     * @return
     */
    Attendance findToday(@Param("toDay") String toDay,
                         @Param("tomorrow") String tomorrow,
                         @Param("operator") String operator,
                         @Param("typeCode") String typeCode);

    /**
     * 根据用户查询今天是否上班打卡
     * @param operator
     * @return
     */
    int findAbsenceByOperator(@Param("operator")String operator);
    /**
     * 根据用户查询今天是否下班打卡
     * @param operator
     * @return
     */
    int findAbsenceByOperatorOff(@Param("operator")String operator);


    /**
     * 首页的数据统计图
     * @return
     */
    List<Map<String,String>> selectHomeAll(Map<String, Object> params);

    /**
     * 首页的数据统计图
     * @return
     */
    List<Map<String,String>> selectHomeAlls(Map<String, Object> params);
}
