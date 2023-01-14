package com.myspring.ahn;

public class Major_section {
	
	private String major_id;//학과 고유 번호 
	private String section_name;//section 이름 => Farm
	private String interviewer_id;//가장 높은 점수를 준 면접관 id
	private String interview_question;//면접에서 나온 질문 
	//private int score_avg;//현재 section 에서 면접점수 평균 점수 
	

	public String getMajor_id() {
		return major_id;
	}
	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
	public String getSection_name() {
		return section_name;
	}
	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}
	public String getInterviewer_id() {
		return interviewer_id;
	}
	public void setInterviewer_id(String interviewer_id) {
		this.interviewer_id = interviewer_id;
	}
	public String getInterview_question() {
		return interview_question;
	}
	public void setInterview_question(String interview_question) {
		this.interview_question = interview_question;
	}
//	public int getScore_avg() {
//		return score_avg;
//	}
//	public void setScore_avg(int score_avg) {
//		this.score_avg = score_avg;
//	}
	
//	@Override
//	public String toString() {
//		return "Major_section [major_id=" + major_id + ", section_name=" + section_name + ", interviewer_id="
//				+ interviewer_id + ", interview_question=" + interview_question + ", score_avg=" + score_avg + "]";
//	}
	
	@Override
	public String toString() {
		return "Major_section [major_id=" + major_id + ", section_name=" + section_name + ", interviewer_id="
				+ interviewer_id + ", interview_question=" + interview_question + "]";
	}
}
