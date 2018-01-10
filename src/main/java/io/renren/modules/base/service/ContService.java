package io.renren.modules.base.service;

import io.renren.modules.base.entity.ContEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
public interface ContService {
	
	ContEntity queryObject(Long contId);
	
	List<ContEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContEntity cont);
	
	void update(ContEntity cont);
	
	void delete(Long contId);
	
	void deleteBatch(Long[] contIds);
}
