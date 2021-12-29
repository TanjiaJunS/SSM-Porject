package com.work.entity;

import java.util.Date;

public class Notice {
	private int id;
	private String title;
	private String content;
	private String image;
	private Date create_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getCreat_time() {
		return create_time;
	}
	public void setCreat_time(Date creat_time) {
		this.create_time = creat_time;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", content=" + content + ", image=" + image + ", creat_time="
				+ create_time + "]";
	}
	
	
}
