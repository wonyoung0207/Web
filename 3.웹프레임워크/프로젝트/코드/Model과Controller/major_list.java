package com.myspring.ahn;

public class major_list {


	private String major_num;//�а� ���� ��ȣ
	private String name;//�а� �̸� 
	private int susi_pass_score;//�ش� �а� ���⵵ ���� �հ� ��
	private int jungsi_pass_score;//�ش� �а� ���⵵ ���� �հ� �� 
	private int all_student_avg_score;// �ش� section�� ��� ����� ���������� ���
	
	
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
