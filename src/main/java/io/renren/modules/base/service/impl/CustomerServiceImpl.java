package io.renren.modules.base.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.base.dao.CustomerDao;
import io.renren.modules.base.entity.CustomerEntity;
import io.renren.modules.base.service.CustomerService;



@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public CustomerEntity queryObject(Long customerId){
		return customerDao.queryObject(customerId);
	}
	
	@Override
	public List<CustomerEntity> queryList(Map<String, Object> map){
		return customerDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return customerDao.queryTotal(map);
	}
	
	@Override
	public void save(CustomerEntity customer){
		customerDao.save(customer);
	}
	
	@Override
	public void update(CustomerEntity customer){
		customerDao.update(customer);
	}
	
	@Override
	public void delete(Long customerId){
		customerDao.delete(customerId);
	}
	
	@Override
	public void deleteBatch(Long[] customerIds){
		customerDao.deleteBatch(customerIds);
	}
	
}
