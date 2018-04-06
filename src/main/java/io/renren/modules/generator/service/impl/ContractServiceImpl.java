package io.renren.modules.generator.service.impl;

import io.renren.modules.generator.entity.ContractExtendsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.ContractDao;
import io.renren.modules.generator.entity.ContractEntity;
import io.renren.modules.generator.service.ContractService;



@Service("contractService")
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao contractDao;
	
	@Override
	public ContractEntity queryObject(Integer id){
		return contractDao.queryObject(id);
	}
	
	@Override
	public List<ContractEntity> queryList(Map<String, Object> map){
		return contractDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return contractDao.queryTotal(map);
	}
	
	@Override
	public void save(ContractEntity contract){
		contractDao.save(contract);
	}
	
	@Override
	public void update(ContractEntity contract){
		contractDao.update(contract);
	}
	
	@Override
	public void delete(Integer id){
		contractDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		contractDao.deleteBatch(ids);
	}

	@Override
	public List<ContractExtendsEntity> selectContractByUserId(Integer userId) {
		return contractDao.selectContractByUserId(userId);
	}
}
