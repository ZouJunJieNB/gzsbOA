package com.gzsb.root.gzsbroot.service.attendance;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Attendance;
import com.gzsb.root.gzsbroot.dao.mapperX.AttendanceMapperX;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zouJunJie
 * @create 2019-11-04 10:46
 */
public interface AttendanceService {

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
    PageInfo<Attendance> findAllByCondition(Attendance attendance);

    /**
     * 打卡签到
     * @param attendance
     */
    int addAttendance(Attendance attendance);

    /**
     * 查询当天自己的考勤
     *
     * @param typeCode
     * @return
     */
    Attendance findToday(
                         String typeCode,String operator);

    /**
     * 根据用户查询今天是否上班打卡
     * @param operator
     * @return
     */
    int findAbsenceByOperator(String operator);

    /**
     * 如未打卡系统自动判断打卡
     * @param attendance
     */
    void addSystemAttendance(Attendance attendance);

    /**
     * 根据用户查询今天是否下班打卡
     * @param operator
     * @return
     */
    int findAbsenceByOperatorOff(String operator);

    /**
     * 考勤报表
     * @return
     */
    List<Map<String, Integer>> selctHomeAll(String oprator);

    /**
     * 考勤报表
     * @return
     */
    List<Map<String, Integer>> selctHomeAlls();
}
