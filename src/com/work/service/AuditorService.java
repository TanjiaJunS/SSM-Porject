package com.work.service;

import java.util.List;

import com.work.entity.Auditor;
import com.work.entity.Student;

public interface AuditorService {
	//查询用户
	public Auditor getUserById(String user_id);
	
	//更新用户密码
	public void updateUser(Auditor user);
	
	//console页面的图表的数据
	public List<List<Integer>> dataLoadingList();
	
	//获取审核人员总数
	public int getAuditorListCount(Auditor auditor);
	
	//获取审核人员列表
	public List<Student> getAuditorList(Auditor auditor, Integer page, Integer limit);
	
	//编辑审核人员信息
	public void updateAuditor(Auditor auditor);
	
	//删除审核人员账号
	public void deleteAuditorByUser_id(String user_id);
	
	//新建审核账号
	public void addAuditor(Auditor auditor);

}
