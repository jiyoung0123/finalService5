package com.kbstar.mapper;

import com.kbstar.dto.RandomChatRoom;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RandomChatMapper extends KBMapper<String, RandomChatRoom> {

}
