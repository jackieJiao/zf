package com.sinoway.sinowayCrawer.dao;

import com.sinoway.sinowayCrawer.entity.House_detail;

public interface House_detailMapper {
    int deleteByPrimaryKey(String hid);

    int insert(House_detail record);

    int insertSelective(House_detail record);

    House_detail selectByPrimaryKey(String hid);

    int updateByPrimaryKeySelective(House_detail record);

    int updateByPrimaryKey(House_detail record);
}