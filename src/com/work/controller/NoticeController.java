package com.work.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.entity.Notice;
import com.work.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	//错误信息输出
	private BaseUtil baseUtil = new BaseUtil();
	
	//去公告管理页面
	@RequestMapping("/goNoticeList")
	public ModelAndView goNoticeList(ModelAndView mv) {
		mv.setViewName("noticeManage");
		return mv;
	}
	
	//获取公告列表
	@RequestMapping("/getNoticeList")
	public void getNoticeList(HttpServletResponse response,Notice notice,Integer page,Integer limit) {
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = noticeService.getNoticeListCount(notice);
		List<Notice> list = noticeService.getNoticeList(notice,(page-1) * limit, limit);
		baseUtil.output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去添加公告
	@RequestMapping("/goAddNotice")
	public ModelAndView goAddNotice(ModelAndView mv){
		mv.setViewName("addNotice");
		return mv;
	}
	
	//添加公告
	@RequestMapping("/addNotice")
	public void addNotice(HttpServletResponse response,Notice notice) {
		notice.setCreat_time(new Date());
		noticeService.addNotice(notice);
		baseUtil.output(response,JsonUtil.buildFalseJson(0, "添加成功！"));
	}
	
	//去编辑公告页面
	@RequestMapping("/goUpdateNotice")
	public ModelAndView goUpdateNotice(ModelAndView mv,Integer id) {
		Notice notice = noticeService.getNoticeById(id);
		mv.addObject("notice", notice);
		mv.setViewName("updateNotice");
		return mv;
	}
	
	//编辑公告
	@RequestMapping("/updateNotice")
	public void updateNotice(HttpServletResponse response,Notice notice) {
		noticeService.updateNotice(notice);
		baseUtil.output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}
	
	//删除公告
	@RequestMapping("/deleteNotice")
	public void deleteNotice(HttpServletResponse response,Integer id) {
		noticeService.deleteNoticeById(id);
		baseUtil.output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
}
