package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB���� ���Ǵ� ������ �� Ÿ�԰� �ڹ��� �������� Ÿ���� ��ġ��Ű�� ���� Ŭ����
//�ڹٿ� DB�� ������ Ÿ���� ���ߴ� ������ �ʿ��Ҷ� ���Ǵ� Ŭ������, RowMapper�� implements ����ؼ� �����.  
public class ProjectMapper implements RowMapper<Susi_Student>{

	@Override
	public Susi_Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		//RowMapper ��� Ŭ������ mapRow�� �����ε� �ؼ� ���
		// ResultSet�� ��û�� ���� ������� ���� 
		// rowNum�� ���ڵ�(��)�� ������ ����ȴ�. 
		
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
