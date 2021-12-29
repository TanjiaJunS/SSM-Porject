package com.work.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.work.entity.Auditor;
import com.work.entity.Student;
import com.work.mapper.AuditorDao;
import com.work.mapper.StudentDao;
import com.work.service.AuditorService;
@Service
public class AuditorServiceImpl implements AuditorService {
	String[] city = {"贵阳市","遵义市","铜仁市","安顺市","毕节市","六盘水市","黔东南州","黔西南州"};
	String[][] county = {{"南明区","云岩区","花溪区","乌当区","白云区"},{"红花岗区","汇川区"},{"碧江区"},{"西秀区","平坝区"},{"大方县","黔西县"},{"钟山区","六枝特区"},{"黄平县","凯里市"},{"安龙县","兴仁县"}};

	@Resource
	private AuditorDao auditorDao;
	@Resource
	private StudentDao studentDao;
	
	//查询用户
	public Auditor getUserById(String user_id) {
		return auditorDao.getUserById(user_id);
	}

	//更新用户密码
	public void updateUser(Auditor user) {
		auditorDao.updateUser(user);
	}

	//console页面的图表的数据
	public List<List<Integer>> dataLoadingList() {
		List<List<Integer>> lists = new ArrayList<List<Integer>>();
		List<Integer> list1 = new ArrayList<Integer>();
		List<Integer> list2 = new ArrayList<Integer>();
		List<Integer> list3 = new ArrayList<Integer>();
		List<Integer> list4 = new ArrayList<Integer>();
		List<Integer> list5 = new ArrayList<Integer>();
		List<Integer> list6 = new ArrayList<Integer>();
		List<Integer> list7 = new ArrayList<Integer>();
		List<Integer> list8 = new ArrayList<Integer>();
		Student student = new Student();
		student.setPoint_add(-1);
		//总人数
		list1.add(studentDao.getStudentListCount(student));
		//贵阳市学生总数
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], null));
		//各县区人数
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], county[0][0]));
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], county[0][1]));
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], county[0][2]));
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], county[0][3]));
		list1.add(studentDao.getStudentListCounterByCityOrCounty(city[0], county[0][4]));
		lists.add(list1);
		
		//遵义市学生总数
		list2.add(studentDao.getStudentListCounterByCityOrCounty(city[1], null));
		//各县区人数
		list2.add(studentDao.getStudentListCounterByCityOrCounty(city[1], county[1][0]));
		list2.add(studentDao.getStudentListCounterByCityOrCounty(city[1], county[1][1]));
		lists.add(list2);
		
		//铜仁市学生总数
		list3.add(studentDao.getStudentListCounterByCityOrCounty(city[2], null));
		//各县区人数
		list3.add(studentDao.getStudentListCounterByCityOrCounty(city[2], county[2][0]));
		lists.add(list3);
		
		//安顺市学生总数
		list4.add(studentDao.getStudentListCounterByCityOrCounty(city[3], null));
		//各县区人
		list4.add(studentDao.getStudentListCounterByCityOrCounty(city[3], county[3][0]));
		list4.add(studentDao.getStudentListCounterByCityOrCounty(city[3], county[3][1]));
		lists.add(list4);
				
		//毕节市学生总数
		list5.add(studentDao.getStudentListCounterByCityOrCounty(city[4], null));
		//各县区人数
		list5.add(studentDao.getStudentListCounterByCityOrCounty(city[4], county[4][0]));
		list5.add(studentDao.getStudentListCounterByCityOrCounty(city[4], county[4][1]));
		lists.add(list5);
		
		//六盘水市学生总数
		list6.add(studentDao.getStudentListCounterByCityOrCounty(city[5], null));
		//各县区人数
		list6.add(studentDao.getStudentListCounterByCityOrCounty(city[5], county[5][0]));
		list6.add(studentDao.getStudentListCounterByCityOrCounty(city[5], county[5][1]));
		lists.add(list6);
				
		//黔东南州学生总数
		list7.add(studentDao.getStudentListCounterByCityOrCounty(city[6], null));
		//各县区人数
		list7.add(studentDao.getStudentListCounterByCityOrCounty(city[6], county[6][0]));
		list7.add(studentDao.getStudentListCounterByCityOrCounty(city[6], county[6][1]));
		lists.add(list7);
				
		//黔西南州学生总数
		list8.add(studentDao.getStudentListCounterByCityOrCounty(city[7], null));
		//各县区人数
		list8.add(studentDao.getStudentListCounterByCityOrCounty(city[7], county[7][0]));
		list8.add(studentDao.getStudentListCounterByCityOrCounty(city[7], county[7][1]));
		lists.add(list8);
		
		List<Integer> list9 = new ArrayList<Integer>();
		Student s1 = new Student();
		s1.setGender("男");
		s1.setPoint_add(-1);
		list9.add(studentDao.getStudentListCount(s1));
		s1.setGender("女");
		list9.add(studentDao.getStudentListCount(s1));
		lists.add(list9);
		
		List<Integer> list10 = new ArrayList<Integer>();
		Student s2 = new Student();
		s2.setPoint_add(10);
		list10.add(studentDao.getStudentListCount(s2));
		s2.setPoint_add(0);
		list10.add(studentDao.getStudentListCount(s2));
		lists.add(list10);
		
		return lists;
	}

	//获取审核人员总数
	public int getAuditorListCount(Auditor auditor) {
		return auditorDao.getAuditorListCount(auditor);
	}

	//获取审核人员列表
	public List<Student> getAuditorList(Auditor auditor, Integer page, Integer limit) {
		return auditorDao.getAuditorList(auditor,page,limit);
	}

	//编辑审核人员信息
	public void updateAuditor(Auditor auditor) {
		auditorDao.updateAuditor(auditor);
		
	}

	//删除审核人员账号
	public void deleteAuditorByUser_id(String user_id) {
		auditorDao.deleteAuditorByUser_id(user_id);
		
	}

	//新建审核账号
	public void addAuditor(Auditor auditor) {
		auditorDao.addAuditor(auditor);
		
	}
	
}
