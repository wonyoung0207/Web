package com.myspring.ahn;

public class major_list {


	private String major_num;//학과 고유 번호
	private String name;//학과 이름 
	private int susi_pass_score;//해당 학과 전년도 내신 합격 컷
	private int jungsi_pass_score;//해당 학과 전년도 수능 합격 컷 
	private int all_student_avg_score;// 해당 section의 모든 수험생 면접점수의 평균
	
	
	public String getMajor_num() {
		return major_num;
	}
	public void setMajor_num(String major_num) {
		this.major_num = major_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSusi_pass_score() {
		return susi_pass_score;
	}
	public void setSusi_pass_score(int susi_pass_score) {
		this.susi_pass_score = susi_pass_score;
	}
	public int getJungsi_pass_score() {
		return jungsi_pass_score;
	}
	public void setJungsi_pass_score(int jungsi_pass_score) {
		this.jungsi_pass_score = jungsi_pass_score;
	}
	public int getAll_student_avg_score() {
		return all_student_avg_score;
	}
	public void setAll_student_avg_score(int all_student_avg_score) {
		this.all_student_avg_score = all_student_avg_score;
	}
	
	@Override
	public String toString() {
		return "major_list [major_num=" + major_num + ", name=" + name + ", susi_pass_score=" + susi_pass_score
				+ ", jungsi_pass_score=" + jungsi_pass_score + ", all_student_avg_score=" + all_student_avg_score + "]";
	}
	
	

}
