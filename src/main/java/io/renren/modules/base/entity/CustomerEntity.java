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
public class CustomerEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//客户id
	private Long customerId;
	//客户名称
	private String customerName;
	//客户手机号码
	private String customerMobile;
	//客户创建时间
	private Date gmtCreate;
	//客户修改时间
	private Date gmtModified;

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
	 * 设置：客户名称
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	/**
	 * 获取：客户名称
	 */
	public String getCustomerName() {
		return customerName;
	}
	/**
	 * 设置：客户手机号码
	 */
	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}
	/**
	 * 获取：客户手机号码
	 */
	public String getCustomerMobile() {
		return customerMobile;
	}
	/**
	 * 设置：客户创建时间
	 */
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	/**
	 * 获取：客户创建时间
	 */
	public Date getGmtCreate() {
		return gmtCreate;
	}
	/**
	 * 设置：客户修改时间
	 */
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	/**
	 * 获取：客户修改时间
	 */
	public Date getGmtModified() {
		return gmtModified;
	}
}
