package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.CollyFarm;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper

public interface CollyFarmMapper extends KBMapper<String, CollyFarm> {

}
