package io.renren.modules.generator.service.impl;

import io.renren.modules.generator.entity.ChanceExtendsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.ChanceDao;
import io.renren.modules.generator.entity.ChanceEntity;
import io.renren.modules.generator.service.ChanceService;



@Service("chanceService")
public class ChanceServiceImpl implements ChanceService {
	@Autowired
	private ChanceDao chanceDao;
	
	@Override
	public ChanceEntity queryObject(Integer id){
		return chanceDao.queryObject(id);
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
	public void delete(Integer id){
		chanceDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		chanceDao.deleteBatch(ids);
	}

	@Override
	public List<ChanceExtendsEntity> selectByUserId(Integer userId) {
		return chanceDao.selectByUserId(userId) ;
	}

	@Override
	public Integer selectCluesId(Integer id) {
		return chanceDao.selectCluesId(id);
	}
}
