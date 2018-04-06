package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.ContractEntity;
import io.renren.modules.generator.entity.ContractExtendsEntity;

import java.util.List;
import java.util.Map;

/**
 * 合同管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-06 17:06:43
 */
public interface ContractService {
	
	ContractEntity queryObject(Integer id);
	
	List<ContractEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContractEntity contract);
	
	void update(ContractEntity contract);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
	/**
	 * 根据用户id查询合同信息
	 * @param userId
	 * @return
	 */
	List<ContractExtendsEntity>  selectContractByUserId(Integer userId);
}
