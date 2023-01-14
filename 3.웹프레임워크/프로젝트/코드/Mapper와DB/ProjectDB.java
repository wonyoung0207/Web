package com.myspring.ahn.db;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.myspring.ahn.Major_section;
import com.myspring.ahn.Susi_Student;
import com.myspring.ahn.interviewer_list;
import com.myspring.ahn.major_list;

@Component
public class ProjectDB {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
		
	}
	
	public void create(Susi_Student std) {//DB�� �����͸� ����Ѵ�. 
		String sql = "INSERT INTO susi_student (id, animal, inner_type, std_record, school_score, interview_section, major, interview_score, parent_job) values(?,?,?,?,?,?,?,?,?)";
		// insert�� �������� �ʵ忡 ���� �����Ҷ� �ʵ���� �����Ҽ� ������, �ϳ��� �ʵ忡 ���� ������쿡��
		// �ʵ���� �� ������Ѵ�. 
		
		jdbcTemplate.update(sql,
				std.getId(), std.getAnimal(), std.getInner_type(), std.getStd_record(),std.getSchool_score(), 
				std.getInterview_section(), std.getMajor(),std.getInterview_score(), std.getParent_job());
		// jdbcTemplate�� ����ؼ� update�� �����Ѵ�. �׶� ����� sql�� value�� ���� ������ ���� �����ش�. 
		
	}
	
	public void major_section_create(Major_section s) {//DB�� �����͸� ����Ѵ�. 
		String sql = "INSERT INTO major_section (major_id, section_name, interviewer_id, interview_question) values(?,?,?,?)";
		// insert�� �������� �ʵ忡 ���� �����Ҷ� �ʵ���� �����Ҽ� ������, �ϳ��� �ʵ忡 ���� ������쿡��
		// �ʵ���� �� ������Ѵ�. 
		
		jdbcTemplate.update(sql,s.getMajor_id(),s.getSection_name(),
				s.getInterviewer_id(),s.getInterview_question());
		// jdbcTemplate�� ����ؼ� update�� �����Ѵ�. �׶� ����� sql�� value�� ���� ������ ���� �����ش�. 
		
	}
	
	
	
	
	//���� �л� ����Ʈ ��ȸ
	public List<Susi_Student> susiList_select(){//db�� �ִ� �ڷ���� list�������� �����´�. 
		String sql = "select * from susi_student";
		//jdbcTemplate.query �� �������� ��� ��(Row��)�� ó���� �� �ִ� �޼ҵ� 
		List<Susi_Student> susistd_list = jdbcTemplate.query(sql, new ProjectMapper());
		
		return susistd_list;
	}
	
	//���� �л�list���� �Ű�����id�� �ش��ϴ� �л� ������ �������� ��
	public Susi_Student susiStudent_select(String id){
		
		String sql = "select * from susi_student where id=?";
		Susi_Student std = jdbcTemplate.queryForObject(sql, new Object[] {id}, new ProjectMapper());
		return std;
	}
	
	//�а� ����list���� �ش� �а��� �ڷḸ ������ �� �ִ� �� 
	public major_list major_select(String major){
		
		String sql = "select * from major_list where major_num=?";
		major_list _major = jdbcTemplate.queryForObject(sql, new Object[] {major}, new MajorMapper());
		return _major;
	}
	
	
	//������ �������� �ش� ������ ���� �������� �� 
	public interviewer_list interviewer_select(String interviewer_id){
		
		String sql = "select * from interviewer_list where interviewer_id=?";
		interviewer_list _interviewer = jdbcTemplate.queryForObject(sql, new Object[] {interviewer_id}, new InterviewerMapper());
		return _interviewer;
	}
	
	
	//���� section ���� �������°� 
	public Major_section section_select(String major_id, String section){
		
		String sql = "select * from major_section where major_id=?";
		Major_section _section = jdbcTemplate.queryForObject(sql, new Object[] {major_id+section}, new MajorSectionMapper());
		return _section;
	}


	
//	//�л� ��ȸ ����Ʈ - ����
//	public Student select(int seq) {// �Ű������� �Ѿ�� seq�� �ش��ϴ� student ������ db���� �����´�.  
//		String sql = "select * from student where seq=?";
//		Student std = jdbcTemplate.queryForObject(sql, new Object[] {seq}, new StdMapper());
//		//jdbcTemplate.queryForObject �� query�� �ٸ��� �Ѱ��� object�� ó���� �� ����Ѵ�. 
//		//seq�� �ش��ϴ� �������� object�����̹Ƿ� �迭�� �����´�. 
//		return std;
//		
//	}
//	
//	public void update(Student std) {//���� �� ������Ʈ�Ǿ��ϱ� ������ 
//		String sql = "update student set id=?, name=?, age=? where seq=?";
//		jdbcTemplate.update(sql, std.getId(), std.getName(), std.getAge(),std.getSeq());
//		
//	}
//	
//	public int delete(int seq) {//seq�� �ش��ϴ� �����͸� ����� �� 
//		String sql = "delete from student where seq=?";
//		return jdbcTemplate.update(sql, seq);
//		
//	}

}
