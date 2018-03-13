package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 市场线索表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:15
 */
public class CluesEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//市场销售表
	private Integer id;
	//产品表Id
	private Integer productId;
	//客户表id
	private Integer customerId;
	//销售类型id
	private Integer typeId;

	/**
	 * 设置：市场销售表
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：市场销售表
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：产品表Id
	 */
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	/**
	 * 获取：产品表Id
	 */
	public Integer getProductId() {
		return productId;
	}
	/**
	 * 设置：客户表id
	 */
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	/**
	 * 获取：客户表id
	 */
	public Integer getCustomerId() {
		return customerId;
	}
	/**
	 * 设置：销售类型id
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	/**
	 * 获取：销售类型id
	 */
	public Integer getTypeId() {
		return typeId;
	}
}
