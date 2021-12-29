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
import com.work.service.BannerService;



@Controller
@RequestMapping("/banner")
public class BannerController {
	
	@Autowired
	private BannerService bannerService;
	public BaseUtil BaseUtil = new BaseUtil();
	
	//去轮播列表
	@RequestMapping("/goBannerList")
	public ModelAndView goBannerList(ModelAndView mv){
		mv.setViewName("bannerManager");
		return mv;
	}
	
	//获取轮播列表
	@RequestMapping("/getBannerList")
	public void getBannerList(HttpServletResponse response,Banner banner,Integer page,Integer limit){
		
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = bannerService.getBannerListCount(banner);
		List<Banner> list = bannerService.getBannerList(banner,(page-1) * limit, limit);
		BaseUtil.output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去编辑轮播页面
	@RequestMapping("/goUpdateBanner")
	public ModelAndView goUpdateBanner(ModelAndView mv,Integer id){
		Banner banner = bannerService.getBannerById(id);
		mv.addObject("banner", banner);
		mv.setViewName("updateBanner");
		return mv;
	}
	
	//编辑轮播
	@RequestMapping("/updateBanner")
	public void updateBanner(HttpServletResponse response,Banner banner){
		System.out.println(banner.toString());
		bannerService.updateBanner(banner);
		BaseUtil.output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
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
	
	//删除轮播
	@RequestMapping("/deleteBanner")
	public void deleteBanner(HttpServletResponse response,Banner banner) {
		bannerService.deleteBanner(banner);
		BaseUtil.output(response, JsonUtil.buildFalseJson(0, "删除成功"));
	}
	
	//去新增轮播页面
	@RequestMapping("/goAddBanner")
	public ModelAndView goAddBanner(ModelAndView mv) {
		mv.setViewName("addBanner");
		return mv;
	}
	
	//新增轮播图
	@RequestMapping("/addBanner")
	public void addBanner(HttpServletResponse response,Banner banner) {
		banner.setCreat_time(new Date());
		bannerService.addBanner(banner);
		BaseUtil.output(response,JsonUtil.buildFalseJson(0, "添加成功！"));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
