package io.renren.modules.base.service;

import io.renren.modules.base.entity.ProductEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-09 19:56:42
 */
public interface ProductService {
	
	ProductEntity queryObject(Long productId);
	
	List<ProductEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductEntity product);
	
	void update(ProductEntity product);
	
	void delete(Long productId);
	
	void deleteBatch(Long[] productIds);
}
