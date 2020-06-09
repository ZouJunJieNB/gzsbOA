package com.gzsb.root.gzsbroot.controller.managementofmeetings;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.MettingRoom;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.managementofmeetings.MettingRoomService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author zouJunJie
 * @create 2019-10-24 14:30
 */
@RestController
@RequestMapping("/mettingRoom")
public class MettingRoomController extends AbstractController {

    @Autowired
    private MettingRoomService mettingRoomService;

    /**
     * 查询所有会议室
     * @return
     */
    @GetMapping("/findAll")
    public Message findAll(){
        return Message.success(mettingRoomService.findAllMettingRoom());
    }

    /**
     * 添加会议室
     * @param mettingRoom
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody MettingRoom mettingRoom){
        mettingRoomService.addMettingRoom(mettingRoom);
        return Message.success();
    }

    /**
     * 更新会议室
     * @param mettingRoom
     * @return
     */
    @PutMapping("/update")
    public Message update(@RequestBody MettingRoom mettingRoom){
        mettingRoomService.updateMettingRoom(mettingRoom);
        return Message.success();
    }

    /**
     * 删除会议室
     * @param mmId
     * @return
     */
    @DeleteMapping("/delete/{mmId}")
    public Message delete(@PathVariable Integer mmId){
        mettingRoomService.deleteMettingRoom(mmId);
        return Message.success();
    }

    /**
     * 异步根据会议室名称查询会议室是否存在
     * @param mettingRoomName
     * @return
     */
    @PostMapping("/findByRoomName")
    public Message findByRoomName(@RequestParam String mettingRoomName){
        return Message.success(mettingRoomService.findByRoomName(mettingRoomName));
    }


}
