package io.renren.modules.base.service;

import io.renren.modules.base.entity.CustomerEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
public interface CustomerService {
	
	CustomerEntity queryObject(Long customerId);
	
	List<CustomerEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CustomerEntity customer);
	
	void update(CustomerEntity customer);
	
	void delete(Long customerId);
	
	void deleteBatch(Long[] customerIds);
}
