package com.gzsb.root.gzsbroot.service.managementofmeetings;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Conference;
import com.gzsb.root.gzsbroot.dao.entity.ConferenceParticipant;
import com.gzsb.root.gzsbroot.dao.entity.MettingRoom;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-24 16:23
 */
public interface ConferenceRecordService {
    /**
     * 查询所有会议记录
     * @return
     */
    PageInfo<Conference> findAllConferenceRecord(String theme, String operator,String status, Integer pageIndex,Integer limit);

    /**
     * 根据Id删除会议室记录
     * @param id
     */
    void deleteConferenceRecordFindById(Integer id);

    /**
     * 新增会议室记录
     * @param conference
     */
    void addConferenceRecord(Conference conference);

    /**
     * 根据会议室记录Id查询会议参与人
     * @param cId
     * @return
     */
    PageInfo<ConferenceParticipant> findConferenceParticipantByCid(Integer cId, Integer pageIndex, Integer limit);
    /**
     * 新增会议参与人
     * @param operator
     * @param cId
     */
    void addConferenceParticipant(String operator,Integer cId );

    /**
     * 更新会议参与人是否到场状态
     * @param conferenceParticipant
     */
    void updateConferenceParticipantStatus(ConferenceParticipant conferenceParticipant);

    /**
     * 根据状态查询会议室记录
     * @param status
     * @return
     */
    List<Conference> findConferenceByStatus(Integer status);

    /**
     * 修改会议记录状态
     * @param unStartToStarting
     * @param startingToEnd
     */
    void updateConferenceStatus(List<Integer> unStartToStarting,List<Integer> startingToEnd);

    /**
     * 根据时间查询不可用会议室
     * @param startTime
     * @param endTime
     * @return
     */
    List<MettingRoom> findRoomUnavailable(Date startTime, Date endTime);
}
