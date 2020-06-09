package com.gzsb.root.gzsbroot.service.managementofmeetings.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Conference;
import com.gzsb.root.gzsbroot.dao.entity.ConferenceParticipant;
import com.gzsb.root.gzsbroot.dao.entity.MettingRoom;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.ConferenceRecordMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.dao.mapperX.MettingRoomMapperX;
import com.gzsb.root.gzsbroot.service.managementofmeetings.ConferenceRecordService;
import com.gzsb.root.gzsbroot.utils.Status;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-24 16:23
 */
@Service
public class ConferenceRecordServiceImpl implements ConferenceRecordService {


    @Autowired
    private ConferenceRecordMapperX conferenceRecordMapperX;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    @Autowired
    private MettingRoomMapperX mettingRoomMapperX;

    @Override
    public PageInfo<Conference> findAllConferenceRecord(String theme, String operator,String status, Integer pageIndex, Integer limit) {
        PageHelper.startPage(pageIndex, limit);
        return new PageInfo<>(conferenceRecordMapperX.findAllConferenceRecord(theme, operator,status));
    }

    @Override
    public void deleteConferenceRecordFindById(Integer id) {
        conferenceRecordMapperX.deleteConferenceRecordFindById(id);
    }

    @Override
    public void addConferenceRecord(Conference conference) {

        // 获取当前登录用户信息放入conference
        SystemOperator systemOperator = (SystemOperator) SecurityUtils.getSubject().getPrincipal();
        System.out.println("getOperator : "+systemOperator.getOperator());
        conference.setOperator(systemOperator.getOperator());

        conference.setStatus(Status.STATUS_1);

        // 获取当前登录用户的部门code插入会议记录
        OperatorPosition byOperator = departmentMapperX.findByOperator(systemOperator.getOperator());
        conference.setDepartmentCode(byOperator.getDepartmentCode());

        // 新增会议记录成功后conference里面新增当前插入主键cId
        conferenceRecordMapperX.addConferenceRecord(conference);
        System.out.println("返回cId:"+conference.getCId());

        // 把当前用户添加到会议参与人中
        conferenceRecordMapperX.addConferenceParticipant(systemOperator.getOperator(),conference.getCId());
        // 把会议参与人循环添加进数据库
        for(String realName : conference.getRealName()){
            // 如果会议参与人中有会议主持人就不添加此参与人
            if(!realName.equals(conference.getGzsOperator())){
                conferenceRecordMapperX.addConferenceParticipant(realName,conference.getCId());
            }

        }

    }

    @Override
    public PageInfo<ConferenceParticipant> findConferenceParticipantByCid(Integer cId, Integer pageIndex, Integer limit) {
        PageHelper.startPage(pageIndex, limit);
        return new PageInfo<>(conferenceRecordMapperX.findConferenceParticipantByCid(cId));
    }

    @Override
    public void addConferenceParticipant(String operator, Integer cId) {
        conferenceRecordMapperX.addConferenceParticipant(operator, cId);
    }

    @Override
    public void updateConferenceParticipantStatus(ConferenceParticipant conferenceParticipant) {
        conferenceRecordMapperX.updateConferenceParticipantStatus(conferenceParticipant);
    }

    @Override
    public List<Conference> findConferenceByStatus(Integer status) {
        return conferenceRecordMapperX.findConferenceByStatus(status);
    }

    @Override
    public void updateConferenceStatus(List<Integer> unStartToStarting, List<Integer> startingToEnd) {
        if (unStartToStarting != null) {
            for (Integer cId : unStartToStarting) {
                // 更改传过来的Id 更改状态为进行中
                conferenceRecordMapperX.updateConferenceStatus(Status.STATUS_2, cId);
            }
        }
        if (startingToEnd != null) {
            for (Integer cId : startingToEnd) {
                // 更改传过来的Id 更改状态为完成
                conferenceRecordMapperX.updateConferenceStatus(Status.STATUS_0, cId);
            }
        }
    }

    @Override
    public List<MettingRoom> findRoomUnavailable(Date startTime, Date endTime) {

        // 查询所有会议室
        List<MettingRoom> allMettingRoom = mettingRoomMapperX.findAllMettingRoom();

        List<Integer> roomIdList = conferenceRecordMapperX.findRoomUnavailable(startTime, endTime);
        System.out.println("roomList:   "+roomIdList);
        for(MettingRoom me: allMettingRoom){
            // 如果查出不可用会议室为空 则状态都为true
            if(roomIdList.size()==0){
                me.setStatus(true);
            }

            Iterator iter = roomIdList.iterator();
            while(iter.hasNext()){
                Integer next = (Integer) iter.next();
                if(me.getMmId().equals(next)){
                    me.setStatus(false);
                    break;
                }else{
                    me.setStatus(true);
                }
            }
        }
        System.out.println(allMettingRoom);
        return allMettingRoom;
    }

}
