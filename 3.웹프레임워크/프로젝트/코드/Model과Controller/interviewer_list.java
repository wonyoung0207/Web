package com.myspring.ahn;

public class interviewer_list {
	
	private String interviewer_id;//������ ���� id
	private String name;//������ �̸� 
	private String job;// ������ ����
	private int child_age; // ������ �ڳ� �̸� 
	
	
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
