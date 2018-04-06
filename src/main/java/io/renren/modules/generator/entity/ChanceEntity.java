package io.renren.modules.generator.entity;

import java.io.Serializable;



/**
 * 销售机会
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-05 16:07:07
 */
public class ChanceEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//用户id
	private Integer userId;
	//线索id
	private Integer cluesId;

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
	 * 设置：用户id
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户id
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * 设置：线索id
	 */
	public void setCluesId(Integer cluesId) {
		this.cluesId = cluesId;
	}
	/**
	 * 获取：线索id
	 */
	public Integer getCluesId() {
		return cluesId;
	}
}
