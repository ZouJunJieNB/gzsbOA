package com.gzsb.root.gzsbroot.controller.email;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Emal;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.email.EmailService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.Status;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


/**
 * @author zouJunJie
 * @create 2019-10-31 20:15
 */
@RestController
@RequestMapping("/email")
public class EmailController extends AbstractController {

    @Autowired
    private EmailService emailService;

    @Autowired
    private TypeService typeService;


    /**
     * 发送邮件
     * 前端传入时间,是否定时发送,否：获取当前系统时间传入
     *
     * @param emal
     * @return
     */
    @PostMapping("/addEmail")
    public Message addEmail(@RequestBody Emal emal) {
        // 如果为空 就设置当前时间
        if (emal.getSendTime() == null) {
            System.out.println("为空为空为空");
            emal.setSendTime(new Date());
        }
        emailService.addEmail(emal);
        return Message.success();
    }

    /**
     * 查询当前登陆用户的收件
     *
     * @return
     */
    @PostMapping("/findEmail")
    public Message findEmail(@RequestParam Integer pageIndex, @RequestParam Integer limit) {
        return Message.success(emailService.findEmail(Status.EMAIL_1, pageIndex, limit));
    }

    /**
     * 查询当前登陆用户的发件
     *
     * @return
     */
    @PostMapping("/findSendEmail")
    public Message findSendEmail(@RequestParam Integer pageIndex, @RequestParam Integer limit) {
        return Message.success(emailService.findSendEmail(pageIndex, limit));
    }

    /**
     * 异步查询邮件类型
     *
     * @return
     */
    @GetMapping("/findEmailType")
    public Message findEmailType() {
        return Message.success(typeService.findByFatherCode(TypeFinal.EMAIL));
    }

    /**
     * 删除邮件
     * @param emailId
     * @return
     */
    @DeleteMapping("/deleteEmailById/{emailId}")
    public Message deleteEmailById(@PathVariable Integer emailId) {
        emailService.deleteEmail(emailId);
        return Message.success();
    }

    /**
     * 查看自己未读邮件数量
     * @return
     */
    @PostMapping("/findEmailCount")
    public Message findEmailCount(){
        return Message.success(emailService.findEmailCount(getSystemOperator().getOperator()));
    }

    /**
     * 更改邮件状态为已读
     * @param emailId
     * @return
     */
    @PostMapping("/updateStatusById")
    public Message updateStatusById(@RequestParam Integer emailId){
        emailService.updateStatusById(emailId);
        return Message.success();
    }

}
