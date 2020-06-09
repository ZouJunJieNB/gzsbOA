package com.gzsb.root.gzsbroot.dao.mapperX;


import com.gzsb.root.gzsbroot.dao.entity.MettingRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MettingRoomMapperX {

    /**
     * 查询会议室列表
     * @return
     */
    List<MettingRoom> findAllMettingRoom();

    /**
     * 更新会议室
     * @param mettingRoom
     */
    void updateMettingRoom(MettingRoom mettingRoom);

    /**
     * 删除会议室
     * @param mmId
     */
    void deleteMettingRoom(@Param("mmId") Integer mmId);

    /**
     * 新增会议室
     * @param mettingRoom
     */
    void addMettingRoom(MettingRoom mettingRoom);

    /**
     * 查询会议室是否存在
     * @param mettingRoomName
     * @return
     */
    int findByRoomName(@Param("mettingRoomName")String mettingRoomName);




}