package com.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.work.entity.Student;

public interface StudentDao {
	//获取学生总数
	int getStudentListCount(@Param("student")Student student);
	//获取学生列表
	List<Student> getStudentList(@Param("student")Student student, @Param("page")Integer page, @Param("limit")Integer limit);
	//根据考生号查找学生
	Student getStudentByStudent_id(@Param("student_id")String student_id);
	//更新学生信息
	void updateStudent(@Param("student")Student student);
	//通过考生号删除学生
	void deleteStudentByStudent_id(@Param("student_id")String student_id);
	//增加学生
	void addStudent(@Param("student")Student student);
	//根据省市/县区查询学生数量
    int getStudentListCounterByCityOrCounty(@Param("city")String city,@Param("county")String county);
    //统计县区数
	Integer countCounty();
	
    

}
