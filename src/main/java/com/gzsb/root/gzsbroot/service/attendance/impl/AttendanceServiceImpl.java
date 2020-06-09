package com.gzsb.root.gzsbroot.service.attendance.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Attendance;
import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.AttendanceMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.service.attendance.AttendanceService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import com.gzsb.root.gzsbroot.utils.GsonUtil;
import com.gzsb.root.gzsbroot.utils.Status;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author zouJunJie
 * @create 2019-11-04 10:46
 */
@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    private AttendanceMapperX attendanceMapperX;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    static SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public PageInfo<Attendance> findAllByCondition(Attendance attendance) {
        PageHelper.startPage(attendance.getPageIndex(), attendance.getLimit());
        Date startTime = null;
        Date endTime = null;
        if (attendance.isSeven()) {
            String serven = DateUtil.getServen();
            startTime = DateUtil.stringToDate(serven, "yyyy-MM-dd");
            endTime = new Date();
        }
        if (attendance.isOneMonth()) {
            String oneMonth = DateUtil.getOneMonth();
            startTime = DateUtil.stringToDate(oneMonth, "yyyy-MM-dd");
            endTime = new Date();
        }

        return new PageInfo<>(attendanceMapperX.findAllByCondition(attendance, startTime, endTime));
    }

    @Override
    public int addAttendance(Attendance attendance) {

        int result = 0;

        // 查询当前登录用户信息
        SystemOperator so = (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        attendance.setOperator(so.getOperator());
        try {
            // 设置当前ip地址
            attendance.setIdAddress(InetAddress.getLocalHost().getHostAddress());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        // 获取自己部门的上下班时间
        Department departmentByOperator = departmentMapperX.findDepartmentByOperator(so.getOperator());
        System.out.println("departmentByOperator:" + departmentByOperator);
        Date date = new Date();
        attendance.setATime(date);
        //上班判断
        if (attendance.getTypeCode().equals(TypeFinal.GOWORK)) {
            Attendance today = this.findToday(TypeFinal.GOWORK, so.getOperator());
            System.out.println(today);
            if (today != null) {
                result = 1;
            } else {
                // 判断小时是否小于当前时间
                if (departmentByOperator.getWorkTimeAm().getHours() < date.getHours()) {
                    attendance.setPlanStatusCode(Status.ATTENDANCE_1);
                    // 判断小时是否等于当前时间
                } else if (departmentByOperator.getWorkTimeAm().getHours() == date.getHours()) {
                    // 判断分钟是否小于当前时间
                    if (departmentByOperator.getWorkTimeAm().getMinutes() < date.getMinutes()) {
                        attendance.setPlanStatusCode(Status.ATTENDANCE_1);
                    } else {
                        attendance.setPlanStatusCode(Status.ATTENDANCE_0);
                    }
                } else {
                    attendance.setPlanStatusCode(Status.ATTENDANCE_0);
                }
            }
        }

        //下班判断
        if (attendance.getTypeCode().equals(TypeFinal.OFFWORK)) {
            Attendance today = this.findToday(TypeFinal.OFFWORK, so.getOperator());
            System.out.println(today);
            if (today != null) {
                result = 1;
            } else {
                // 判断小时是否大于当前时间
                if (departmentByOperator.getWorkTimePm().getHours() > date.getHours()) {
                    attendance.setPlanStatusCode(Status.ATTENDANCE_2);
                    // 判断小时是否等于当前时间
                } else if (departmentByOperator.getWorkTimePm().getHours() == date.getHours()) {
                    // 判断分钟是否大于当前时间
                    if (departmentByOperator.getWorkTimePm().getMinutes() > date.getMinutes()) {
                        attendance.setPlanStatusCode(Status.ATTENDANCE_2);
                    } else {
                        attendance.setPlanStatusCode(Status.ATTENDANCE_0);
                    }
                } else {
                    attendance.setPlanStatusCode(Status.ATTENDANCE_0);
                }
            }
        }

        if (result == 0) {
            attendanceMapperX.addAttendance(attendance);
        }
        return result;
    }

    @Override
    public Attendance findToday(String typeCode, String operator) {
        //今天 00:00
        Date toDay = new Date();
        //明天 00:00
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 1);//这里改为1
        Date tomorrow = cal.getTime();
        System.out.println("typeCode:" + typeCode + "operator:" + operator);
        return attendanceMapperX.findToday(new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(toDay),
                new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(tomorrow), operator, typeCode);
    }

    @Override
    public int findAbsenceByOperator(String operator) {
        return attendanceMapperX.findAbsenceByOperator(operator);
    }

    @Override
    public void addSystemAttendance(Attendance attendance) {
        try {
            // 设置当前ip地址
            attendance.setIdAddress(InetAddress.getLocalHost().getHostAddress());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        attendanceMapperX.addAttendance(attendance);
    }

    @Override
    public int findAbsenceByOperatorOff(String operator) {
        return attendanceMapperX.findAbsenceByOperatorOff(operator);
    }

    @Override
    public List<Map<String, Integer>> selctHomeAll(String operator) {
        Map<String, Object> params = new HashMap<>();
        params.put("operator", operator);
        Date startTime = new Date();
        startTime.setHours(0);
        startTime.setMinutes(0);
        startTime.setSeconds(0);
        Date endTime = new Date();
        endTime.setHours(23);
        endTime.setMinutes(59);
        endTime.setSeconds(59);
        System.out.println(startTime);
        List<Map<String, Integer>> list = new ArrayList<>();
        int i = 0;
        while (i < 3) {
            Map<String, Integer> maps = new HashMap<>();
            params.put("startTime", DateUtil.getFirstDayByMonth(dft.format(startTime)));
            params.put("endTime", DateUtil.getLastDayByMonth(dft.format(endTime)));
            List<Map<String, String>> countList = attendanceMapperX.selectHomeAll(params);
            int row1 = 0;
            int row2 = 0;
            int row3 = 0;

            for (Map map : countList) {
                if (map.get("plan_status_code").equals(Status.ATTENDANCE_0)) {
                    row1++;
                } else if (map.get("plan_status_code").equals(Status.ATTENDANCE_4)) {
                    row2++;
                } else {
                    row3++;
                }
            }
            maps.put("normal", row1);
            maps.put("leave", row2);
            maps.put("abnormal", row3);
            maps.put("month", startTime.getMonth() + 1);
            list.add(maps);
            startTime.setMonth(startTime.getMonth() - 1);
            endTime.setMonth(endTime.getMonth() - 1);
            i++;
        }
        return list;
    }

    @Override
    public List<Map<String, Integer>> selctHomeAlls() {
        Map<String, Object> params = new HashMap<>();
        Date startTime = new Date();
        startTime.setHours(0);
        startTime.setMinutes(0);
        startTime.setSeconds(0);
        Date endTime = new Date();
        endTime.setHours(23);
        endTime.setMinutes(59);
        endTime.setSeconds(59);
        System.out.println(startTime);
        List<Map<String, Integer>> list = new ArrayList<>();
        int i = 0;
        while (i < 3) {
            Map<String, Integer> maps = new HashMap<>();
            params.put("startTime", DateUtil.getFirstDayByMonth(dft.format(startTime)));
            params.put("endTime", DateUtil.getLastDayByMonth(dft.format(endTime)));
            List<Map<String, String>> countList = attendanceMapperX.selectHomeAlls(params);
            int row1 = 0;
            int row2 = 0;
            int row3 = 0;

            for (Map map : countList) {
                if (map.get("plan_status_code").equals(Status.ATTENDANCE_0)) {
                    row1++;
                } else if (map.get("plan_status_code").equals(Status.ATTENDANCE_4)) {
                    row2++;
                } else {
                    row3++;
                }
            }
            maps.put("normal", row1);
            maps.put("leave", row2);
            maps.put("abnormal", row3);
            maps.put("month", startTime.getMonth() + 1);
            list.add(maps);
            startTime.setMonth(startTime.getMonth() - 1);
            endTime.setMonth(endTime.getMonth() - 1);
            i++;
        }
        return list;
    }

}
