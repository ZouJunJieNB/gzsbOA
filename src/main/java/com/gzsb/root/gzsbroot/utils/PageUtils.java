package com.gzsb.root.gzsbroot.utils;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/21 16:11
 * description:
 */
public class PageUtils {
    private Integer pageNum;
    private Integer pageSize;
    private Integer total;
    private Integer totalPage;
    private List<?> list;

    /**
     * 解析 PageHelper 对象，保留常用属性
     * @param pageInfo
     * @return
     */
    public static PageUtils page(PageInfo pageInfo){
        PageUtils page = new PageUtils();
        page.setPageNum(pageInfo.getPageNum());
        page.setPageSize(pageInfo.getPageSize());
        page.setTotal((int)pageInfo.getTotal());
        page.setTotalPage(pageInfo.getSize());
        page.setList(pageInfo.getList());
        pageInfo = null;
        return page;
    }


    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

}
