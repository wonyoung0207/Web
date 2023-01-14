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
	
	public void create(Susi_Student std) {//DB에 데이터를 등록한다. 
		String sql = "INSERT INTO susi_student (id, animal, inner_type, std_record, school_score, interview_section, major, interview_score, parent_job) values(?,?,?,?,?,?,?,?,?)";
		// insert시 여러개의 필드에 값을 저장할때 필드명을 생략할수 있지만, 하나의 필드에 값을 넣을경우에는
		// 필드명을 꼭 써줘야한다. 
		
		jdbcTemplate.update(sql,
				std.getId(), std.getAnimal(), std.getInner_type(), std.getStd_record(),std.getSchool_score(), 
				std.getInterview_section(), std.getMajor(),std.getInterview_score(), std.getParent_job());
		// jdbcTemplate를 사용해서 update를 진행한다. 그때 사용할 sql과 value로 넣을 값들을 같이 보내준다. 
		
	}
	
	public void major_section_create(Major_section s) {//DB에 데이터를 등록한다. 
		String sql = "INSERT INTO major_section (major_id, section_name, interviewer_id, interview_question) values(?,?,?,?)";
		// insert시 여러개의 필드에 값을 저장할때 필드명을 생략할수 있지만, 하나의 필드에 값을 넣을경우에는
		// 필드명을 꼭 써줘야한다. 
		
		jdbcTemplate.update(sql,s.getMajor_id(),s.getSection_name(),
				s.getInterviewer_id(),s.getInterview_question());
		// jdbcTemplate를 사용해서 update를 진행한다. 그때 사용할 sql과 value로 넣을 값들을 같이 보내준다. 
		
	}
	
	
	
	
	//수시 학생 리스트 조회
	public List<Susi_Student> susiList_select(){//db에 있는 자료들을 list형식으로 가져온다. 
		String sql = "select * from susi_student";
		//jdbcTemplate.query 는 여러개의 결과 값(Row값)을 처리할 수 있는 메소드 
		List<Susi_Student> susistd_list = jdbcTemplate.query(sql, new ProjectMapper());
		
		return susistd_list;
	}
	
	//수시 학생list에서 매개변수id에 해당하는 학생 정보만 가져오는 곳
	public Susi_Student susiStudent_select(String id){
		
		String sql = "select * from susi_student where id=?";
		Susi_Student std = jdbcTemplate.queryForObject(sql, new Object[] {id}, new ProjectMapper());
		return std;
	}
	
	//학과 정보list에서 해당 학과의 자료만 가져올 수 있는 곳 
	public major_list major_select(String major){
		
		String sql = "select * from major_list where major_num=?";
		major_list _major = jdbcTemplate.queryForObject(sql, new Object[] {major}, new MajorMapper());
		return _major;
	}
	
	
	//면접관 정보에서 해당 면접관 정보 가져오는 곳 
	public interviewer_list interviewer_select(String interviewer_id){
		
		String sql = "select * from interviewer_list where interviewer_id=?";
		interviewer_list _interviewer = jdbcTemplate.queryForObject(sql, new Object[] {interviewer_id}, new InterviewerMapper());
		return _interviewer;
	}
	
	
	//면접 section 정보 가져오는곳 
	public Major_section section_select(String major_id, String section){
		
		String sql = "select * from major_section where major_id=?";
		Major_section _section = jdbcTemplate.queryForObject(sql, new Object[] {major_id+section}, new MajorSectionMapper());
		return _section;
	}


	
//	//학생 조회 리스트 - 개별
//	public Student select(int seq) {// 매개변수로 넘어온 seq에 해당하는 student 정보만 db에서 가져온다.  
//		String sql = "select * from student where seq=?";
//		Student std = jdbcTemplate.queryForObject(sql, new Object[] {seq}, new StdMapper());
//		//jdbcTemplate.queryForObject 은 query와 다르게 한개의 object를 처리할 떄 사용한다. 
//		//seq에 해당하는 정보들은 object형식이므로 배열로 가져온다. 
//		return std;
//		
//	}
//	
//	public void update(Student std) {//삭제 후 업데이트되야하기 때문에 
//		String sql = "update student set id=?, name=?, age=? where seq=?";
//		jdbcTemplate.update(sql, std.getId(), std.getName(), std.getAge(),std.getSeq());
//		
//	}
//	
//	public int delete(int seq) {//seq에 해당하는 데이터를 지우는 곳 
//		String sql = "delete from student where seq=?";
//		return jdbcTemplate.update(sql, seq);
//		
//	}

}
