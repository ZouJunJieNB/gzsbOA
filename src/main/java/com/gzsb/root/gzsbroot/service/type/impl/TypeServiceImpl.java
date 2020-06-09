package com.gzsb.root.gzsbroot.service.type.impl;

import com.gzsb.root.gzsbroot.dao.entity.Type;
import com.gzsb.root.gzsbroot.dao.mapper.TypeMapper;
import com.gzsb.root.gzsbroot.dao.mapperX.TypeMapperX;
import com.gzsb.root.gzsbroot.service.type.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zouJunJie
 * @create 2019-11-01 12:14
 */
@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapperX typeMapperX;

    @Override
    public List<Type> findByFatherCode(String fatherCode) {
        return typeMapperX.findByFatherCode(fatherCode);
    }
}
