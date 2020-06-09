package com.gzsb.root.gzsbroot.dao.mapperX;

import org.apache.ibatis.annotations.Param;

/**
 * @author zouJunJie
 * @create 2019-11-27 16:15
 */
public interface OperatorPositionMapperX {
    /**
     * 新增员工职位
     * @param positionId
     * @param operator
     */
    void addOperatorPosition(@Param("positionId")Integer positionId,@Param("operator")String operator);

    /**
     * 删除员工职位
     * @param operator
     */
    void deleteOperatorPosition(@Param("operator")String operator);

    /**
     * 更新员工职位
     * @param operator
     * @param positionId
     */
    void updateOperatorPosition(@Param("operator")String operator,@Param("positionId")Integer positionId);
}
