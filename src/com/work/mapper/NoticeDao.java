package com.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.work.entity.Notice;

public interface NoticeDao {

	//获取公告总数
	int getNoticeListCount(@Param("notice")Notice notice);

	//获取公告列表
	public List<Notice> getNoticeList(@Param("notice")Notice notice,@Param("page")Integer page, @Param("limit")Integer limit);

	//添加公告
	public void addNotice(@Param("notice")Notice notice);

	//根据id获取公告
	public Notice getNoticeById(@Param("id")Integer id);

	//编辑公告
	public void updateNotice(@Param("notice")Notice notice);

	//根据id删除公告
	void deleteNoticeById(@Param("id")Integer id);

	
}
