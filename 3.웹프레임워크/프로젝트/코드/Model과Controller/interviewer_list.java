package com.myspring.ahn;

public class interviewer_list {
	
	private String interviewer_id;//면접관 고유 id
	private String name;//면접관 이름 
	private String job;// 면접관 직업
	private int child_age; // 면접관 자녀 이름 
	
	
	public String getInterviewer_id() {
		return interviewer_id;
	}
	public void setInterviewer_id(String interviewer_id) {
		this.interviewer_id = interviewer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getChild_age() {
		return child_age;
	}
	public void setChild_age(int child_age) {
		this.child_age = child_age;
	}
	
	@Override
	public String toString() {
		return "interviewer_list [interviewer_id=" + interviewer_id + ", name=" + name + ", job=" + job + ", child_age=" + child_age + "]";
	}
}
