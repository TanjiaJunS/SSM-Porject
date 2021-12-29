package com.work.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.work.entity.Banner;
import com.work.mapper.BannerDao;
import com.work.service.BannerService;

@Service
public class BannerServiceImpl implements BannerService {
	@Resource
	private BannerDao bannerDao;

	//获取轮播图的总数
	public int getBannerListCount(Banner banner) {
		return bannerDao.getBannerListCount(banner);
	}

	//获取轮播图列表
	public List<Banner> getBannerList(Banner banner, Integer page, Integer limit) {
		return bannerDao.getBannerList(banner,page,limit);
	}

	//通过id获取轮播图对象
	public Banner getBannerById(Integer id) {
		return bannerDao.getBannerById(id);
	}

	//编辑轮播
	public void updateBanner(Banner banner) {
		bannerDao.updateBanner(banner);
		
	}

	//删除轮播
	public void deleteBanner(Banner banner) {
		bannerDao.deleteBanner(banner);
		
	}

	//新增轮播图
	public void addBanner(Banner banner) {
		bannerDao.addBanner(banner);
		
	}

	//获取轮播图列表
	public List<Banner> getBannerList1() {
		return bannerDao.getBannerList1();
	}
	
	
	
	
}
