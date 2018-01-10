package io.renren.modules.base.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.base.dao.ContDao;
import io.renren.modules.base.entity.ContEntity;
import io.renren.modules.base.service.ContService;



@Service("contService")
public class ContServiceImpl implements ContService {
	@Autowired
	private ContDao contDao;
	
	@Override
	public ContEntity queryObject(Long contId){
		return contDao.queryObject(contId);
	}
	
	@Override
	public List<ContEntity> queryList(Map<String, Object> map){
		return contDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return contDao.queryTotal(map);
	}
	
	@Override
	public void save(ContEntity cont){
		contDao.save(cont);
	}
	
	@Override
	public void update(ContEntity cont){
		contDao.update(cont);
	}
	
	@Override
	public void delete(Long contId){
		contDao.delete(contId);
	}
	
	@Override
	public void deleteBatch(Long[] contIds){
		contDao.deleteBatch(contIds);
	}
	
}
