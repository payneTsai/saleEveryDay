package io.renren.modules.base.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-05 11:16:31
 */
public class ContEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//合同id
	private Long contId;
	//客户id
	private Long customerId;
	//员工id
	private Long empId;
	//合同名称
	private String contName;
	//合同主题
	private String theme;
	//
	private String contStatus;
	//销售金额
	private double transactionMoney;
	//合同创建时间
	private Date gmtCreate;
	//合同修改时间
	private Date gmtModified;

	/**
	 * 设置：合同id
	 */
	public void setContId(Long contId) {
		this.contId = contId;
	}
	/**
	 * 获取：合同id
	 */
	public Long getContId() {
		return contId;
	}
	/**
	 * 设置：客户id
	 */
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	/**
	 * 获取：客户id
	 */
	public Long getCustomerId() {
		return customerId;
	}
	/**
	 * 设置：员工id
	 */
	public void setEmpId(Long empId) {
		this.empId = empId;
	}
	/**
	 * 获取：员工id
	 */
	public Long getEmpId() {
		return empId;
	}
	/**
	 * 设置：合同名称
	 */
	public void setContName(String contName) {
		this.contName = contName;
	}
	/**
	 * 获取：合同名称
	 */
	public String getContName() {
		return contName;
	}
	/**
	 * 设置：合同主题
	 */
	public void setTheme(String theme) {
		this.theme = theme;
	}
	/**
	 * 获取：合同主题
	 */
	public String getTheme() {
		return theme;
	}
	/**
	 * 设置：
	 */
	public void setContStatus(String contStatus) {
		this.contStatus = contStatus;
	}
	/**
	 * 获取：
	 */
	public String getContStatus() {
		return contStatus;
	}
	/**
	 * 设置：销售金额
	 */
	public void setTransactionMoney(double transactionMoney) {
		this.transactionMoney = transactionMoney;
	}
	/**
	 * 获取：销售金额
	 */
	public double getTransactionMoney() {
		return transactionMoney;
	}
	/**
	 * 设置：合同创建时间
	 */
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	/**
	 * 获取：合同创建时间
	 */
	public Date getGmtCreate() {
		return gmtCreate;
	}
	/**
	 * 设置：合同修改时间
	 */
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	/**
	 * 获取：合同修改时间
	 */
	public Date getGmtModified() {
		return gmtModified;
	}
}
