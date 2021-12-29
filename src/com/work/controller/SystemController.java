package com.work.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.entity.Banner;
import com.work.entity.Notice;
import com.work.entity.SystemInfo;
import com.work.service.BannerService;
import com.work.service.NoticeService;
import com.work.service.SystemService;

@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Autowired
	private BannerService bannerService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private NoticeService noticeService;
	BaseUtil BaseUtil =new BaseUtil();
	
	//去前台页面
	@RequestMapping("goShowPage")
	public ModelAndView goShowPage(ModelAndView mv) {
		List<Banner> banners =  bannerService.getBannerList1();//轮播图
		SystemInfo systemInfo = systemService.getSystemInfo();//系统信息
		Notice notice = new Notice();
		notice.setId(-1);
		Notice notice2 = noticeService.getNoticeList(notice, 0, 10).get(0);//公告
		mv.addObject("systemInfo", systemInfo);
		mv.addObject("banners", banners);
		mv.addObject("notice", notice2);
		mv.setViewName("show");
		return mv;
	}
	
	//去系统信息设置页面
	@RequestMapping("/goSystemSetting")
	public ModelAndView goSystemSetting(ModelAndView mv) {
		SystemInfo system = systemService.getSystemInfo();
		mv.addObject("system", system);
		mv.setViewName("systemSetting");
		return mv;
	}
	
	//上传图片
	@RequestMapping("/uploadImage")
	public void uploadImage(@RequestParam("file")CommonsMultipartFile file,HttpServletRequest request,HttpServletResponse response)throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");  //设置时间格式
		String respJson = null;
		if(file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空！");
			BaseUtil.output(response, respJson);
			return;
		}
		if(file.getSize()>5000000) { //5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大于5M!");
			BaseUtil.output(response, respJson);
			return;
		}
		Date now = new Date();
		String random =  UUID.randomUUID().toString().replace("-", "").substring(0, 5);  //生成一个随机图片名
		String houzui =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());//获取图片后缀
		String filename = format.format(now)+random+houzui;//图片名
		String path = request.getServletContext().getRealPath("/")+"images"+"/"+filename;//图片在项目中的路径
		
		String contextPath = request.getContextPath();//项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();//配置端口号
		String url = request.getScheme()+"://"+request.getServerName()+port+contextPath+"/images/"+filename;//图片全路径
			
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		BaseUtil.output(response, respJson);;
	}
		
	//更改系统信息
	@RequestMapping("/updateSysInfo")
	public void updateSysInfo(HttpServletResponse response,SystemInfo systemInfo) {
		systemInfo.setTime(new Date());
		System.out.println(systemInfo.toString());
		systemService.updateSysInfo(systemInfo);
		BaseUtil.output(response, JsonUtil.buildFalseJson(0, "更改成功"));
	}

}
