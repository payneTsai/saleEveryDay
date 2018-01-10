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
public class ChanceEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//销售机会id
	private Long chanceId;
	//员工id
	private Long empId;
	//客户id
	private Long customerId;
	//产品id
	private Long productId;
	//销售机会状态
	private String chanceStatus;
	//销售机会名称
	private String chanceName;
	//销售机会id
	private Date gmtCreate;
	//销售机会修改时间
	private Date gmtModified;

	/**
	 * 设置：销售机会id
	 */
	public void setChanceId(Long chanceId) {
		this.chanceId = chanceId;
	}
	/**
	 * 获取：销售机会id
	 */
	public Long getChanceId() {
		return chanceId;
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
	 * 设置：产品id
	 */
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	/**
	 * 获取：产品id
	 */
	public Long getProductId() {
		return productId;
	}
	/**
	 * 设置：销售机会状态
	 */
	public void setChanceStatus(String chanceStatus) {
		this.chanceStatus = chanceStatus;
	}
	/**
	 * 获取：销售机会状态
	 */
	public String getChanceStatus() {
		return chanceStatus;
	}
	/**
	 * 设置：销售机会名称
	 */
	public void setChanceName(String chanceName) {
		this.chanceName = chanceName;
	}
	/**
	 * 获取：销售机会名称
	 */
	public String getChanceName() {
		return chanceName;
	}
	/**
	 * 设置：销售机会id
	 */
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	/**
	 * 获取：销售机会id
	 */
	public Date getGmtCreate() {
		return gmtCreate;
	}
	/**
	 * 设置：销售机会修改时间
	 */
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	/**
	 * 获取：销售机会修改时间
	 */
	public Date getGmtModified() {
		return gmtModified;
	}
}
