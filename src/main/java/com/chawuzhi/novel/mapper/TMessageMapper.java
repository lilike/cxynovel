package com.chawuzhi.novel.mapper;

import com.chawuzhi.novel.domain.TMessage;
import com.chawuzhi.novel.domain.TMessageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TMessageMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int countByExample(TMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int deleteByExample(TMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int deleteByPrimaryKey(Integer messageno);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int insert(TMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int insertSelective(TMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    List<TMessage> selectByExample(TMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    TMessage selectByPrimaryKey(Integer messageno);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int updateByExampleSelective(@Param("record") TMessage record, @Param("example") TMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int updateByExample(@Param("record") TMessage record, @Param("example") TMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int updateByPrimaryKeySelective(TMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_message
     *
     * @mbggenerated Mon Oct 16 17:40:37 GMT+08:00 2017
     */
    int updateByPrimaryKey(TMessage record);
}