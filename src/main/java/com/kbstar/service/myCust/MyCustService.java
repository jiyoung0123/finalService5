package com.kbstar.service.myCust;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kbstar.dto.MyCust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MyCustMapper;

import java.util.List;


@Service
@Slf4j
public class MyCustService implements KBService<Integer, MyCust>  {

    @Autowired
    MyCustMapper mapper;

	@Override
	public void register(MyCust mycust) throws Exception {
		mapper.insert(mycust);
		
	}

	@Override
	public void remove(Integer custId) throws Exception {
		mapper.delete(custId);
		
	}

	@Override
	public void modify(MyCust mycust) throws Exception {
		mapper.update(mycust);
		
	}

	@Override
	public MyCust get(Integer custId) throws Exception {
		return mapper.select(custId);
	}

	@Override
	public List<MyCust> get() throws Exception {
		 return mapper.selectall();
	}

	

   
}