package com.gzsb.root.gzsbroot.dao.mapperX;

import com.gzsb.root.gzsbroot.dao.entity.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 11:18
 */
public interface TypeMapperX {

    /**
     * 根据父类查询类型集合
     * @param fatherCode
     * @return
     */
    public List<Type> findByFatherCode(@Param("fatherCode") String fatherCode);

}
