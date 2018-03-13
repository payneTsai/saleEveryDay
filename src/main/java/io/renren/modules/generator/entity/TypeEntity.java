package io.renren.modules.generator.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 销售类型
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:16
 */
public class TypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//销售类型id
	private Integer id;
	//销售类型名称
	private String typeName;

	/**
	 * 设置：销售类型id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：销售类型id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：销售类型名称
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	/**
	 * 获取：销售类型名称
	 */
	public String getTypeName() {
		return typeName;
	}
}
