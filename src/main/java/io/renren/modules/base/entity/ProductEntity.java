package io.renren.modules.base.entity;

import java.io.Serializable;


/**
 * 
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-01-09 19:56:42
 */
public class ProductEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//员工id
	private Long productId;
	//
	private String productName;
	//
	private String productDescribe;
	//
	private String productUnit;
	//
	private Double productPrice;

	/**
	 * 设置：员工id
	 */
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	/**
	 * 获取：员工id
	 */
	public Long getProductId() {
		return productId;
	}
	/**
	 * 设置：
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * 获取：
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * 设置：
	 */
	public void setProductDescribe(String productDescribe) {
		this.productDescribe = productDescribe;
	}
	/**
	 * 获取：
	 */
	public String getProductDescribe() {
		return productDescribe;
	}
	/**
	 * 设置：
	 */
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	/**
	 * 获取：
	 */
	public String getProductUnit() {
		return productUnit;
	}
	/**
	 * 设置：
	 */
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	/**
	 * 获取：
	 */
	public Double getProductPrice() {
		return productPrice;
	}
}
