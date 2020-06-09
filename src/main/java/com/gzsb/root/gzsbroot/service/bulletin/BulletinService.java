package com.gzsb.root.gzsbroot.service.bulletin;

import com.github.pagehelper.PageInfo;
import com.gzsb.root.gzsbroot.dao.entity.Bulletin;

/**
 * @author zouJunJie
 * @create 2019-10-31 9:43
 */
public interface BulletinService {

    /**
     * 查询公告或根据需求查询
     * @param planStatusCode
     * @param departmentCode
     * @param typeCode
     * @return
     */
    PageInfo<Bulletin> findAllBulletin(String planStatusCode,
                                       String departmentCode,
                                       String typeCode,
                                       Integer pageIndex,
                                       Integer limit);

    /**
     * 添加公告ssss
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
    void deleteBylletin(Integer bulletinId);
}
