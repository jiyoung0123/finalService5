package com.kbstar.service;

import com.kbstar.dto.Quiz;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.QuizMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class QuizService implements KBService<String, Quiz> {

    @Autowired
    QuizMapper mapper;

    @Override
    public void register(Quiz quiz) throws Exception {
        mapper.insert(quiz);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }
    @Transactional
    @Override
    public void modify(Quiz quiz) throws Exception {
        mapper.update(quiz);
    }

    @Override
    public Quiz get(String s) throws Exception {
        return mapper.select(s);
    }

    //readOnly 속성은 옵션으로, 생략 가능합니다. 속성 값이 true일 경우에는 데이터를 변경하는 작업이 수행되지 않으며, false일 경우에는 읽기와 쓰기 모두 수행됩니다.

    @Override
    public List<Quiz> get() throws Exception {
        return mapper.selectall();
    }

}