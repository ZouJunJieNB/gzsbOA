package com.gzsb.root.gzsbroot.service.daily.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.OperatorPosition;
import com.gzsb.root.gzsbroot.dao.entityX.Daily;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.dao.mapperX.DailyMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.DepartmentMapperX;
import com.gzsb.root.gzsbroot.service.daily.DailyService;
import com.gzsb.root.gzsbroot.utils.Verify;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/6 8:55
 * description:
 */
@Service
public class DailySerciceImpl implements DailyService {

    @Autowired
    private DailyMapper dailyMapper;

    @Autowired
    private DepartmentMapperX departmentMapperX;

    @Override
    public int add(Daily daily) {
        return dailyMapper.add(daily);
    }

    @Override
    public int update(Daily daily) {
        return dailyMapper.update(daily);
    }

    @Override
    public PageInfo<Daily> selectFindAll(Integer flag,Integer pageNum, Integer limt) {
        String departmentCode = null;
        // 如果为1则根据当前部门查询 否则查询所有
        if(flag == 1){
            SystemOperator so =  (SystemOperator) SecurityUtils.getSubject().getPrincipal();
            OperatorPosition byOperator = departmentMapperX.findByOperator(so.getOperator());
            departmentCode = byOperator.getDepartmentCode();
        }
        PageHelper.startPage(pageNum,limt);

        return new PageInfo<Daily>(dailyMapper.selectFindAll(departmentCode));
    }


    @Override
    public Daily selectFindDaily(Integer id) {
        return dailyMapper.selectFindDaily(id);
    }

    @Override
    public PageInfo<Daily> findUserDailyAll(Integer pageNum,Integer limit,String operator) {
        PageHelper.startPage(pageNum,limit);
        return new PageInfo<Daily>(dailyMapper.selectUserDaily(operator));
    }

    @Override
    public int deleteDaily(Integer id) {
        return dailyMapper.deleteDaily(id);
    }
}
