package com.gzsb.root.gzsbroot.service.type;

import com.gzsb.root.gzsbroot.dao.entity.Type;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 12:13
 */
public interface TypeService {
    /**
     * 根据父类查询类型集合
     * @param fatherCode
     * @return
     */
    public List<Type> findByFatherCode(String fatherCode);
}
