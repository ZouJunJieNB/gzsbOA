package com.gzsb.root.gzsbroot.utils;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 物理分页工具类，先查出所有数据再将List进行分页
 * @author zouJunJie
 * @create 2020-01-21 19:54
 */
@Data
public class ListPageUtils {

    private int row; //行数
    private int page; //页数
    private int total; //总记录数

    /**
     * get、set 使用lombok
     */


    /**
     * 对list集合进行分页处理
     *
     * @return
     */

    public List listSplit(List list) {
        List newList = null;
        total = list.size();
        newList = list.subList(row * (page - 1), ((row * page) > total ? total : (row * page)));
        return newList;
    }

}
