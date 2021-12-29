package com.work.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.work.entity.SystemInfo;
import com.work.mapper.SystemDao;
import com.work.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService {
	@Resource
	private SystemDao systemDao;

	//获取系统信息
	public SystemInfo getSystemInfo() {
		return systemDao.getSystemInfo();
	}

	//更改系统信息
	public void updateSysInfo(SystemInfo systemInfo) {
		systemDao.updateSysInfo(systemInfo);
	}
}
