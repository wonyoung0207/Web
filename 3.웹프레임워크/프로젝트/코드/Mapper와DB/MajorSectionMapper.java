package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Major_section;
import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB에서 사용되는 데이터 형 타입과 자바의 데이터형 타입을 일치시키기 위한 클래스
//자바와 DB의 데이터 타입을 맞추는 과정이 필요할때 사용되는 클래스로, RowMapper를 implements 사용해서 만든다.  
public class MajorSectionMapper implements RowMapper<Major_section>{

	@Override
	public Major_section mapRow(ResultSet rs, int rowNum) throws SQLException {

		Major_section major_section = new Major_section();
		major_section.setMajor_id(rs.getString("major_id"));
		major_section.setSection_name(rs.getString("section_name"));
		major_section.setInterviewer_id(rs.getString("interviewer_id"));
		major_section.setInterview_question(rs.getString("interview_question"));
		//major_section.setScore_avg(rs.getInt("score_avg"));
		

		return major_section;
	}
	

}
