package com.work.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.entity.Auditor;
import com.work.entity.Student;
import com.work.service.AuditorService;
import com.work.service.StudentService;


/**
 * @author 26464
 * @方法 用户登录管理
 */
@Controller
@RequestMapping("/auditor")
public class AuditorController {
	@Autowired
	private AuditorService auditorService;
	@Autowired
	private StudentService studentService;
	//错误信息输出
	private BaseUtil baseUtil = new BaseUtil();
	
	
	@RequestMapping("/dologin")
	public void doLogin(HttpServletRequest request, HttpServletResponse response, Auditor user) throws Exception {
		Auditor serverUser = (Auditor) request.getSession().getAttribute("serverUser");
		if(serverUser == null){
			if(user.getUser_id() == null){
				baseUtil.output(response,JsonUtil.buildFalseJson(1,"账号不能为空"));
	          }else{
	        	  if(user.getPassword().equals("") || user.getPassword() == null){	        		  
	        		  baseUtil.output(response,JsonUtil.buildFalseJson(1,"密码不能为空"));
	        	  }else{
	        		  Auditor userInfo = auditorService.getUserById(user.getUser_id());
	        		  if(userInfo == null){        	
	        			  baseUtil.output(response,JsonUtil.buildFalseJson(1,"账号不正确或系统不存在该用户"));
	        		  }else{
	        			  if(!userInfo.getPassword().equals(user.getPassword())){
	        				  baseUtil.output(response,JsonUtil.buildFalseJson(1,"您输入的密码不正确,请重试")); 
	        			  }else{
	        					  //执行登陆后台的逻辑
	        				  	  //设置一个session
	        					  request.getSession().setAttribute("serverUser",userInfo);
	        					  baseUtil.output(response, JsonUtil.buildFalseJson(0, "登陆成功,欢迎登录外迁子女高考资格审核系统"));
	        				  }
	        			  }
	        		  }
	        	  }
	          }
		else{
			baseUtil.output(response, JsonUtil.buildFalseJson(0, "登陆成功,欢迎登录外迁子女高考资格审核系统"));
		}
		
	}
	
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 去到管理页面
	 */
	@RequestMapping("/goManager")
	public ModelAndView goHome(ModelAndView mv, HttpServletRequest request) {
		Auditor serverUser = (Auditor) request.getSession().getAttribute("serverUser");
		if (serverUser == null) { // 已退出
			mv.setViewName("login");
		} else {
			mv.setViewName("mainPage");
		}
		mv.addObject("serverUser", serverUser);
		return mv;
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 去到登录页面
	 */
	@RequestMapping("/goLogin")
	public ModelAndView goLogin(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 去管理页面主页面
	 */
	@RequestMapping("/goConsole")
	public ModelAndView goConsole(ModelAndView mv) {
		List<List<Integer>> lists = auditorService.dataLoadingList();
		Auditor auditor = new Auditor();
		auditor.setLevel(-1);
		int auditorCount = auditorService.getAuditorListCount(auditor)-1;//审核人员总人数
		int countyCount = studentService.countCounty();//县区数
		
		mv.addObject("auditorCount",auditorCount);
		mv.addObject("countyCount",countyCount);
		mv.addObject("lists",lists);
		mv.setViewName("console");
		return mv;
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 登出管理页面
	 */
	@RequestMapping("/dologout")
	public void managerLogOut(ModelAndView modelView, HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		baseUtil.output(response, JsonUtil.buildFalseJson(0, "退出成功"));
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 进入修改密码页面
	 */
	@RequestMapping("/goUpdatePassword")
	public ModelAndView goUpdatePassword(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("updatePwd");
		return mv;
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 修改密码
	 */
	@RequestMapping("/updatePassword") 
	public void updatePassword(HttpServletRequest request,HttpServletResponse response,String rePassword, String password){
		Auditor serverUser = (Auditor) request.getSession().getAttribute("serverUser");
		Auditor user = new Auditor();
		if(password.equals(rePassword)){
			user.setUser_id(serverUser.getUser_id());
			user.setPassword(password);
			auditorService.updateUser(user);
			request.getSession().invalidate();
			baseUtil.output(response,JsonUtil.buildFalseJson(0, "修改密码成功"));
		}else{
			baseUtil.output(response,JsonUtil.buildFalseJson(1, "前后密码不一致"));
		}
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 去到审核人员列表页面
	 */
	@RequestMapping("/goAuditorList")
	public ModelAndView goAuditorList(ModelAndView mv, HttpServletRequest request) {
		Auditor serverUser = (Auditor) request.getSession().getAttribute("serverUser");
		if (serverUser == null) { // 已退出
			mv.setViewName("login");
		} else {
			mv.setViewName("auditorManager");
		}
		mv.addObject("serverUser", serverUser);
		return mv;
	}
	
	/**
	 * @param mv
	 * @return mv
	 * @功能 获得审核人员列表
	 */
	@RequestMapping("/getAuditorList")
	public void getAuditorList(HttpServletResponse response,Auditor auditor,Integer page,Integer limit){	
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = auditorService.getAuditorListCount(auditor);
		List<Student> list = auditorService.getAuditorList(auditor,(page-1) * limit, limit);	
		baseUtil.output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
		}
	
	//去审核人员信息编辑页面
	@RequestMapping("/goUpdateAuditor")
	public ModelAndView goUpdateAuditor(ModelAndView mv,String user_id, HttpServletRequest request) {
		Auditor serverUser = (Auditor) request.getSession().getAttribute("serverUser");
		Auditor auditor = auditorService.getUserById(user_id);
		mv.addObject("serverUser",serverUser);
		mv.addObject("auditor",auditor);
		mv.setViewName("updateAuditor");
		return mv;
	}
	
	//编辑审核人员信息
	@RequestMapping("/updateAuditor")
	public void updateAuditor(HttpServletResponse response,Auditor auditor) {
		System.out.println(auditor.toString());
		auditorService.updateAuditor(auditor);
		baseUtil.output(response, JsonUtil.buildFalseJson(0, "编辑成功"));
	}
	
	//删除审核人员账号
	@RequestMapping("/deleteAuditor")
	public void deleteAuditor(HttpServletResponse response,String user_id) {
		auditorService.deleteAuditorByUser_id(user_id);
		baseUtil.output(response, JsonUtil.buildFalseJson(0, "删除成功"));
	}
	
	//去新建审核账号页面
	@RequestMapping("/goAddAuditor")
	public ModelAndView goAddAuditor(ModelAndView mv,HttpServletRequest request) {
		Auditor serverUser = (Auditor)request.getSession().getAttribute("serverUser");
		if (serverUser == null) { // 已退出
			mv.setViewName("login");
		} else {
			mv.setViewName("addAuditor");
		}
		mv.addObject("serverUser", serverUser);
		return mv;
	}
	
	//新建审核账号
	@RequestMapping("addAuditor")
	public void addAuditor(HttpServletResponse response,Auditor auditor) {
		Auditor auditor2 = auditorService.getUserById(auditor.getUser_id());
		if(auditor2 == null ) {
			auditorService.addAuditor(auditor);
			baseUtil.output(response,JsonUtil.buildFalseJson(0, "创建成功"));
		}else {
			baseUtil.output(response,JsonUtil.buildFalseJson(1, "账号已存在，请更换"));
		}
	}

}
