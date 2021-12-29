package com.work.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.work.entity.Student;

public interface StudentService {
	//获取学生总数
	Integer getStudentListCount(Student student);
	//获取学生列表
	List<Student> getStudentList(Student student, Integer page, Integer limit);
	//根据考生号查找学生
	Student getStudentByStudent_id(String student_id);
	//更新学生信息
	void updateStudent(Student student);
	//通过考生号删除学生
	void deleteStudentByStudent_id(String student_id);
	//增加学生
	void addStudent(Student student);
	//上传excel
	boolean upLoadExcel(MultipartFile file, HttpServletRequest request, HttpServletResponse response)throws Exception;
	//统计县区数
	Integer countCounty();
}
