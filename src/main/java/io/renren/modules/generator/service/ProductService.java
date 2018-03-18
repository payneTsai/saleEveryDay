package io.renren.modules.generator.service;

import io.renren.modules.generator.entity.ProductEntity;

import java.util.List;
import java.util.Map;

/**
 * 产品表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
public interface ProductService {
	
	ProductEntity queryObject(Integer id);
	
	List<ProductEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductEntity product);
	
	void update(ProductEntity product);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);

	List<ProductEntity> queryProductList();
}
