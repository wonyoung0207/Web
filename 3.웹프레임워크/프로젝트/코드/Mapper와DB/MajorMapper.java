package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.major_list;


//DB���� ���Ǵ� ������ �� Ÿ�԰� �ڹ��� �������� Ÿ���� ��ġ��Ű�� ���� Ŭ����
//�ڹٿ� DB�� ������ Ÿ���� ���ߴ� ������ �ʿ��Ҷ� ���Ǵ� Ŭ������, RowMapper�� implements ����ؼ� �����.  
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
