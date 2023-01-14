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
	private ProjectDB stddb;//db�� �������� �����ϰ� ������� �޾ƿ��� jdbcTemplateŬ���� 

	
	@RequestMapping(value = "/project/startPage.do", method = RequestMethod.GET)//ó�� ������ url 
	public String startpage(Model model) {//model�� ������ , return�ϸ� view�� jsp������ �����Ѵ�. 
		model.addAttribute("SusiAndJungsi_info","");//msg��� �̸��� Student��ü�� ����� 
		
		return "/project/startinput";//view�� stdinput.jsp �� ȣ�� v
	}
	
	
	@RequestMapping(value = "/project/startPage_click.do", method=RequestMethod.GET)//�Է¹��� ���� db�� �ѱ�� �� 
	public String choose_page(Model model, @RequestParam("SusiAndJungsi_info") String SusiAndJungsi_info) {
		System.out.println("startPage_click : "+SusiAndJungsi_info);
		
		if(SusiAndJungsi_info.equals("susi")) {//�����ϰ�� inner_type�� 1
			model.addAttribute("inner_type", 1);
//			inner_type = "susi";
//			model.addAttribute("isJungsi",false);

			
		}else if(SusiAndJungsi_info.equals("jungsi")){//�����ϰ�� inner_type�� 0
			model.addAttribute("inner_type", 0);
//			inner_type = "jungsi";
//			model.addAttribute("isJungsi", true);
		}
		
		return "/project/inputAndList";
	}
	
	
	//�������� ĳ���Ϳ� section�����޴� ��  
	@RequestMapping(value = "/project/susiRandomPoint.do", method = RequestMethod.GET)//ó�� ������ url  
	public String random_point(Model model) {//model�� ������ , return�ϸ� view�� jsp������ �����Ѵ�.
		//model.addAttribute("susi_Student",new Susi_Student());//msg��� �̸��� Student��ü�� ����� 
		
		return "/project/susiRandomPoint";//view�� stdinput.jsp �� ȣ�� v
	}
	
	
	//inner_type�� 1(����)�ϰ�� ����Ǵ� url 
	@RequestMapping(value = "/project/susi_stdinput.do", method = RequestMethod.POST)//ó�� ������ url  
	public String inputPage(Model model,
			@RequestParam("animal") String animal,
			@RequestParam("section") String section,
			@RequestParam("avg") int avg,
			@RequestParam("interviewer_max") String interviewer_max,
			@RequestParam("question") String question,
			@RequestParam("major") String major
			
			) {//model�� ������ , return�ϸ� view�� jsp������ �����Ѵ�.
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
		
		
		System.out.println(" ĳ���Ϳ� ���� �Ѱ��ذ� Ȯ�� " +std.getAnimal() + std.getInterview_section());
		
		model.addAttribute("susi_Student",std);//msg��� �̸��� Student��ü�� ����� 
		model.addAttribute("major_section",s);//msg��� �̸��� Student��ü�� ����� 
		
		
		return "/project/susiInputPage";//view�� stdinput.jsp �� ȣ�� v
	}
	
	/*
	 * //inner_type�� 1(����)�ϰ�� ����Ǵ� url
	 * 
	 * @RequestMapping(value = "/project/susi_stdinput.do", method =
	 * RequestMethod.GET)//ó�� ������ url public String inputPage(Model model) {//model��
	 * ������ , return�ϸ� view�� jsp������ �����Ѵ�. model.addAttribute("susi_Student",new
	 * Susi_Student());//msg��� �̸��� Student��ü�� �����
	 * 
	 * return "/project/susiInputPage";//view�� stdinput.jsp �� ȣ�� v }
	 */

	
	//�Է¹��� ������ Susi_student���� db�� �� ����  parent_job
	@RequestMapping(value = "/project/susi_resultPage.do", method = RequestMethod.POST)//ó�� ������ url 
	public String createPage(@ModelAttribute Susi_Student ret, Model model,
			@RequestParam("school_score") int school_score,
			@RequestParam("std_record") String std_record,
			@RequestParam("parent_job") String parent_job) {//model�� ������ , return�ϸ� view�� jsp������ �����Ѵ�. 
		
		ret.setInner_type("����");
		ret.setStd_record(std_record);
		ret.setSchool_score(school_score);
		ret.setParent_job(parent_job);
		
		model.addAttribute("susi_Student",ret);//msg��� �̸��� Student��ü�� ����� 
		stddb.create(ret);
		
		return "redirect:/project/susi_list.do";//view�� stdinput.jsp �� ȣ�� v
	}
	
	//db���� �����͸� ������ list�������� �����͸� ����ִ� �� 
	@RequestMapping(value = "/project/susi_list.do", method = RequestMethod.GET)//ó�� ������ url 
	public String resultPage(Model model) {//model�� ������ , return�ϸ� view�� jsp������ �����Ѵ�. 
		
		List<Susi_Student> susistdList = stddb.susiList_select();
		model.addAttribute("susistdList", susistdList);//std_cmd��� ���� std ������ ���� 
		//System.out.println(susistdList.get(0));
		
		return "/project/susi_list";//view�� stdinput.jsp �� ȣ�� v
	}
	
	//list���� id ��ũ Ŭ���� �ش� �л��� ���� ûŹ �ۼ�Ƽ���� ������ִ� view�� ȣ���ϴ� �� 
	@RequestMapping(value = "/project/calc.do", method = RequestMethod.GET)//ó�� ������ url 
	public String calcPage(Model model, @RequestParam(value="id", required=true) String id) {
		
		//�л� ���� �������� ��
		System.out.println(id);
		Susi_Student susistd = stddb.susiStudent_select(id);//db���� �ش� id�� ���� �л� ������ ������ 
		model.addAttribute("susistd", susistd);
		
		//�а� ���� �������� ��
		System.out.println("major_num : "+susistd.getMajor());
		major_list major = stddb.major_select(susistd.getMajor());
		model.addAttribute("major", major);

		//�ش� �а� section ���� �������� ��
		System.out.println("interview_section : " + susistd.getInterview_section());
		Major_section section  = stddb.section_select(susistd.getMajor(), susistd.getInterview_section());
		model.addAttribute("section", section);
		System.out.println("section Id = " + section.getInterviewer_id() + " question = " + section.getInterview_question());
		
		//������ ���� �������� ��
		System.out.println("interviewer_id : "+section.getInterviewer_id());
		interviewer_list interviewer  = stddb.interviewer_select(section.getInterviewer_id());
		model.addAttribute("interviewer", interviewer);

		return "/project/result";//view�� stdinput.jsp �� ȣ�� v
	}
	
	
	
//	@RequestMapping(value = "/week13/stdcinput.do", method=RequestMethod.POST)//�Է¹��� ���� db�� �ѱ�� �� 
//	public String stdinput(@ModelAttribute Student ret, Model model) {
//		model.addAttribute("msg", ret);
//		stddb.create(ret);//db�� �Է��� ������ ���� �߰�
////		return "/week13/result";
////		
//		return "redirect:/week13/std_list.do";
//		
//	}


}
