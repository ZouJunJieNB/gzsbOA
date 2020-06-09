package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Conference;
import com.gzsb.root.gzsbroot.dao.entity.ConferenceParticipant;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-24 15:50
 */
public interface ConferenceRecordMapperX {

    /**
     * 查询所有会议记录
     * @return
     */
    List<Conference> findAllConferenceRecord(@Param("theme") String theme,
                                             @Param("operator") String operator,
                                             @Param("status")String status);
    /**
     * 根据Id删除会议室记录
     * @param id
     */
    void deleteConferenceRecordFindById(@Param("id")Integer id);

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
    List<ConferenceParticipant> findConferenceParticipantByCid(@Param("cId") Integer cId);

    /**
     * 新增会议参与人
     * @param operator
     * @param cId
     */
    void addConferenceParticipant(@Param("operator")String operator,@Param("cId") Integer cId );

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
    List<Conference> findConferenceByStatus(@Param("status") Integer status);

    /**
     * 修改会议记录状态
     * @param status
     * @param cId
     */
    void updateConferenceStatus(@Param("status")Integer status,@Param("cId")Integer cId);

    /**
     * 根据时间查询不可用会议室
     * @param startTime
     * @param endTime
     * @return
     */
    List<Integer> findRoomUnavailable(@Param("startTime") Date startTime,@Param("endTime")Date endTime);
}
