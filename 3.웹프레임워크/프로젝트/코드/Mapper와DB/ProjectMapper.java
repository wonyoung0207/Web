package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB에서 사용되는 데이터 형 타입과 자바의 데이터형 타입을 일치시키기 위한 클래스
//자바와 DB의 데이터 타입을 맞추는 과정이 필요할때 사용되는 클래스로, RowMapper를 implements 사용해서 만든다.  
public class ProjectMapper implements RowMapper<Susi_Student>{

	@Override
	public Susi_Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		//RowMapper 라는 클래스의 mapRow를 오버로딩 해서 사용
		// ResultSet은 요청에 대한 결과값이 있음 
		// rowNum은 레코드(행)의 갯수가 저장된다. 
		
		Susi_Student std = new Susi_Student();
		std.setId(rs.getString("id"));
		std.setAnimal(rs.getString("animal"));
		std.setInner_type(rs.getString("inner_type"));
		std.setStd_record(rs.getString("std_record"));
		std.setSchool_score(rs.getInt("school_score"));
		std.setInterview_section(rs.getString("interview_section"));
		std.setMajor(rs.getString("major"));
		std.setInterview_score(rs.getInt("interview_score"));
		std.setParent_job(rs.getString("parent_job"));
		
		return std;
	}


}
