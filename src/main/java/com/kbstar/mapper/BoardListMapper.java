package com.kbstar.mapper;

import com.kbstar.dto.BoardList;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardListMapper extends KBMapper<Integer, BoardList> {
}
