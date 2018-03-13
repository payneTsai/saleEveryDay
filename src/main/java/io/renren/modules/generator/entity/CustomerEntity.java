package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 客户表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
public class CustomerEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//客户id
	private Integer id;
	//客户名称
	private String name;
	//客户手机号
	private String mobile;
	//客户所在地址
	private String address;
	//客户公司
	private String business;
	//客户邮箱
	private String email;

	/**
	 * 设置：客户id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：客户id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：客户名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：客户名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：客户手机号
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：客户手机号
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：客户所在地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：客户所在地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：客户公司
	 */
	public void setBusiness(String business) {
		this.business = business;
	}
	/**
	 * 获取：客户公司
	 */
	public String getBusiness() {
		return business;
	}
	/**
	 * 设置：客户邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：客户邮箱
	 */
	public String getEmail() {
		return email;
	}
}
