package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Major_section;
import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB���� ���Ǵ� ������ �� Ÿ�԰� �ڹ��� �������� Ÿ���� ��ġ��Ű�� ���� Ŭ����
//�ڹٿ� DB�� ������ Ÿ���� ���ߴ� ������ �ʿ��Ҷ� ���Ǵ� Ŭ������, RowMapper�� implements ����ؼ� �����.  
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
