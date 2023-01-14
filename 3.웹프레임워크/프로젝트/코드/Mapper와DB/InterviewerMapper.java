package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.interviewer_list;



//DB에서 사용되는 데이터 형 타입과 자바의 데이터형 타입을 일치시키기 위한 클래스
//자바와 DB의 데이터 타입을 맞추는 과정이 필요할때 사용되는 클래스로, RowMapper를 implements 사용해서 만든다.  
public class InterviewerMapper implements RowMapper<interviewer_list>{

	@Override
	public interviewer_list mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		interviewer_list interviewer = new interviewer_list();
		interviewer.setInterviewer_id(rs.getString("interviewer_id"));
		interviewer.setName(rs.getString("name"));
		interviewer.setJob(rs.getString("job"));
		interviewer.setChild_age(rs.getInt("child_age"));
		

		return interviewer;
	}

}
