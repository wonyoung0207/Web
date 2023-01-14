package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.interviewer_list;



//DB���� ���Ǵ� ������ �� Ÿ�԰� �ڹ��� �������� Ÿ���� ��ġ��Ű�� ���� Ŭ����
//�ڹٿ� DB�� ������ Ÿ���� ���ߴ� ������ �ʿ��Ҷ� ���Ǵ� Ŭ������, RowMapper�� implements ����ؼ� �����.  
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
