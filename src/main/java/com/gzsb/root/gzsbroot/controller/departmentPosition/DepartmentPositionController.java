package com.gzsb.root.gzsbroot.controller.departmentPosition;

import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.departmentPosition.DepartmentPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author zouJunJie
 * @create 2019-11-27 15:06
 */
@RestController
@RequestMapping("/departmentPosition")
public class DepartmentPositionController {

    @Autowired
    private DepartmentPositionService departmentPositionService;

    /**
     * 根据部门编码查询当前部门所有职位信息
     * @param departmentCode
     * @return
     */
    @GetMapping("/findBydepartmentCode/{departmentCode}")
    public Message findBydepartmentCode(@PathVariable String departmentCode){
        return Message.success(departmentPositionService.findByDepartmentCode(departmentCode));
    }
    /**
     * 新增部门职位
     * @param departmentCode
     * @param positionName
     * @return
     */
    @PostMapping("/addDepartmentPosition")
    public Message addDepartmentPosition(@RequestParam String departmentCode,
                                         @RequestParam String positionName){
        departmentPositionService.addDepartmentPosition(departmentCode,positionName);
        return  Message.success();
    }


}
