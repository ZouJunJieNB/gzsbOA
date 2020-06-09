package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entityX.Daily;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/4 17:17
 * description:
 */
public interface DailyMapper {
    /**
     * 插入日报
     *
     * @param daily
     * @return
     */
    int add(Daily daily);

    /**
     * 修改日报
     *
     * @param daily
     * @return
     */
    int update(Daily daily);

    /**
     * 查询日报
     *
     * @return
     */
    List<Daily> selectFindAll(@Param("departmentCode")String departmentCode);

    /**
     * 根据id详细查询
     *
     * @param id
     * @return
     */
    Daily selectFindDaily(@Param("id")Integer id);

    /**
     *  根据Name查询
     * @param operator
     * @return
     */
    List<Daily> selectUserDaily(@Param("operator")String operator);

    /**
     * 根据id删除
     * @param id
     * @return
     */
    int deleteDaily(@Param("id")Integer id);
}
