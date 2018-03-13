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

import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.generator.service.TypeService;


/**
 * 销售类型
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:16
 */
@RestController
@RequestMapping("type")
public class TypeController {
	@Autowired
	private TypeService typeService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("type:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<TypeEntity> typeList = typeService.queryList(query);
		int total = typeService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(typeList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("type:info")
	public R info(@PathVariable("id") Integer id){
		TypeEntity type = typeService.queryObject(id);
		
		return R.ok().put("type", type);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("type:save")
	public R save(@RequestBody TypeEntity type){
		typeService.save(type);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("type:update")
	public R update(@RequestBody TypeEntity type){
		typeService.update(type);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("type:delete")
	public R delete(@RequestBody Integer[] ids){
		typeService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
