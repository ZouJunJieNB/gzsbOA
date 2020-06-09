package com.gzsb.root.gzsbroot.controller.managementofmeetings;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Conference;
import com.gzsb.root.gzsbroot.dao.entity.ConferenceParticipant;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.managementofmeetings.ConferenceRecordService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.DateUtil;
import com.gzsb.root.gzsbroot.utils.PageUtils;
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
 * @create 2019-10-24 16:25
 */
@RestController
@RequestMapping("/conferenceRecord")
public class ConferenceRecordController extends AbstractController {

    @Autowired
    private ConferenceRecordService conferenceRecordService;

    @Autowired
    private TypeService typeService;

    /**
     * 查询所有会议记录或根据主题或创办人查询根据状态
     *
     * @param theme
     * @param operator
     * @return
     */
    @PostMapping("/findAll")
    public Message findAll(@RequestParam String theme,
                           @RequestParam String operator,
                           @RequestParam String status,
                           @RequestParam Integer pageIndex,
                           @RequestParam Integer limit) {

        return Message.success(PageUtils.page(conferenceRecordService.findAllConferenceRecord(theme, operator, status,pageIndex, limit)));
    }

    /**
     * 根据id删除会议记录
     *
     * @param cId
     * @return
     */
    @DeleteMapping("/delete/{cId}")
    public Message delete(@PathVariable Integer cId) {
        conferenceRecordService.deleteConferenceRecordFindById(cId);
        return Message.success();
    }

    /**
     * 新增会议记录
     *
     * @param conference
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Conference conference) {

        // 新增会议记录成功后conference里面新增当前插入主键cId
        conferenceRecordService.addConferenceRecord(conference);
        return Message.success();
    }

    /**
     * 根据会议记录Id查询会议参与人
     *
     * @param cId
     * @return
     */
    @GetMapping("/findParticipantBycId/{cId}")
    public Message findParticipantBycId(@PathVariable Integer cId, @RequestParam Integer pageIndex,
                                        @RequestParam Integer limit) {
        return Message.success(conferenceRecordService.findConferenceParticipantByCid(cId,pageIndex,limit));
    }

    /**
     * 新增会议参与人
     * @param operator
     * @param cId
     * @return
     */
    @PostMapping("/addConferenceParticipant")
    public Message addConferenceParticipant(@RequestParam String operator,@RequestParam Integer cId){
        conferenceRecordService.addConferenceParticipant(operator,cId);
        return Message.success();
    }

    /**
     * 更新会议参与人是否到场状态
     * @param conferenceParticipant
     * @return
     */
    @PutMapping("/updateConferenceParticipantStatus")
    public Message updateConferenceParticipantStatus(ConferenceParticipant conferenceParticipant){
        conferenceRecordService.updateConferenceParticipantStatus(conferenceParticipant);
        return Message.success();
    }

    /**
     * 查询不可用会议室 1已预订未开始,2正在进行中
     * @return
     */
    @GetMapping("/findConferenceByStatus")
    public Message findConferenceByStatus(){
        List<Conference> conferenceByStatus1 = conferenceRecordService.findConferenceByStatus(Status.STATUS_1);
        List<Conference> conferenceByStatus2 = conferenceRecordService.findConferenceByStatus(Status.STATUS_2);
        List<List<Conference>> list = new ArrayList<>();
        list.add(conferenceByStatus1);
        list.add(conferenceByStatus2);
        return Message.success(list);
    }

    /**
     * 异步查询会议记录类型
     * @return
     */
    @GetMapping("/findConferenceType")
    public Message findConferenceType(){
        return Message.success(typeService.findByFatherCode(TypeFinal.CONFERENCE));
    }

    /**
     * 查询所有会议室根据时间判断是否可用
     * @param startTime
     * @param endTime
     * @return
     */
    @GetMapping("/findRoomUnavailable")
    public Message findRoomUnavailable(@RequestParam String startTime,@RequestParam String endTime){
        return  Message.success(conferenceRecordService.findRoomUnavailable
                (DateUtil.stringToDate(startTime,"yyyy-MM-dd hh:mm"),
                DateUtil.stringToDate(endTime,"yyyy-MM-dd hh:mm")));
    }
}
