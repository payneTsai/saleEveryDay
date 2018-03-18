package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.ProductEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 产品表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
@Mapper
public interface ProductDao extends BaseDao<ProductEntity> {
	List<ProductEntity> queryProductList();
}
