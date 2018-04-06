package io.renren.modules.generator.controller;

import java.util.List;

import io.renren.common.utils.R;
import io.renren.modules.generator.entity.*;
import io.renren.modules.generator.service.CluesService;
import io.renren.modules.generator.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.generator.service.ChanceService;

/**
 * 销售机会
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-05 16:07:07
 */
@RestController
@RequestMapping("/chance")
public class ChanceController {
	@Autowired
	private ChanceService chanceService;

	@Autowired
	private CluesService cluesService;

	@Autowired
	private ContractService contractService;
	/**
	 * 查询列表
	 */
	@RequestMapping("/list")
	public R getChanceList(@RequestParam Integer userId){
		List<ChanceExtendsEntity> chanceEntityList = chanceService.selectByUserId(userId);
		return R.ok().put("chances",chanceEntityList);
	}

	/**
	 * 转为失败
	 */
	@RequestMapping("/delete")
	public R delete(@RequestParam Integer id){
		Integer cluesId = chanceService.selectCluesId(id);
		CluesEntity cluesEntity = new CluesEntity();
		cluesEntity.setTypeId(3);
		cluesEntity.setId(cluesId);
		cluesService.update(cluesEntity);
		chanceService.delete(id);
		return R.ok();
	}

	@RequestMapping("success")
	public R success(@RequestParam Integer id,@RequestParam String contractName,@RequestParam Double money,@RequestParam Integer userId){
		Integer cluesId = chanceService.selectCluesId(id);
		CluesEntity cluesEntity = new CluesEntity();
		cluesEntity.setTypeId(4);
		cluesEntity.setId(cluesId);
		cluesService.update(cluesEntity);
		chanceService.delete(id);
		//新增合同记录
		CluesEntity cluesEntity1 = cluesService.queryObject(cluesId);
		ContractEntity contractEntity = new ContractEntity();
		contractEntity.setUserId(userId);
		contractEntity.setContractName(contractName);
		contractEntity.setCustomerId(cluesEntity1.getCustomerId());
		contractEntity.setMoney(money);
		contractService.save(contractEntity);
		return R.ok();
	}
}
