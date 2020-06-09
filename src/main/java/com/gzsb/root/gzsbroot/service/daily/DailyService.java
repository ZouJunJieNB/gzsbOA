package com.gzsb.root.gzsbroot.service.daily;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entityX.Daily;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/6 8:53
 * description:
 */
public interface DailyService {

    /**
     *  添加
     * @param daily
     * @return
     */
    int add(Daily daily);

    /**
     *  修改
     * @param daily
     * @return
     */
    int update(Daily daily);

    /**
     * 查询全部
     * @return
     */
    PageInfo<Daily> selectFindAll(Integer flag,Integer pageNum,Integer limt);

    /**
     *  详细查询
     * @return
     */
    Daily selectFindDaily(Integer id);

    /**
     * 根据操作员账号查询
     * @param Operator
     * @return
     */
    PageInfo<Daily> findUserDailyAll(Integer pageNum,Integer limit,String Operator);

    /**
     * 删除
     * @param id
     * @return
     */
    int deleteDaily(Integer id);
}
