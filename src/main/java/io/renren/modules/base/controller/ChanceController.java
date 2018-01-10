package io.renren.modules.base.controller;

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

import io.renren.modules.base.entity.ChanceEntity;
import io.renren.modules.base.service.ChanceService;


/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
@RestController
@RequestMapping("chance")
public class ChanceController {
	@Autowired
	private ChanceService chanceService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("chance:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ChanceEntity> chanceList = chanceService.queryList(query);
		int total = chanceService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(chanceList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{chanceId}")
	@RequiresPermissions("chance:info")
	public R info(@PathVariable("chanceId") Long chanceId){
		ChanceEntity chance = chanceService.queryObject(chanceId);
		
		return R.ok().put("chance", chance);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("chance:save")
	public R save(@RequestBody ChanceEntity chance){
		chanceService.save(chance);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("chance:update")
	public R update(@RequestBody ChanceEntity chance){
		chanceService.update(chance);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("chance:delete")
	public R delete(@RequestBody Long[] chanceIds){
		chanceService.deleteBatch(chanceIds);
		
		return R.ok();
	}
	
}
