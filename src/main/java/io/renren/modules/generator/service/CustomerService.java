package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.CustomerEntity;

import java.util.List;
import java.util.Map;

/**
 * 客户表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
public interface CustomerService {
	
	CustomerEntity queryObject(Integer id);
	
	List<CustomerEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CustomerEntity customer);
	
	void update(CustomerEntity customer);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
