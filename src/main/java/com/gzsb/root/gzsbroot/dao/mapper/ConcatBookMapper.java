package com.gzsb.root.gzsbroot.dao.mapper;

import com.gzsb.root.gzsbroot.dao.entity.ConcatBook;
import com.gzsb.root.gzsbroot.dao.entity.ConcatBookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConcatBookMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    long countByExample(ConcatBookExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int deleteByExample(ConcatBookExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer concatId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int insert(ConcatBook record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int insertSelective(ConcatBook record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    List<ConcatBook> selectByExample(ConcatBookExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    ConcatBook selectByPrimaryKey(Integer concatId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") ConcatBook record, @Param("example") ConcatBookExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") ConcatBook record, @Param("example") ConcatBookExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(ConcatBook record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_concat_book
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(ConcatBook record);
}