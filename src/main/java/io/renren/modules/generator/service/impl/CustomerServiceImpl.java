package io.renren.modules.generator.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.CustomerDao;
import io.renren.modules.generator.entity.CustomerEntity;
import io.renren.modules.generator.service.CustomerService;



@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public CustomerEntity queryObject(Integer id){
		return customerDao.queryObject(id);
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
	public void delete(Integer id){
		customerDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		customerDao.deleteBatch(ids);
	}
	
}
