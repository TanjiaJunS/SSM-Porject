package com.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.work.entity.Auditor;
import com.work.entity.Student;

public interface AuditorDao {
	//查询用户
	public Auditor getUserById(String user_id);
	
	//更新用户密码
	public void updateUser(@Param("user")Auditor user);
	
	//获取审核人员总数
	public int getAuditorListCount(@Param("auditor")Auditor auditor);
	
	//获取审核人员列表
	public List<Student> getAuditorList(@Param("auditor")Auditor auditor, @Param("page")Integer page, @Param("limit")Integer limit);
	
	//编辑审核人员信息
	public void updateAuditor(@Param("auditor")Auditor auditor);
	
	//删除审核人员账号
	public void deleteAuditorByUser_id(@Param("user_id")String user_id);
	
	//新建审核账号
	public void addAuditor(@Param("auditor")Auditor auditor);

}
