package io.renren.modules.generator.controller;

import java.util.List;
import java.util.Map;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.R;
import io.renren.modules.generator.entity.CluesExtendsEntity;
import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.generator.service.TypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.entity.CluesEntity;
import io.renren.modules.generator.service.CluesService;

/**
 * 市场线索表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:15
 */
@RestController
@RequestMapping("clues")
public class CluesController {
	@Autowired
	private CluesService cluesService;

	@Autowired
	private TypeService typeService;



	@RequestMapping("/list")
	@RequiresPermissions("clues:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<CluesExtendsEntity> cluesExtendsEntityList = cluesService.queryListByTypeId(Integer.parseInt((String) params.get("typeid")));
		int total = cluesService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(cluesExtendsEntityList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/typelist")
	public R list(){
		//查询列表数据

		List<TypeEntity> typeList = typeService.typeList();

		return R.ok().put("type", typeList);
	}


	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("clues:info")
	public R info(@PathVariable("id") Integer id){
		CluesEntity clues = cluesService.queryObject(id);
		
		return R.ok().put("clues", clues);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("clues:save")
	public R save(@RequestBody CluesEntity clues){
		cluesService.save(clues);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("clues:update")
	public R update(@RequestBody CluesEntity clues){
		cluesService.update(clues);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("clues:delete")
	public R delete(@RequestBody Integer[] ids){
		cluesService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
