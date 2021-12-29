package com.work.service;

import com.work.entity.SystemInfo;

public interface SystemService {

	//获取系统信息
	public SystemInfo getSystemInfo();

	//更改系统信息
	public void updateSysInfo(SystemInfo systemInfo);

}
