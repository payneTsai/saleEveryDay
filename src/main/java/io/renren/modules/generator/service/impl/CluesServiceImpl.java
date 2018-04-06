package io.renren.modules.generator.service.impl;

import io.renren.modules.generator.entity.CluesExtendsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.CluesDao;
import io.renren.modules.generator.entity.CluesEntity;
import io.renren.modules.generator.service.CluesService;



@Service("cluesService")
public class CluesServiceImpl implements CluesService {

	@Autowired
	private CluesDao cluesDao;
	
	@Override
	public CluesEntity queryObject(Integer id){
		return cluesDao.queryObject(id);
	}
	
	@Override
	public List<CluesEntity> queryList(Map<String, Object> map){
		return cluesDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return cluesDao.queryTotal(map);
	}
	
	@Override
	public void save(CluesEntity clues){
		cluesDao.save(clues);
	}
	
	@Override
	public void update(CluesEntity clues){
		cluesDao.update(clues);
	}
	
	@Override
	public void delete(Integer id){
		cluesDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		cluesDao.deleteBatch(ids);
	}

	@Override
	public List<CluesExtendsEntity> queryListByTypeId(Integer typeId){
		return cluesDao.queryListByTypeId(typeId);
	}

	@Override
	public List<CluesExtendsEntity> queryListById(Integer id) {
		return cluesDao.queryListById(id);
	}
}
