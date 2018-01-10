package io.renren.modules.base.service;

import io.renren.modules.base.entity.ChanceEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
public interface ChanceService {
	
	ChanceEntity queryObject(Long chanceId);
	
	List<ChanceEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ChanceEntity chance);
	
	void update(ChanceEntity chance);
	
	void delete(Long chanceId);
	
	void deleteBatch(Long[] chanceIds);
}
