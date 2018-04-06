package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.CluesEntity;
import io.renren.modules.generator.entity.CluesExtendsEntity;

import java.util.List;
import java.util.Map;

/**
 * 市场线索表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:15
 */
public interface CluesService {
	
	CluesEntity queryObject(Integer id);
	
	List<CluesEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CluesEntity clues);
	
	void update(CluesEntity clues);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);

	List<CluesExtendsEntity> queryListByTypeId(Integer typeId);

	List<CluesExtendsEntity> queryListById(Integer id);

}
