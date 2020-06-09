package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Bulletin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-10-31 9:26
 */
public interface BulletinMapperX {

    /**
     * 查询公告或根据需求查询
     * @param planStatusCode
     * @param departmentCode
     * @param typeCode
     * @return
     */
    List<Bulletin> findAllBulletin(@Param("planStatusCode") String planStatusCode,
                                   @Param("departmentCode") String departmentCode,
                                   @Param("typeCode") String typeCode);

    /**
     * 添加公告
     * @param bulletin
     */
    void addBulletin(Bulletin bulletin);

    /**
     * 修改公告
     * @param bulletin
     */
    void updateBulletin(Bulletin bulletin);

    /**
     * 删除公告
     * @param bulletinId
     */
    void deleteBylletin(@Param("bulletinId")Integer bulletinId);



}
