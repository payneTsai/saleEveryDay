package io.renren.modules.generator.controller;

import java.util.List;
import io.renren.common.utils.R;
import io.renren.modules.generator.entity.ContractExtendsEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.entity.ContractEntity;
import io.renren.modules.generator.service.ContractService;


/**
 * 合同管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-06 17:06:43
 */
@RestController
@RequestMapping("contract")
public class ContractController {
	@Autowired
	private ContractService contractService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Integer userId){
		List<ContractExtendsEntity> contractExtendsEntityList= contractService.selectContractByUserId(userId);
		return R.ok().put("contracts",contractExtendsEntityList);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("contract:info")
	public R info(@PathVariable("id") Integer id){
		ContractEntity contract = contractService.queryObject(id);
		
		return R.ok().put("contract", contract);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("contract:save")
	public R save(@RequestBody ContractEntity contract){
		contractService.save(contract);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("contract:update")
	public R update(@RequestBody ContractEntity contract){
		contractService.update(contract);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("contract:delete")
	public R delete(@RequestBody Integer[] ids){
		contractService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
