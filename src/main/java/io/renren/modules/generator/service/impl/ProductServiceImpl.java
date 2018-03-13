package io.renren.modules.generator.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import io.renren.modules.generator.dao.ProductDao;
import io.renren.modules.generator.entity.ProductEntity;
import io.renren.modules.generator.service.ProductService;



@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	
	@Override
	public ProductEntity queryObject(Integer id){
		return productDao.queryObject(id);
	}
	
	@Override
	public List<ProductEntity> queryList(Map<String, Object> map){
		return productDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return productDao.queryTotal(map);
	}
	
	@Override
	public void save(ProductEntity product){
		productDao.save(product);
	}
	
	@Override
	public void update(ProductEntity product){
		productDao.update(product);
	}
	
	@Override
	public void delete(Integer id){
		productDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		productDao.deleteBatch(ids);
	}
	
}
