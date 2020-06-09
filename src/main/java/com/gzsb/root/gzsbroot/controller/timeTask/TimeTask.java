package com.gzsb.root.gzsbroot.controller.timeTask;

import com.gzsb.root.gzsbroot.dao.entity.*;
import com.gzsb.root.gzsbroot.dao.entityX.LeaveInfo;
import com.gzsb.root.gzsbroot.dao.mapperX.ConferenceRecordMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.EmailMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.PlanMapperX;
import com.gzsb.root.gzsbroot.service.activiti.LeaveInfoService;
import com.gzsb.root.gzsbroot.service.attendance.AttendanceService;
import com.gzsb.root.gzsbroot.service.email.EmailService;
import com.gzsb.root.gzsbroot.service.managementofmeetings.ConferenceRecordService;
import com.gzsb.root.gzsbroot.service.managementofmeetings.MettingRoomService;
import com.gzsb.root.gzsbroot.service.plan.PlanService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import com.gzsb.root.gzsbroot.utils.Status;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.xml.soap.SAAJResult;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zouJunJie
 * @create 2019-10-30 9:55
 */
@Component
public class TimeTask {

    @Autowired
    private ConferenceRecordService conferenceRecordService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private EmailMapperX emailMapperX;

    @Autowired
    private PlanMapperX planMapperX;

    @Autowired
    private PlanService planService;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private LeaveInfoService leaveInfoService;

    //编写具体的定时任务组件（@Component注解），并且在需要定时调度的方法上添加@Scheduled触发器
    //每隔5秒执行一次：*/5 * * * * ?
    //每隔1分钟执行一次：0 */1 * * * ?
    //每天23点执行一次：0 0 23 * * ?
    //每天凌晨1点执行一次：0 0 1 * * ?
    //每月1号凌晨1点执行一次：0 0 1 1 * ?
    //每月最后一天23点执行一次：0 0 23 L * ?
    //每周星期天凌晨1点实行一次：0 0 1 ? * L
    //在26分、29分、33分执行一次：0 26,29,33 * * * ?
    //每天的0点、13点、18点、21点都执行一次：0 0 0,13,18,21 * * ?
    @Scheduled(cron = "0 */2 * * * ?")
    public void ssgx() throws ParseException {

        System.out.println("两分钟查询一次会议室");

        //查询会议室未开始状态
        List<Conference> conferenceByStatus1 = conferenceRecordService.findConferenceByStatus(Status.STATUS_1);
        List<Integer> unStartToStarting = new ArrayList();
        for (Conference conference : conferenceByStatus1) {
            Date startTime = conference.getStartTime();
            Date date = new Date();
            // 如果当前时间过了开始时间 就更改状态
            if (startTime.before(date)) {
                unStartToStarting.add(conference.getCId());
            }
        }

        //查询会议室进行中状态
        List<Conference> conferenceByStatus2 = conferenceRecordService.findConferenceByStatus(Status.STATUS_2);
        List<Integer> startingToEnd = new ArrayList();
        for (Conference conference : conferenceByStatus2) {
            Date endTime = conference.getEndTime();
            Date date = new Date();
            // 如果结束时间过了开始时间 就更改状态
            if (endTime.before(date)) {
                startingToEnd.add(conference.getCId());
            }
        }
        conferenceRecordService.updateConferenceStatus(unStartToStarting, startingToEnd);


        // 查询未完成的计划
        List<Plan> allPlan = planMapperX.findAllPlan(null, null, Status.PLAN_0, null);
        System.out.println("两分钟查询一次未完成的计划,如果当前时间超过完成时间则设置超时");
        // 两分钟查询一次未完成的计划,如果当前时间超过完成时间则设置超时
        for (Plan plan : allPlan){
            if(plan.getPlanTime().before(new Date())){
                System.out.println(plan);
                planMapperX.updatePlan(Status.PLAN_2,plan.getPlanId());
            }
        }

    }

    /**
     * 每分钟查询未发送邮件,如果发送时间在当前时间之前就发送
     * @throws ParseException
     */
    @Scheduled(cron = "0 */1 * * * ?")
    public void email() throws ParseException {
        System.out.println("一分钟查询一次 Email");
        // 查询所有未发送的邮件信息
        List<Emal> emailList = emailMapperX.findEmail(Status.EMAIL_0,null,null);
        for (Emal emal : emailList){
            // 如果发送时间在当前时间之前就更改状态
            if(emal.getSendTime().before(new Date())){
                emailService.updateStatus(Status.EMAIL_1,emal.getEmailId());
            }
        }

    }

    /**
     * 每天00点查询已超时任务并更新超时天数
     * @throws ParseException
     */
    @Scheduled(cron = "0 */5 * * * ?")
    public void planDays() throws ParseException {
        System.out.println("每天查询一次已超时任务---更改超时天数");
        // 查询未完成的计划
        List<Plan> allPlan = planMapperX.findAllPlan(null, null, Status.PLAN_2, null);
        System.out.println("每天查询一次已超时的任务");
        for (Plan plan : allPlan){
            // 查询任务完成时间与当前时间相隔天数,更新至数据库
            int day = DateUtil.daysBetween(plan.getPlanTime(), new Date(), "yyyy-MM-dd");
            System.out.println(plan.getOperator()+"超时："+day+"天");
            if(day==0){
                day =1;
            }
            planService.updateOvertimeDays(day,plan.getPlanId());
        }

    }

    /**
     * 每分钟查询部门是否下班 , 查询所有未打卡人员记上 是旷工还是请假
     * @throws ParseException
     */
    @Scheduled(cron = "0 */1 * * * ?")
    public void attendanceGo() throws ParseException {
        System.out.println("每隔一分钟查询未打上班卡是旷工 or 请假");
        // 查询所有部门
        List<Department> allDepartment = departmentMapperX.findAllDepartment(null, null);
        // 获取当前时间 HH:mm
        String s = DateUtil.dateStr(new Date(), "HH:mm");
        Date date = DateUtil.stringToDate(s, "HH:mm");
        for(Department department:allDepartment){
            // 如果部门下班时间在当前时间之前就查询出该部门所有人员
            if (department.getWorkTimePm().before(date)) {
                // 查询部门所有人员
                List<OperatorPosition> operatorPositions = departmentMapperX.findOperatorPositionByDepartmentCode(department.getDepartmentCode());
                for (OperatorPosition op: operatorPositions){
                    // 一个个查询是否上班打卡
                    int count = attendanceService.findAbsenceByOperator(op.getOperator());
                    if(count == 0){
                        // 如果上班未打卡 首先查询请假表 当前日期是否已请假
                        List<LeaveInfo> passByOperator = leaveInfoService.findPassByOperator(op.getOperator());
                        Boolean judge = true;
                        for(LeaveInfo leaveInfo:passByOperator){
                            // 如果当前日期已请假就返回false并退出循环
                            if(DateUtil.isEffectiveDate(new Date(),leaveInfo.getStartTime(),leaveInfo.getEndTime())){
                                System.out.println(op.getOperator()+"  请假了");
                                judge = false;
                            }
                        }
                        // 如果未上班打卡就记旷工
                        Attendance attendance = new Attendance();
                        if(judge){
                            attendance.setPlanStatusCode(Status.ATTENDANCE_3);
                        }else{
                            attendance. setPlanStatusCode(Status.ATTENDANCE_4);
                        }
                        attendance.setATime(new Date());
                        attendance.setOperator(op.getOperator());
                        attendance.setTypeCode(TypeFinal.GOWORK);
                        // 上班卡
                        attendanceService.addSystemAttendance(attendance);
                        // 下班卡
                        attendance.setTypeCode(TypeFinal.OFFWORK);
                        attendanceService.addSystemAttendance(attendance);
                    }
                }

            }
        }
//        查询完所有的上班是否打卡，再查询是否下班打卡
        attendanceOff();

    }

    /**
     * 每隔一分钟查询下班是否打卡
     * @throws ParseException
     */
    public void attendanceOff() throws ParseException {
        System.out.println("每隔一分钟查询下班是否打卡");
        // 查询所有部门
        List<Department> allDepartment = departmentMapperX.findAllDepartment(null, null);
        // 获取当前时间 HH:mm
        String s = DateUtil.dateStr(new Date(), "HH:mm");
        Date date = DateUtil.stringToDate(s, "HH:mm");
        for(Department department:allDepartment){
            // 如果部门下班时间(+1小时)在当前时间之前就查询出该部门所有人员
            String s1 = DateUtil.addDateMinut(department.getWorkTimePm(), 1, "HH:mm");
            Date pmDate = DateUtil.stringToDate(s1, "HH:mm");
            if (pmDate.before(date)) {
                // 查询部门所有人员
                List<OperatorPosition> operatorPositions = departmentMapperX.findOperatorPositionByDepartmentCode(department.getDepartmentCode());
                for (OperatorPosition op: operatorPositions){
                    // 一个个查询是否下班打卡
                    int count = attendanceService.findAbsenceByOperatorOff(op.getOperator());
                    if(count == 0){
                        // 如果未打下班卡标记未打下班卡状态
                        Attendance attendance = new Attendance();
                        attendance. setPlanStatusCode(Status.ATTENDANCE_5);
                        attendance.setTypeCode(TypeFinal.OFFWORK);
                        attendance.setATime(new Date());
                        attendance.setOperator(op.getOperator());
                        // 打下班卡
                        attendanceService.addSystemAttendance(attendance);
                    }
                }

            }
        }

    }
}
