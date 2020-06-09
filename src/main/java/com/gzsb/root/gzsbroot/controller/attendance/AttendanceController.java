package com.gzsb.root.gzsbroot.controller.attendance;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Attendance;
import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.attendance.AttendanceService;
import com.gzsb.root.gzsbroot.service.department.DepartmentService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.Status;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-04 10:51
 */
@RestController
@RequestMapping("/attendance")
public class AttendanceController extends AbstractController {

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private DepartmentService departmentMapperX;


    /**
     * 查询所有
     * 查询当前部门考勤
     * 根据类型
     * 根据状态
     *
     * @param attendance
     * @return
     */

    @PostMapping("/findAll")
    public Message findAll(@RequestBody Attendance attendance) {
        return Message.success(attendanceService.findAllByCondition(attendance));
    }

    /**
     * 查询当前操作员的考勤记录
     *
     * @return
     */
    @GetMapping("/findByOperator/{pageIndex}/{limit}")
    public Message findByOperator(@PathVariable Integer pageIndex, @PathVariable Integer limit) {

        // 查询当前登录用户信息
        SystemOperator so = getSystemOperator();
        Attendance attendance = new Attendance();
        attendance.setOperator(so.getOperator());
        attendance.setPageIndex(pageIndex);
        attendance.setLimit(limit);
        return Message.success(attendanceService.findAllByCondition(attendance));
    }

    /**
     * 打卡签到
     *
     * @param attendance
     * @return
     */
    @PostMapping("/addAttendance")
    public Message addAttendance(@RequestBody Attendance attendance) {
        int i = attendanceService.addAttendance(attendance);
        if (i == 0) {
            return Message.success(0);
        } else {
            return Message.success(1);
        }
    }

    /**
     * 异步查询签到类型
     *
     * @return
     */
    @GetMapping("/findAttendanceType")
    public Message findAttendanceType() {
        return Message.success(typeService.findByFatherCode(TypeFinal.ATTENDANCE));
    }

    /**
     * 查询当前是否签到
     *
     * @return
     */
    @GetMapping("/findToday")
    public Message findToday() {

        // 查询当前登录用户信息
        SystemOperator so = getSystemOperator();

        Attendance go = attendanceService.findToday(TypeFinal.GOWORK, so.getOperator());
        List list = new ArrayList<>();

        if (go != null) {
            // 查询当前部门上下班时间
            Department departmentByOperator = departmentMapperX.findDepartmentByOperator(so.getOperator());
            Date date = new Date();

            //上班判断
            if (departmentByOperator.getWorkTimeAm().getHours() < date.getHours()) {
                Attendance off = attendanceService.findToday(TypeFinal.OFFWORK, so.getOperator());
                if (off != null) {
                    list.add(TypeFinal.OFFWORK);
                    list.add("下班已签到");
                    return Message.success(list);
                } else {
                    list.add(TypeFinal.OFFWORK);
                    list.add("下班待签到");
                    return Message.success(list);
                }
                // 判断小时是否等于当前时间并且分钟小于当前时间
            } else if ((departmentByOperator.getWorkTimeAm().getHours() == date.getHours()) &&
                    (departmentByOperator.getWorkTimeAm().getMinutes() < date.getMinutes())) {

                Attendance off = attendanceService.findToday(TypeFinal.OFFWORK, so.getOperator());
                if (off != null) {
                    list.add(TypeFinal.OFFWORK);
                    list.add("下班已签到");
                    return Message.success(list);
                } else {
                    list.add(TypeFinal.OFFWORK);
                    list.add("下班待签到");
                    return Message.success(list);
                }
            } else {
                list.add(TypeFinal.GOWORK);
                list.add("上班已签到");
                return Message.success(list);
            }

        } else {
            list.add(TypeFinal.GOWORK);
            list.add("上班待签到");
            return Message.success(list);
        }

    }

    @PostMapping("/home")
    public Message findHomeAll(@RequestBody String operator) {
        System.out.println(operator + "ggogogogogogogogogoggogogogogogo");
        if (operator == "findAll" || operator.equals("findAll")) {
            System.out.println(1111111);
            return Message.success(attendanceService.selctHomeAlls());
        } else {
            System.out.println(222222);
            return Message.success(attendanceService.selctHomeAll(operator));
        }
    }

}
