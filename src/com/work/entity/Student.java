package com.work.entity;

public class Student {
	private int id;
	private String name;         //姓名
	private String gender;       //性别
	private String student_id;   //考号
	private String card_id;      //身份证后六位
	private int point_add;       //加分
	private String city;         //省市
	private String county;       //县区
	private String note;         //备注
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public int getPoint_add() {
		return point_add;
	}
	public void setPoint_add(int point_add) {
		this.point_add = point_add;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", gender=" + gender + ", student_id=" + student_id
				+ ", card_id=" + card_id + ", point_add=" + point_add + ", city=" + city + ", county=" + county
				+ ", note=" + note + "]";
	}
	
	
}
