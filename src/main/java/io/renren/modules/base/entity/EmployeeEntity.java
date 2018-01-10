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
public class EmployeeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//员工id
	private Long empId;
	//员工姓名
	private String empName;
	//员工密码
	private String empPassword;
	//员工邮箱
	private String empEmail;
	//员工手机号码
	private String empMoblie;
	//员工最后一次登录时间
	private Date lastLogin;
	//员工创建时间
	private Date gmtCreate;
	//员工修改时间
	private Date gmtModified;

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
	 * 设置：员工姓名
	 */
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	/**
	 * 获取：员工姓名
	 */
	public String getEmpName() {
		return empName;
	}
	/**
	 * 设置：员工密码
	 */
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	/**
	 * 获取：员工密码
	 */
	public String getEmpPassword() {
		return empPassword;
	}
	/**
	 * 设置：员工邮箱
	 */
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	/**
	 * 获取：员工邮箱
	 */
	public String getEmpEmail() {
		return empEmail;
	}
	/**
	 * 设置：员工手机号码
	 */
	public void setEmpMoblie(String empMoblie) {
		this.empMoblie = empMoblie;
	}
	/**
	 * 获取：员工手机号码
	 */
	public String getEmpMoblie() {
		return empMoblie;
	}
	/**
	 * 设置：员工最后一次登录时间
	 */
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	/**
	 * 获取：员工最后一次登录时间
	 */
	public Date getLastLogin() {
		return lastLogin;
	}
	/**
	 * 设置：员工创建时间
	 */
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	/**
	 * 获取：员工创建时间
	 */
	public Date getGmtCreate() {
		return gmtCreate;
	}
	/**
	 * 设置：员工修改时间
	 */
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	/**
	 * 获取：员工修改时间
	 */
	public Date getGmtModified() {
		return gmtModified;
	}
}
