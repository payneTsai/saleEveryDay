package io.renren.modules.base.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.base.entity.EmployeeEntity;
import io.renren.modules.base.service.EmployeeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.R;

/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
@RestController
@RequestMapping("employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("employee:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<EmployeeEntity> employeeList = employeeService.queryList(query);
		int total = employeeService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(employeeList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{empId}")
	@RequiresPermissions("employee:info")
	public R info(@PathVariable("empId") Long empId){
		EmployeeEntity employee = employeeService.queryObject(empId);
		
		return R.ok().put("employee", employee);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("employee:save")
	public R save(@RequestBody EmployeeEntity employee){
		employeeService.save(employee);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("employee:update")
	public R update(@RequestBody EmployeeEntity employee){
		employeeService.update(employee);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("employee:delete")
	public R delete(@RequestBody Long[] empIds){
		employeeService.deleteBatch(empIds);
		
		return R.ok();
	}
	
}
