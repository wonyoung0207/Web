package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.major_list;


//DB에서 사용되는 데이터 형 타입과 자바의 데이터형 타입을 일치시키기 위한 클래스
//자바와 DB의 데이터 타입을 맞추는 과정이 필요할때 사용되는 클래스로, RowMapper를 implements 사용해서 만든다.  
public class MajorMapper implements RowMapper<major_list>{

	@Override
	public major_list mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		major_list major = new major_list();
		major.setMajor_num(rs.getString("major_num"));
		major.setName(rs.getString("name"));
		major.setSusi_pass_score(rs.getInt("susi_pass_score"));
		major.setJungsi_pass_score(rs.getInt("jungsi_pass_score"));
		major.setAll_student_avg_score(rs.getInt("all_student_avg_score"));

		return major;
	}


}
