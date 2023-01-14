package com.myspring.ahn;

public class jungsi_Student {
	
	private String id;
	private String name;
	private int age;
	private int seq;
	
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public int getAge() {return age;}
	public void setAge(int age) {this.age = age;}
	
	public int getSeq() {return seq;}
	public void setSeq(int seq) {this.seq = seq;}
	
	
//	public String toString() {
//		return "Student [id = " + id + ", name = " + name + ", age = " + age + "]";
//	}
	
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", seq=" + seq + "]";
	}


	

}
