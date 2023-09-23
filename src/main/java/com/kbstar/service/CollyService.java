package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.CollyFarm;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CollyFarmMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class CollyService implements KBService<String, CollyFarm> {

    @Autowired
    CollyFarmMapper mapper;


    @Override
    public void register(CollyFarm colly) throws Exception {
        mapper.insert(colly);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }
    @Transactional
    @Override
    public void modify(CollyFarm colly) throws Exception {
        mapper.update(colly);
    }
    @Transactional(readOnly = true)
    @Override
    public CollyFarm get(String s) throws Exception {
        return mapper.select(s);
    }

    //readOnly 속성은 옵션으로, 생략 가능합니다. 속성 값이 true일 경우에는 데이터를 변경하는 작업이 수행되지 않으며, false일 경우에는 읽기와 쓰기 모두 수행됩니다.
    @Transactional(readOnly = true)
    @Override
    public List<CollyFarm> get() throws Exception {
        return mapper.selectall();
    }

}