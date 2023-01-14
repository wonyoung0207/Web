package com.myspring.ahn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.ahn.db.ProjectDB;


@Controller
public class projectController {
	
	@Autowired
	private ProjectDB stddb;//db에 쿼리문을 전달하고 결과값을 받아오는 jdbcTemplate클래스 

	
	@RequestMapping(value = "/project/startPage.do", method = RequestMethod.GET)//처음 시작할 url 
	public String startpage(Model model) {//model은 데이터 , return하면 view의 jsp파일을 실행한다. 
		model.addAttribute("SusiAndJungsi_info","");//msg라는 이름에 Student객체가 저장됨 
		
		return "/project/startinput";//view의 stdinput.jsp 를 호출 v
	}
	
	
	@RequestMapping(value = "/project/startPage_click.do", method=RequestMethod.GET)//입력받은 값을 db로 넘기는 곳 
	public String choose_page(Model model, @RequestParam("SusiAndJungsi_info") String SusiAndJungsi_info) {
		System.out.println("startPage_click : "+SusiAndJungsi_info);
		
		if(SusiAndJungsi_info.equals("susi")) {//수시일경우 inner_type이 1
			model.addAttribute("inner_type", 1);
//			inner_type = "susi";
//			model.addAttribute("isJungsi",false);

			
		}else if(SusiAndJungsi_info.equals("jungsi")){//정시일경우 inner_type이 0
			model.addAttribute("inner_type", 0);
//			inner_type = "jungsi";
//			model.addAttribute("isJungsi", true);
		}
		
		return "/project/inputAndList";
	}
	
	
	//랜덤으로 캐릭터와 section배정받는 곳  
	@RequestMapping(value = "/project/susiRandomPoint.do", method = RequestMethod.GET)//처음 시작할 url  
	public String random_point(Model model) {//model은 데이터 , return하면 view의 jsp파일을 실행한다.
		//model.addAttribute("susi_Student",new Susi_Student());//msg라는 이름에 Student객체가 저장됨 
		
		return "/project/susiRandomPoint";//view의 stdinput.jsp 를 호출 v
	}
	
	
	//inner_type이 1(수시)일경우 실행되는 url 
	@RequestMapping(value = "/project/susi_stdinput.do", method = RequestMethod.POST)//처음 시작할 url  
	public String inputPage(Model model,
			@RequestParam("animal") String animal,
			@RequestParam("section") String section,
			@RequestParam("avg") int avg,
			@RequestParam("interviewer_max") String interviewer_max,
			@RequestParam("question") String question,
			@RequestParam("major") String major
			
			) {//model은 데이터 , return하면 view의 jsp파일을 실행한다.
		Susi_Student std = new Susi_Student();
		std.setAnimal(animal);
		std.setInterview_section(section);
		std.setInterview_score(avg);
		std.setMajor(major);

		
		Major_section s = new Major_section();
		s.setMajor_id(major + section);
		s.setSection_name(section);
		s.setInterview_question(question);
		s.setInterviewer_id(interviewer_max);
		stddb.major_section_create(s);
		
		
		System.out.println(" 캐릭터와 섹션 넘겨준거 확인 " +std.getAnimal() + std.getInterview_section());
		
		model.addAttribute("susi_Student",std);//msg라는 이름에 Student객체가 저장됨 
		model.addAttribute("major_section",s);//msg라는 이름에 Student객체가 저장됨 
		
		
		return "/project/susiInputPage";//view의 stdinput.jsp 를 호출 v
	}
	
	/*
	 * //inner_type이 1(수시)일경우 실행되는 url
	 * 
	 * @RequestMapping(value = "/project/susi_stdinput.do", method =
	 * RequestMethod.GET)//처음 시작할 url public String inputPage(Model model) {//model은
	 * 데이터 , return하면 view의 jsp파일을 실행한다. model.addAttribute("susi_Student",new
	 * Susi_Student());//msg라는 이름에 Student객체가 저장됨
	 * 
	 * return "/project/susiInputPage";//view의 stdinput.jsp 를 호출 v }
	 */

	
	//입력받은 값으로 Susi_student형을 db에 값 저장  parent_job
	@RequestMapping(value = "/project/susi_resultPage.do", method = RequestMethod.POST)//처음 시작할 url 
	public String createPage(@ModelAttribute Susi_Student ret, Model model,
			@RequestParam("school_score") int school_score,
			@RequestParam("std_record") String std_record,
			@RequestParam("parent_job") String parent_job) {//model은 데이터 , return하면 view의 jsp파일을 실행한다. 
		
		ret.setInner_type("수시");
		ret.setStd_record(std_record);
		ret.setSchool_score(school_score);
		ret.setParent_job(parent_job);
		
		model.addAttribute("susi_Student",ret);//msg라는 이름에 Student객체가 저장됨 
		stddb.create(ret);
		
		return "redirect:/project/susi_list.do";//view의 stdinput.jsp 를 호출 v
	}
	
	//db에서 데이터를 가져와 list형식으로 데이터를 띄워주는 곳 
	@RequestMapping(value = "/project/susi_list.do", method = RequestMethod.GET)//처음 시작할 url 
	public String resultPage(Model model) {//model은 데이터 , return하면 view의 jsp파일을 실행한다. 
		
		List<Susi_Student> susistdList = stddb.susiList_select();
		model.addAttribute("susistdList", susistdList);//std_cmd라는 곳에 std 정보를 저장 
		//System.out.println(susistdList.get(0));
		
		return "/project/susi_list";//view의 stdinput.jsp 를 호출 v
	}
	
	//list에서 id 링크 클릭시 해당 학생에 대한 청탁 퍼센티지를 출력해주는 view를 호출하는 곳 
	@RequestMapping(value = "/project/calc.do", method = RequestMethod.GET)//처음 시작할 url 
	public String calcPage(Model model, @RequestParam(value="id", required=true) String id) {
		
		//학생 정보 가저오는 곳
		System.out.println(id);
		Susi_Student susistd = stddb.susiStudent_select(id);//db에서 해당 id에 대한 학생 정보를 가져옴 
		model.addAttribute("susistd", susistd);
		
		//학과 정보 가저오는 곳
		System.out.println("major_num : "+susistd.getMajor());
		major_list major = stddb.major_select(susistd.getMajor());
		model.addAttribute("major", major);

		//해당 학과 section 정보 가저오는 곳
		System.out.println("interview_section : " + susistd.getInterview_section());
		Major_section section  = stddb.section_select(susistd.getMajor(), susistd.getInterview_section());
		model.addAttribute("section", section);
		System.out.println("section Id = " + section.getInterviewer_id() + " question = " + section.getInterview_question());
		
		//면접관 정보 가저오는 곳
		System.out.println("interviewer_id : "+section.getInterviewer_id());
		interviewer_list interviewer  = stddb.interviewer_select(section.getInterviewer_id());
		model.addAttribute("interviewer", interviewer);

		return "/project/result";//view의 stdinput.jsp 를 호출 v
	}
	
	
	
//	@RequestMapping(value = "/week13/stdcinput.do", method=RequestMethod.POST)//입력받은 값을 db로 넘기는 곳 
//	public String stdinput(@ModelAttribute Student ret, Model model) {
//		model.addAttribute("msg", ret);
//		stddb.create(ret);//db에 입력한 데이터 새로 추가
////		return "/week13/result";
////		
//		return "redirect:/week13/std_list.do";
//		
//	}


}
