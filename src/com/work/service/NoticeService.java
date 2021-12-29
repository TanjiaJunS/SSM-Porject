package com.work.service;

import java.util.List;

import com.work.entity.Notice;

public interface NoticeService {

	//获取公告总数
	public int getNoticeListCount(Notice notice);
	
	//获取公告列表
	public List<Notice> getNoticeList(Notice notice, Integer page, Integer limit);

	//添加公告
	public void addNotice(Notice notice);

	//根据id获取公告
	public Notice getNoticeById(Integer id);

	//编辑公告
	public void updateNotice(Notice notice);

	//根据id删除公告
	public void deleteNoticeById(Integer id);

}
