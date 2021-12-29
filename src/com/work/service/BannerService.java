package com.work.service;

import java.util.List;

import com.work.entity.Banner;

public interface BannerService {
	
	//获取轮播图的总数
	public int getBannerListCount(Banner banner);
	
	//获取轮播图列表
	public List<Banner> getBannerList(Banner banner, Integer page, Integer limit);

	//通过id获取轮播图对象
	public Banner getBannerById(Integer id);

	//编辑轮播
	public void updateBanner(Banner banner);

	//删除轮播
	public void deleteBanner(Banner banner);

	//新增轮播图
	public void addBanner(Banner banner);
	
	//获取轮播图列表
	public List<Banner> getBannerList1();

}
