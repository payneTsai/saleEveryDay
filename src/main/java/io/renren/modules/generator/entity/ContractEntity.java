package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 合同管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-06 17:06:43
 */
public class ContractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//
	private Integer customerId;
	//
	private Integer userId;
	//
	private String contractName;

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	private Double money;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	/**
	 * 获取：
	 */
	public Integer getCustomerId() {
		return customerId;
	}
	/**
	 * 设置：
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	/**
	 * 获取：
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * 设置：
	 */
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	/**
	 * 获取：
	 */
	public String getContractName() {
		return contractName;
	}
}
