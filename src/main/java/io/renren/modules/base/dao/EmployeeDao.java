package io.renren.modules.base.dao;

import io.renren.modules.base.entity.EmployeeEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
@Mapper
public interface EmployeeDao extends BaseDao<EmployeeEntity> {
	
}