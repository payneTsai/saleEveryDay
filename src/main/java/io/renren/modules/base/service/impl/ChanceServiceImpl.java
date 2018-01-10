package io.renren.modules.base.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.base.dao.ChanceDao;
import io.renren.modules.base.entity.ChanceEntity;
import io.renren.modules.base.service.ChanceService;



@Service("chanceService")
public class ChanceServiceImpl implements ChanceService {
	@Autowired
	private ChanceDao chanceDao;
	
	@Override
	public ChanceEntity queryObject(Long chanceId){
		return chanceDao.queryObject(chanceId);
	}
	
	@Override
	public List<ChanceEntity> queryList(Map<String, Object> map){
		return chanceDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return chanceDao.queryTotal(map);
	}
	
	@Override
	public void save(ChanceEntity chance){
		chanceDao.save(chance);
	}
	
	@Override
	public void update(ChanceEntity chance){
		chanceDao.update(chance);
	}
	
	@Override
	public void delete(Long chanceId){
		chanceDao.delete(chanceId);
	}
	
	@Override
	public void deleteBatch(Long[] chanceIds){
		chanceDao.deleteBatch(chanceIds);
	}
	
}
