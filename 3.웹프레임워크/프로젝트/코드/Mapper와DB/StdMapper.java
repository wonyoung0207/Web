package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB에서 사용되는 데이터 형 타입과 자바의 데이터형 타입을 일치시키기 위한 클래스
//자바와 DB의 데이터 타입을 맞추는 과정이 필요할때 사용되는 클래스로, RowMapper를 implements 사용해서 만든다.  
public class StdMapper implements RowMapper<Student>{

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		//RowMapper 라는 클래스의 mapRow를 오버로딩 해서 사용
		// ResultSet은 요청에 대한 결과값이 있음 
		// rowNum은 레코드(행)의 갯수가 저장된다. 
		
		Student std = new Student();
		std.setSeq(rs.getInt("seq"));
		std.setAge(rs.getInt("age"));
		std.setId(rs.getString("id"));
		std.setName(rs.getString("name"));
		
		return std;
	}
	

}


