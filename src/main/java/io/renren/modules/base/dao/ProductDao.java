package io.renren.modules.base.dao;

import io.renren.modules.base.entity.ProductEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-09 19:56:42
 */
@Mapper
public interface ProductDao extends BaseDao<ProductEntity> {
	
}
