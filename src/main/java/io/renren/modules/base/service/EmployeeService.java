package io.renren.modules.base.service;

import io.renren.modules.base.entity.EmployeeEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
public interface EmployeeService {
	
	EmployeeEntity queryObject(Long empId);
	
	List<EmployeeEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(EmployeeEntity employee);
	
	void update(EmployeeEntity employee);
	
	void delete(Long empId);
	
	void deleteBatch(Long[] empIds);
}
