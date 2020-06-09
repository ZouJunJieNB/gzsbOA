package com.gzsb.root.gzsbroot.controller.department;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Department;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.department.DepartmentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author zouJunJie
 * @create 2019-11-03 10:00
 */
@RestController
@RequestMapping("/department")
public class DepartmentController extends AbstractController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 查询所有
     * 根据部门名称模糊查询
     * 根据父级编码code查询
     * @param departmentName
     * @param fatherCode
     * @return
     */
    @PostMapping("/findAll")
    public Message findAll(@RequestParam String departmentName,
                           @RequestParam String fatherCode,
                           @RequestParam Integer pageIndex,
                           @RequestParam Integer limit){
        return  Message.success(departmentService.findAllDepartment(departmentName,fatherCode,pageIndex,limit));
    }

    /**
     * 添加部门
     * @param department
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Department department){
        departmentService.addDepartment(department);
        return Message.success();
    }

    /**
     * 根据部门编码查询部门信息
     * 异步根据部门编码查询部门是否存在
     * @param departmentCode
     * @return
     */
    @GetMapping("/findByDepartmentCode/{departmentCode}")
    public Message findByDepartmentCode(@PathVariable String departmentCode){
        return Message.success(departmentService.findDepartmentByCode(departmentCode));
    }

    /**
     * 更新部门信息
     * @param department
     * @return
     */
    @PutMapping("/update")
    public Message update(@RequestBody Department department){
        System.out.println(department);
        departmentService.updateDepartment(department);
        return Message.success();
    }

    /**
     * 根据部门编码查询该部门所有职位信息以及对应人员
     * @param departmentCode
     * @param pageIndex
     * @param limit
     * @return
     */
    @PostMapping("/findOperatorPosition")
    public Message findOperatorPosition(@RequestParam String departmentCode,
                                        @RequestParam Integer pageIndex,
                                        @RequestParam Integer limit){
        return Message.success(departmentService.findOperatorPositionByDepartmentCode(departmentCode,pageIndex,limit));
    }

    /**
     * 根据操作员查询用户职位和所属部门名称
     * @param operator
     * @return
     */
    @GetMapping("/findOperatorPositionByOperator/{operator}")
    public Message  findOperatorPositionByOperator(@PathVariable String operator){
        return Message.success(departmentService.findByOperator(operator));
    }


}
