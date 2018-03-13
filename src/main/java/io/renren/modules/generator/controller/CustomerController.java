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

import io.renren.modules.generator.entity.CustomerEntity;
import io.renren.modules.generator.service.CustomerService;


/**
 * 客户表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
@RestController
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("customer:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<CustomerEntity> customerList = customerService.queryList(query);
		int total = customerService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(customerList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("customer:info")
	public R info(@PathVariable("id") Integer id){
		CustomerEntity customer = customerService.queryObject(id);
		
		return R.ok().put("customer", customer);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("customer:save")
	public R save(@RequestBody CustomerEntity customer){
		customerService.save(customer);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("customer:update")
	public R update(@RequestBody CustomerEntity customer){
		customerService.update(customer);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("customer:delete")
	public R delete(@RequestBody Integer[] ids){
		customerService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
