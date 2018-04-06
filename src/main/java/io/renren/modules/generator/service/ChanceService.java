package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.ChanceEntity;
import io.renren.modules.generator.entity.ChanceExtendsEntity;

import java.util.List;
import java.util.Map;

/**
 * 销售机会
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-05 16:07:07
 */
public interface ChanceService {
	
	ChanceEntity queryObject(Integer id);
	
	List<ChanceEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ChanceEntity chance);
	
	void update(ChanceEntity chance);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);

	List<ChanceExtendsEntity> selectByUserId(Integer userId);
	/**
	 * 根据机会id查询销售线索
	 * @param id
	 * @return
	 */
	Integer selectCluesId(Integer id);
}
