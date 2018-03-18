package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.CustomerEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 客户表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
@Mapper
public interface CustomerDao extends BaseDao<CustomerEntity> {
    List<CustomerEntity> queryCustomerList();
	
}
