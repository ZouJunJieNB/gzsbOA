package com.gzsb.root.gzsbroot.service.managementofmeetings.impl;

import com.gzsb.root.gzsbroot.dao.entity.MettingRoom;
import com.gzsb.root.gzsbroot.dao.mapperX.MettingRoomMapperX;
import com.gzsb.root.gzsbroot.service.managementofmeetings.MettingRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-24 14:27
 */
@Service
public class MettingRoomServiceImpl implements MettingRoomService {

    @Autowired
    private MettingRoomMapperX mettingRoomMapperX;

    @Override
    public List<MettingRoom> findAllMettingRoom() {
        return mettingRoomMapperX.findAllMettingRoom();
    }

    @Override
    public void updateMettingRoom(MettingRoom mettingRoom) {
        mettingRoomMapperX.updateMettingRoom(mettingRoom);
    }

    @Override
    public void deleteMettingRoom(Integer mmId) {
        mettingRoomMapperX.deleteMettingRoom(mmId);
    }

    @Override
    public void addMettingRoom(MettingRoom mettingRoom){
        mettingRoomMapperX.addMettingRoom(mettingRoom);
    }

    @Override
    public int findByRoomName(String mettingRoomName) {
        return mettingRoomMapperX.findByRoomName(mettingRoomName);
    }
}
