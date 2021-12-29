package com.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.entity.Student;
import com.work.service.StudentService;


@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	//错误信息输出
	private BaseUtil baseUtil = new BaseUtil();
	
	//去学生列表页面
	@RequestMapping("/goStudentList")
	public ModelAndView goStudentList(ModelAndView mv){
		mv.setViewName("studentManage");
		return mv;
	}
	
	//获取学生列表
	@RequestMapping("/getStudentList")
	public void getStudentList(HttpServletResponse response,Student student,Integer page,Integer limit){	
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = studentService.getStudentListCount(student);
		List<Student> list = studentService.getStudentList(student,(page-1) * limit, limit);	
		baseUtil.output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
		}
	
	//去学生信息编辑页面
	@RequestMapping("/goUpdateStudent")
	public ModelAndView goUpdateStudent(ModelAndView mv,String student_id) {
		Student student = studentService.getStudentByStudent_id(student_id);
		mv.addObject("student",student);
		mv.setViewName("updateStudent");
		return mv;
	}
	
	//编辑学生信息
	@RequestMapping("/updateStudent")
	public void updateStudent(HttpServletResponse response,Student student) {
		studentService.updateStudent(student);
		baseUtil.output(response, JsonUtil.buildFalseJson(0, "编辑成功！"));
	}
	
	//删除学生
	@RequestMapping("/deleteStudent")
	public void deleteStudent(HttpServletResponse response,String student_id) {
		studentService.deleteStudentByStudent_id(student_id);
		baseUtil.output(response, JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	//去新增学生页面
	@RequestMapping("/goAddStudent")
	public ModelAndView goAddStudent(ModelAndView mv) {
		Student student = new Student();
		student.setPoint_add(-1);
		int totalCount = studentService.getStudentListCount(student)+1; //获取学生总数+1
		mv.addObject("id",totalCount);
		mv.setViewName("addStudent");
		return mv;
	}
	
	//新增学生
	@RequestMapping("/addStudent")
	public void addStudent(HttpServletRequest request,HttpServletResponse response,Student student) {
		Student student2 = studentService.getStudentByStudent_id(student.getStudent_id());
		if(student2 == null) {
			studentService.addStudent(student);
			baseUtil.output(response, JsonUtil.buildFalseJson(0, "添加成功！"));
		}else {
			baseUtil.output(response, JsonUtil.buildFalseJson(-1, "考生号重复！"));
		}
		
	}
	
	//上传excel文件
	@RequestMapping("/upLoadExcel")
	public void upLoadExcel(@RequestParam("file")MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag = studentService.upLoadExcel(file,request,response);
		if(flag) {
			baseUtil.output(response, JsonUtil.buildFalseJson(0, "上传成功！"));
		}else {
			baseUtil.output(response, JsonUtil.buildFalseJson(1, "上传失败！"));
		}
		
	}
	

}
