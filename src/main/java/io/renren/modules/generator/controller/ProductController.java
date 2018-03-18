package io.renren.modules.generator.controller;

import java.util.List;
import java.util.Map;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.entity.ProductEntity;
import io.renren.modules.generator.service.ProductService;



/**
 * 产品表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
@RestController
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("product:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProductEntity> productList = productService.queryList(query);
		int total = productService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 查询所有产品列表
	 */
	@RequestMapping("/productlist")
	public R list(){
		List<ProductEntity> productList = productService.queryProductList();
		return R.ok().put("productList", productList);
	}
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("product:info")
	public R info(@PathVariable("id") Integer id){
		ProductEntity product = productService.queryObject(id);
		
		return R.ok().put("product", product);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("product:save")
	public R save(@RequestBody ProductEntity product){
		productService.save(product);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("product:update")
	public R update(@RequestBody ProductEntity product){
		productService.update(product);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("product:delete")
	public R delete(@RequestBody Integer[] ids){
		productService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
