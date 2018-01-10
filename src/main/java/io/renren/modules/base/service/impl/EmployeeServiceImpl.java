package io.renren.modules.base.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.base.dao.EmployeeDao;
import io.renren.modules.base.entity.EmployeeEntity;
import io.renren.modules.base.service.EmployeeService;



@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public EmployeeEntity queryObject(Long empId){
		return employeeDao.queryObject(empId);
	}
	
	@Override
	public List<EmployeeEntity> queryList(Map<String, Object> map){
		return employeeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return employeeDao.queryTotal(map);
	}
	
	@Override
	public void save(EmployeeEntity employee){
		employeeDao.save(employee);
	}
	
	@Override
	public void update(EmployeeEntity employee){
		employeeDao.update(employee);
	}
	
	@Override
	public void delete(Long empId){
		employeeDao.delete(empId);
	}
	
	@Override
	public void deleteBatch(Long[] empIds){
		employeeDao.deleteBatch(empIds);
	}
	
}
