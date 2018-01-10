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

import io.renren.modules.base.entity.ContEntity;
import io.renren.modules.base.service.ContService;
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
@RequestMapping("cont")
public class ContController {
	@Autowired
	private ContService contService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("cont:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ContEntity> contList = contService.queryList(query);
		int total = contService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(contList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{contId}")
	@RequiresPermissions("cont:info")
	public R info(@PathVariable("contId") Long contId){
		ContEntity cont = contService.queryObject(contId);
		
		return R.ok().put("cont", cont);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("cont:save")
	public R save(@RequestBody ContEntity cont){
		contService.save(cont);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("cont:update")
	public R update(@RequestBody ContEntity cont){
		contService.update(cont);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("cont:delete")
	public R delete(@RequestBody Long[] contIds){
		contService.deleteBatch(contIds);
		
		return R.ok();
	}
	
}
