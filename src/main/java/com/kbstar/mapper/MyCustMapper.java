package com.kbstar.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kbstar.dto.MyCust;
import com.kbstar.frame.KBMapper;

@Repository
@Mapper
public interface MyCustMapper extends KBMapper<Integer, MyCust>{

}
