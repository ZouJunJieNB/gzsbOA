package com.gzsb.root.gzsbroot.controller.rabc;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Operator;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.rabc.OperatorRoleService;
import com.gzsb.root.gzsbroot.service.rabc.OperatorService;
import com.gzsb.root.gzsbroot.service.rabc.impl.OperatorRoleServiceImpl;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.PageUtils;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import com.gzsb.root.gzsbroot.utils.Verify;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/18 12:31
 * description:
 */
@RestController
@RequestMapping("/rabc/operator")
public class OperatorController extends AbstractController {

    @Autowired
    private OperatorService operatorService;

    /**
     * 查询所有
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public Message list(@RequestParam String departmentCode,
                        @RequestParam String realName,
                        @RequestParam String planStatusCode,@RequestParam Integer pageIndex,@RequestParam Integer limit){
        return Message.success(PageUtils.page(operatorService.selectOperatorFindAll(departmentCode,realName,planStatusCode,pageIndex, limit)));
    }

    @GetMapping("/findAll")
    public Message findAll() {
        return Message.success(operatorService.findAll());
    }

    /**
     * 修改密码
     * @param password
     * @param passwordTow
     * @return
     */
    @PutMapping("/updatePassword")
    public Message updatePassowrd(@RequestParam String password,
                                  @RequestParam String passwordTow){
        if(operatorService.updatePassword(password,passwordTow,getSystemOperator().getOperator()) == 1 ){
            return Message.success();
        }
        return Message.newMsg("ERROR","修改失败");
    }

    /**
     * 根据操作员账号查询用户信息
     * @param operator
     * @return
     */
    @GetMapping("/findOperatorByCode/{operator}")
    public Message findOperatorByCode(@PathVariable String operator){
        return Message.success(operatorService.findOperatorByCode(operator));
    }

    /**
     * 添加操作员
     * @param operator
     * @return
     */
    @PostMapping("/add")
    public Message addOperator(@RequestBody Operator operator){
        // 新增用户
        int result = operatorService.addOperator(operator);

        return Verify.comeVerify(result);
    }

    /**
     * 修改操作员
     * @param operator
     * @return
     */
    @PostMapping("/update")
    public Message updateOperator(@RequestBody Operator operator){
        int result = operatorService.updateOperator(operator);
        return Verify.comeVerify(result);
    }

    /**
     * 删除操作员
     * @param operator
     * @return
     */
    @GetMapping("/delete/{operator}")
    public Message deleteOperator(@PathVariable String operator){
        int result = operatorService.deleteOperator(operator);
        return Verify.comeVerify(result);
    }

    /**
     * 根据工号查询用户是否存在
     * @param jobNum
     * @return
     */
    @GetMapping("/findOperatorByJobNum/{jobNum}")
    public Message findOperatorByJobNum(@PathVariable String jobNum){
        return Message.success(operatorService.findOperatorByJobNum(jobNum));
    }
}

