package com.myspring.ahn;

public class Susi_Student {


	private String id;//배정 수험번호
	private String animal;//랜덤 배정 캐릭터 이름  
	private String inner_type;// 수시인지 정시인지
	private String std_record;//생활기록부
	private int school_score;//내신점수
	private String interview_section;// 면접을 본 그룹 이름 
	private String major;//신청 학과 이름 
	private int interview_score;// 면접 점수 
	private String parent_job;//부모님 직업 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getStd_record() {
		return std_record;
	}
	public void setStd_record(String std_record) {
		this.std_record = std_record;
	}
	public String getInner_type() {
		return inner_type;
	}
	public void setInner_type(String inner_type) {
		this.inner_type = inner_type;
	}
	public int getSchool_score() {
		return school_score;
	}
	public void setSchool_score(int school_score) {
		this.school_score = school_score;
	}
	public String getInterview_section() {
		return interview_section;
	}
	public void setInterview_section(String interview_section) {
		this.interview_section = interview_section;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getInterview_score() {
		return interview_score;
	}
	public void setInterview_score(int interview_score) {
		this.interview_score = interview_score;
	}
	public String getParent_job() {
		return parent_job;
	}
	public void setParent_job(String parent_job) {
		this.parent_job = parent_job;
	}
	
	@Override
	public String toString() {
		return "Susi_Student [id=" + id + ", animal=" + animal + ", inner_type=" + inner_type + ", std_record="
				+ std_record + ", school_score=" + school_score + ", interview_section=" + interview_section
				+ ", major=" + major + ", interview_score=" + interview_score + ", parent_job=" + parent_job + "]";
	}


}
