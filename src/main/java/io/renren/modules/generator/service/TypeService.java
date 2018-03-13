package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.TypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 销售类型
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:16
 */
public interface TypeService {
	
	TypeEntity queryObject(Integer id);
	
	List<TypeEntity> queryList(Map<String, Object> map);

	List<TypeEntity> typeList();
	
	int queryTotal(Map<String, Object> map);
	
	void save(TypeEntity type);
	
	void update(TypeEntity type);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
