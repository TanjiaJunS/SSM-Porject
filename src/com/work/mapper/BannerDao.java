package com.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.work.entity.Banner;

public interface BannerDao {
	
	//获取轮播图的总数
	public int getBannerListCount(@Param("banner")Banner banner);
	
	//获取轮播图列表
	public List<Banner> getBannerList(@Param("banner")Banner banner, @Param("page")Integer page,@Param("limit") Integer limit);

	//通过id获取轮播图对象
	public Banner getBannerById(@Param("id")Integer id);

	//编辑轮播
	public void updateBanner(@Param("banner")Banner banner);

	//删除轮播
	public void deleteBanner(@Param("banner")Banner banner);

	//新增轮播图
	public void addBanner(@Param("banner")Banner banner);

	//获取轮播图列表
	public List<Banner> getBannerList1();

}
