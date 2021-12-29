package com.work.service.Impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.work.common.utils.ExcelUtil;
import com.work.entity.Student;
import com.work.mapper.StudentDao;
import com.work.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService {

	@Resource
	private StudentDao studentDao;

	//获取学生总数
	public Integer getStudentListCount(Student student) {
		return studentDao.getStudentListCount(student);
	}

	//获取学生列表
	public List<Student> getStudentList(Student student, Integer page, Integer limit) {
		return studentDao.getStudentList(student,page,limit);
	}

	//根据考生号查找学生
	public Student getStudentByStudent_id(String student_id) {
		
		return studentDao.getStudentByStudent_id(student_id);
	}

	//更新学生信息
	public void updateStudent(Student student) {
		studentDao.updateStudent(student);
	}

	//通过考生号删除学生
	public void deleteStudentByStudent_id(String student_id) {
		studentDao.deleteStudentByStudent_id(student_id);
	}

	//增加学生
	public void addStudent(Student student) {
		studentDao.addStudent(student);
		
	}

	//上传excel文件
	public boolean upLoadExcel(MultipartFile file, HttpServletRequest request, HttpServletResponse response)throws Exception {
		//file即接收到的excel文件
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        //将文件流导入
        InputStream in = null;
        try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
        List<List<Object>> listob = null;
        try {
			listob = new ExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//取出对象，并存入数据库
        for(int i = 0 ; i < listob.size();i++) {
        	if(listob.get(i) != null) {
        		List<Object> lo = listob.get(i);
            	Student student = new Student();
            	if(lo.get(0) != null && lo.get(0) != "") {
            		student.setId(Integer.valueOf( (String) lo.get(0)));
            	}
            	student.setName((String) lo.get(1));
            	student.setGender((String) lo.get(2));
            	student.setStudent_id((String) lo.get(3));
            	student.setCard_id((String) lo.get(4));
            	if(lo.get(5) != null && lo.get(0) != "") {
            		student.setPoint_add(Integer.valueOf((String) lo.get(5)));
            	}
            	student.setCity((String) lo.get(6));
            	student.setCounty((String) lo.get(7));
            	student.setNote((String) lo.get(8));
            	studentDao.addStudent(student);
        	}
        } 
		return true;	
	}

	//统计县区数
	public Integer countCounty() {
		return studentDao.countCounty();
		
	}
	
	
	
}
