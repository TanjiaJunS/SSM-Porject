package com.work.mapper;

import org.apache.ibatis.annotations.Param;

import com.work.entity.SystemInfo;

public interface SystemDao {

	//获取系统信息
	public SystemInfo getSystemInfo();

	//更改系统信息
	public void updateSysInfo(@Param("systemInfo")SystemInfo systemInfo);

}
