package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 产品表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 17:35:37
 */
public class ProductEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//产品id
	private Integer id;
	//产品名称
	private String name;
	//产品描述
	private String describe;
	//产品单位
	private String unit;
	//产品价格
	private Integer price;

	/**
	 * 设置：产品id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：产品id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：产品名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：产品名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：产品描述
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	/**
	 * 获取：产品描述
	 */
	public String getDescribe() {
		return describe;
	}
	/**
	 * 设置：产品单位
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * 获取：产品单位
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * 设置：产品价格

	 */
	public void setPrice(Integer price) {
		this.price = price;
	}
	/**
	 * 获取：产品价格

	 */
	public Integer getPrice() {
		return price;
	}
}
