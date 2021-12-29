package com.work.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.work.entity.Notice;
import com.work.mapper.NoticeDao;
import com.work.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	private NoticeDao noticeDao;

	//获取公告总数
	public int getNoticeListCount(Notice notice) {
		return noticeDao.getNoticeListCount(notice);
	}

	//获取公告列表
	public List<Notice> getNoticeList(Notice notice, Integer page, Integer limit) {
		return noticeDao.getNoticeList(notice,page,limit);
	}

	//添加公告
	public void addNotice(Notice notice) {
		noticeDao.addNotice(notice);
		
	}

	//根据id获取公告
	public Notice getNoticeById(Integer id) {
		return noticeDao.getNoticeById(id);
	}

	//编辑公告
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
		
	}

	//根据id删除公告
	public void deleteNoticeById(Integer id) {
		noticeDao.deleteNoticeById(id);
		
	}
}
