package com.gzsb.root.gzsbroot.controller.bulletin;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Bulletin;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.bulletin.BulletinService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @author zouJunJie
 * @create 2019-10-31 9:47
 */
@RestController
@RequestMapping("/bulletin")
public class BulletinController extends AbstractController {

    @Autowired
    private BulletinService bulletinService;

    @Autowired
    private TypeService typeService;

    /**
     * 查询所有公告
     * 根据状态
     * 根据类型
     * @param planStatusCode
     * @param typeCode
     * @param pageIndex
     * @param limit
     * @return
     */
    @PostMapping("/findAll")
    public Message findAll(@RequestParam String planStatusCode,
                           @RequestParam String typeCode,
                           @RequestParam Integer pageIndex,
                           @RequestParam Integer limit){

        return Message.success(bulletinService.findAllBulletin(planStatusCode,null,typeCode,pageIndex,limit));
    }

    /**
     * 新增公告
     * @param bulletin
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Bulletin bulletin){
        bulletin.setOperator(getSystemOperator().getOperator());
        bulletin.setTime(new Date());
        bulletinService.addBulletin(bulletin);
        return Message.success();
    }

    /**
     * 更新公告
     * @param bulletin
     * @return
     */
    @PutMapping("/update")
    public Message update(@RequestBody Bulletin bulletin){
        bulletinService.updateBulletin(bulletin);
        return Message.success();
    }

    /**
     * 删除公告
     * @param bulletinId
     * @return
     */
    @DeleteMapping("/delete/{bulletinId}")
    public Message delete(@PathVariable Integer bulletinId){
        bulletinService.deleteBylletin(bulletinId);
        return Message.success();
    }

    /**
     * 异步查询公告类型
     * @return
     */
    @GetMapping("/findBulletinType")
    public Message findBulletinType(){
        return Message.success(typeService.findByFatherCode(TypeFinal.BULLETIN));
    }

}
