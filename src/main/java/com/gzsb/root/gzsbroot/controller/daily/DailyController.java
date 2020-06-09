package com.gzsb.root.gzsbroot.controller.daily;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entityX.Daily;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.daily.DailyService;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import com.gzsb.root.gzsbroot.utils.PageUtils;
import com.gzsb.root.gzsbroot.utils.TypeFinal;
import com.gzsb.root.gzsbroot.utils.Verify;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/6 9:01
 * description:
 */
@RestController
@RequestMapping("/daily")
public class DailyController extends AbstractController {

    @Autowired
    private DailyService dailyService;

    @Autowired
    private TypeService typeService;

    int result = 0;

    /**
     * 查询所有日报
     * @param flag 判断是查询全部还是查询当前部门所有
     * @param pageIndex
     * @param limit
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Message selectFindAll(
            @RequestParam Integer flag,
            @RequestParam Integer pageIndex,
            @RequestParam Integer limit
            ) {
        return Message.success(PageUtils.page(dailyService.selectFindAll(flag,pageIndex, limit)));
    }

    /**
     * 添加日报
     * @param daily
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Daily daily) {
        daily.setDailySubmitTime(new Date());
        daily.setOperator(getSystemOperator().getOperator());
        result = dailyService.add(daily);
        return Verify.comeVerify(result);
    }

    /**
     * 修改日报
     * @param daily
     * @return
     */
    @PostMapping(value = "/update")
    public Message update(@RequestBody Daily daily) {
        result = dailyService.update(daily);
        return Verify.comeVerify(result);
    }

    /**
     * 根据id查询日报详细信息
     * @param id
     * @return
     */
    @GetMapping("/selectUser/{id}")
    public Message selectUser(@PathVariable Integer id) {
        return Message.success(dailyService.selectFindDaily(id));
    }

    /**
     * 异步查询日报类型
     * @return
     */
    @GetMapping("/findDailyType")
    public Message findEmailType(){
        return Message.success(typeService.findByFatherCode(TypeFinal.DAILY));
    }


    /**
     * 根据操作员账号查询日报
     * @param pageIndex
     * @param limit
     * @param operator
     * @return
     */
    @PostMapping("/findUserDailyAll")
    public Message findUserDailyAll(
            @RequestParam Integer pageIndex,
            @RequestParam Integer limit,
            @RequestParam String operator
    ){
    return Message.success(PageUtils.page(dailyService.findUserDailyAll(pageIndex,limit,operator)));
    }

    @DeleteMapping("/delete/{id}")
    public Message deleteDaily(@PathVariable Integer id){
        return Verify.comeVerify(dailyService.deleteDaily(id));
    }
}
