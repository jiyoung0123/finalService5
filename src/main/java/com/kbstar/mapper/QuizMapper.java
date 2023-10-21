package com.kbstar.mapper;

import com.kbstar.dto.Quiz;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper

public interface QuizMapper extends KBMapper<String, Quiz> {

}
