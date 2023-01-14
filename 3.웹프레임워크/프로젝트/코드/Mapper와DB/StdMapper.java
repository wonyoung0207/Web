package com.myspring.ahn.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.myspring.ahn.Student;
import com.myspring.ahn.Susi_Student;


//DB���� ���Ǵ� ������ �� Ÿ�԰� �ڹ��� �������� Ÿ���� ��ġ��Ű�� ���� Ŭ����
//�ڹٿ� DB�� ������ Ÿ���� ���ߴ� ������ �ʿ��Ҷ� ���Ǵ� Ŭ������, RowMapper�� implements ����ؼ� �����.  
public class StdMapper implements RowMapper<Student>{

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		//RowMapper ��� Ŭ������ mapRow�� �����ε� �ؼ� ���
		// ResultSet�� ��û�� ���� ������� ���� 
		// rowNum�� ���ڵ�(��)�� ������ ����ȴ�. 
		
		Student std = new Student();
		std.setSeq(rs.getInt("seq"));
		std.setAge(rs.getInt("age"));
		std.setId(rs.getString("id"));
		std.setName(rs.getString("name"));
		
		return std;
	}
	

}


