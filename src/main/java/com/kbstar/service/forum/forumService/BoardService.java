package com.kbstar.service.forum.forumService;

import com.kbstar.dto.BoardList;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.BoardListMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BoardService implements KBService<Integer, BoardList> {
    @Autowired
    BoardListMapper mapper;

    @Override
    public void register(BoardList boardList) throws Exception {
        mapper.insert(boardList);
    }

    @Override
    public void remove(Integer s) throws Exception {

    }

    @Override
    public void modify(BoardList boardList) throws Exception {

    }

    @Override
    public BoardList get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<BoardList> get() throws Exception {
        return mapper.selectall(); // 적절한 메서드를 호출하여 모든 게시물 목록을 반환하도록 수정
    }

}
