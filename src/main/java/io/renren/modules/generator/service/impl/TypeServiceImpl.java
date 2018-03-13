package io.renren.modules.generator.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.TypeDao;
import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.generator.service.TypeService;



@Service("typeService")
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeDao typeDao;
	
	@Override
	public TypeEntity queryObject(Integer id){
		return typeDao.queryObject(id);
	}
	
	@Override
	public List<TypeEntity> queryList(Map<String, Object> map){
		return typeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return typeDao.queryTotal(map);
	}
	
	@Override
	public void save(TypeEntity type){
		typeDao.save(type);
	}
	
	@Override
	public void update(TypeEntity type){
		typeDao.update(type);
	}
	
	@Override
	public void delete(Integer id){
		typeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		typeDao.deleteBatch(ids);
	}

	@Override
	public List<TypeEntity> typeList(){
		return typeDao.typeList();
	}
	
}
