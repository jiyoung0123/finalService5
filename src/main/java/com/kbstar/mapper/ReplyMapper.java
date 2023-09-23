package com.kbstar.mapper;

import com.kbstar.dto.Reply;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReplyMapper extends KBMapper<String, Reply> {
}
